#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <iostream>

#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
#include <thrust/window_2d.h>

#ifdef RD_WG_SIZE_0_0
        #define BLOCK_SIZE RD_WG_SIZE_0_0
#elif defined(RD_WG_SIZE_0)
        #define BLOCK_SIZE RD_WG_SIZE_0
#elif defined(RD_WG_SIZE)
        #define BLOCK_SIZE RD_WG_SIZE
#else
        #define BLOCK_SIZE 16
#endif

#define STR_SIZE 256

/* maximum power density possible (say 300W for a 10mm x 10mm chip)	*/
#define MAX_PD	(3.0e6)
/* required precision in degrees	*/
#define PRECISION	0.001
#define SPEC_HEAT_SI 1.75e6
#define K_SI 100
/* capacitance fitting factor	*/
#define FACTOR_CHIP	0.5

#define AMBIENT_TEMP 80

/* chip parameters	*/
float t_chip = 0.0005;
float chip_height = 0.016;
float chip_width = 0.016;
/* ambient temperature, assuming no package at all	*/
float amb_temp = 80.0;

void run(int argc, char** argv);

/* define timer macros */
#define pin_stats_reset()   startCycle()
#define pin_stats_pause(cycles)   stopCycle(cycles)
#define pin_stats_dump(cycles)    printf("timer: %Lu\n", cycles)

void fatal(char *s)
{
	fprintf(stderr, "error: %s\n", s);

}

void writeoutput(thrust::host_vector<float> vect, int grid_rows, int grid_cols, char *file){
	int i,j, index=0;
	FILE *fp;
	char str[STR_SIZE];

	if( (fp = fopen(file, "w" )) == 0 )
        printf( "The file was not opened\n" );


	for (i=0; i < grid_rows; i++)
	 for (j=0; j < grid_cols; j++)
	 {

		sprintf(str, "%d\t%g\n", index, vect[i*grid_cols+j]);
		fputs(str,fp);
		index++;
	 }

      fclose(fp);
}


void readinput(float * vect, int grid_rows, int grid_cols, char *file){

  	int i,j;
	FILE *fp;
	char str[STR_SIZE];
	float val;

	if( (fp  = fopen(file, "r" )) ==0 )
        printf( "The file was not opened\n" );


	for (i=0; i <= grid_rows-1; i++)
	 for (j=0; j <= grid_cols-1; j++)
	 {
		fgets(str, STR_SIZE, fp);
		if (feof(fp))
			fatal((char *)"not enough lines in file");
		//if ((sscanf(str, "%d%f", &index, &val) != 2) || (index != ((i-1)*(grid_cols-2)+j-1)))
		if ((sscanf(str, "%f", &val) != 1))
			fatal((char *)"invalid file format");
		vect[i*grid_cols+j] = val;
	}

	fclose(fp);

}

#define IN_RANGE(x, min, max)   ((x)>=(min) && (x)<=(max))
#define CLAMP_RANGE(x, min, max) x = (x<(min)) ? min : ((x>(max)) ? max : x )
#define MIN(a, b) ((a)<=(b) ? (a) : (b))


class HotspotFunctor
{
  thrust::Block_2D<float> *MatrixPower;
  int iteration;
  int col;
  int row;
  int borderCols;
  int borderRows;
  float stepDivCap;
  float Rx_1;
  float Ry_1;
  float Rz_1;
public:

  HotspotFunctor (thrust::Block_2D<float> *MatrixPower,int iteration,int col,int row, int borderCols,int borderRows,float stepDivCap,float Rx_1,float Ry_1,float Rz_1)
  {
      this->MatrixPower = MatrixPower;
      this->iteration = iteration;
      this->col = col;
      this->row = row;
      this->borderCols = borderCols;
      this->borderRows = borderRows;
      this->stepDivCap = stepDivCap;
      this->Rx_1 = Rx_1;
      this->Ry_1 = Ry_1;
      this->Rz_1 = Rz_1;
  }

	__device__ void operator() (thrust::window_2D<float> w)
	{
        int ty = w.window_dim_y/2;
        int tx = w.window_dim_x/2;
        int rty = w.start_y + ty;
        int rtx = w.start_x + tx;
        int W = ty-1;
        int E = ty+1;
        int N = tx-1;
        int S = tx+1;

        float my_power = (*MatrixPower)[rtx][rty];
        for (int i=0; i<iteration ; i++)
        {
            w[ty][tx] =  w[ty][tx] + stepDivCap * (my_power + \
                (w[S][tx] + w[N][tx] - 2.0*(w[ty][tx])) * Ry_1 + \
                (w[ty][E] + w[ty][W] - 2.0*(w[ty][tx])) * Rx_1 + \
                (AMBIENT_TEMP - w[ty][tx]) * Rz_1);
            // printf("%f\n",(float) w[ty][tx]);
         }
	}
};/*
   compute N time steps
*/
int thrustCompute(thrust::Block_2D<float> &PowerBlock,thrust::Block_2D<float> &TemperatureBlock, int col, int row, \
		int total_iterations, int num_iterations, int blockCols, int blockRows, int borderCols, int borderRows, int size)
{
	float grid_height = chip_height / row;
	float grid_width = chip_width / col;

	float Cap = FACTOR_CHIP * SPEC_HEAT_SI * t_chip * grid_width * grid_height;
	float Rx = grid_width / (2.0 * K_SI * t_chip * grid_height);
	float Ry = grid_height / (2.0 * K_SI * t_chip * grid_width);
	float Rz = t_chip / (K_SI * grid_height * grid_width);

	float max_slope = MAX_PD / (FACTOR_CHIP * t_chip * SPEC_HEAT_SI);
	float step = PRECISION / max_slope;
	float t;
  float step_div_Cap;
  float Rx_1,Ry_1,Rz_1;
  step_div_Cap=step/Cap;

  Rx_1=1/Rx;
  Ry_1=1/Ry;
  Rz_1=1/Rz;

	for (t = 0; t < total_iterations; t+=num_iterations)
  {
    int requiredIterations = MIN(num_iterations,total_iterations-t);
    PowerBlock.initalize_device_memory();
    HotspotFunctor functor(PowerBlock.device_pointer,requiredIterations,col,row,borderCols,borderRows,step_div_Cap,Rx_1,Ry_1,Rz_1);
    thrust::window_vector<float> wv = thrust::window_vector<float>(&(TemperatureBlock),3,3,1,1);
    thrust::for_each(wv.begin(),wv.end(),functor);
	}
  return 0;
}


void usage(int argc, char **argv)
{
	fprintf(stderr, "Usage: %s <grid_rows/grid_cols> <pyramid_height> <sim_time> <temp_file> <power_file> <output_file>\n", argv[0]);
	fprintf(stderr, "\t<grid_rows/grid_cols>  - number of rows/cols in the grid (positive integer)\n");
	fprintf(stderr, "\t<pyramid_height> - pyramid heigh(positive integer)\n");
	fprintf(stderr, "\t<sim_time>   - number of iterations\n");
	fprintf(stderr, "\t<temp_file>  - name of the file containing the initial temperature values of each cell\n");
	fprintf(stderr, "\t<power_file> - name of the file containing the dissipated power values of each cell\n");
	fprintf(stderr, "\t<output_file> - name of the output file\n");
	exit(1);
}

int main(int argc, char** argv)
{
  printf("WG size of kernel = %d X %d\n", BLOCK_SIZE, BLOCK_SIZE);

    run(argc,argv);

    return EXIT_SUCCESS;
}

void run(int argc, char** argv)
{
    int size;
    int grid_rows,grid_cols;
    float *FilesavingTemp,*FilesavingPower;
    char *tfile, *pfile, *ofile;

    int total_iterations = 60;
    int pyramid_height = 1; // number of iterations

	  if (argc != 7)
		  usage(argc, argv);
	  if((grid_rows = atoi(argv[1]))<=0||
	   (grid_cols = atoi(argv[1]))<=0||
       (pyramid_height = atoi(argv[2]))<=0||
       (total_iterations = atoi(argv[3]))<=0)
		usage(argc, argv);

	  tfile=argv[4];
    pfile=argv[5];
    ofile=argv[6];

    size=grid_rows*grid_cols;

    /* --------------- pyramid parameters --------------- */
    # define EXPAND_RATE 2// add one iteration will extend the pyramid base by 2 per each borderline
    int borderCols = (pyramid_height)*EXPAND_RATE/2;
    int borderRows = (pyramid_height)*EXPAND_RATE/2;
    int smallBlockCol = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
    int smallBlockRow = BLOCK_SIZE-(pyramid_height)*EXPAND_RATE;
    int blockCols = grid_cols/smallBlockCol+((grid_cols%smallBlockCol==0)?0:1);
    int blockRows = grid_rows/smallBlockRow+((grid_rows%smallBlockRow==0)?0:1);

    FilesavingTemp = (float *) malloc(size*sizeof(float));
    FilesavingPower = (float *) malloc(size*sizeof(float));

    if( !FilesavingPower || !FilesavingTemp)
        fatal((char *)"unable to allocate memory");

    printf("pyramidHeight: %d\ngridSize: [%d, %d]\nborder:[%d, %d]\nblockGrid:[%d, %d]\ntargetBlock:[%d, %d]\n",\
	   pyramid_height, grid_cols, grid_rows, borderCols, borderRows, blockCols, blockRows, smallBlockCol, smallBlockRow);

    readinput(FilesavingTemp, grid_rows, grid_cols, tfile);
    readinput(FilesavingPower, grid_rows, grid_cols, pfile);
    thrust::Block_2D<float> TemperatureBlock(grid_rows,grid_cols);
    thrust::Block_2D<float> PowerBlock(grid_rows,grid_cols);
    TemperatureBlock.device_data.assign(FilesavingTemp,FilesavingTemp+size);
    PowerBlock.device_data.assign(FilesavingPower,FilesavingPower+size);
    printf("Start computing the transient temperature\n");
    int ret = thrustCompute(PowerBlock,TemperatureBlock,grid_cols,grid_rows, \
	  total_iterations,pyramid_height, blockCols, blockRows, borderCols, borderRows,size);
	  printf("Ending simulation\n");
    writeoutput(TemperatureBlock.device_data,grid_rows, grid_cols, ofile);
}