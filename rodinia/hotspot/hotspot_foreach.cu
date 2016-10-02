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
#include <thrust/window_transform.h>

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

void fatal(char *s)
{
	fprintf(stderr, "error: %s\n", s);

}

void writeoutput(float *vect, int grid_rows, int grid_cols, char *file){
	int i,j, index=0;
	FILE *fp;
	char str[STR_SIZE];

	if( (fp = fopen(file, "w" )) == 0 )
	printf( "The file was not opened\n" );


	for (i=0; i < grid_rows; i++)
	for (j=0; j < grid_cols; j++)
	{

		sprintf(str, "%f\n", vect[i*grid_cols+j]);
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
		if ((sscanf(str, "%f", &val) != 1))
		fatal((char *)"invalid file format");
		vect[i*grid_cols+j] = val;
	}

	fclose(fp);

}
#define MIN(a, b) ((a)<=(b) ? (a) : (b))


class HotspotFunctor
{
	int iteration;
	int cols;
	int rows;
	float stepDivCap;
	float Rx_1;
	float Ry_1;
	float Rz_1;
	thrust::block_2d<float> *MatrixPower;
public:

	HotspotFunctor (thrust::block_2d<float> *PowerBlock,int iteration,int cols,int rows,float stepDivCap,float Rx_1,float Ry_1,float Rz_1)
	{
		this->MatrixPower = PowerBlock;
		this->iteration = iteration;
		this->cols = cols;
		this->rows = rows;
		this->stepDivCap = stepDivCap;
		this->Rx_1 = Rx_1;
		this->Ry_1 = Ry_1;
		this->Rz_1 = Rz_1;
	}

	__device__ void operator() (const thrust::window_2d<float> &w) const
	{
		int ty = w.window_dim_y/2;
		int tx = w.window_dim_x/2;
		int rty = w.start_y + ty;
		int rtx = w.start_x +tx;
		int N = ty-1;
		int S = ty+1;
		int W = tx-1;
		int E = tx+1;
		float myPower = (*MatrixPower)[rty][rtx];
		for (int i=0; i<iteration ; i++)
		{
			w[ty][tx] =  w[ty][tx] + stepDivCap * (myPower + \
				(w[S][tx] + w[N][tx] - 2.0*(w[ty][tx])) * Ry_1 + \
				(w[ty][E] + w[ty][W] - 2.0*(w[ty][tx])) * Rx_1 + \
				(AMBIENT_TEMP - w[ty][tx]) * Rz_1);
			}
			// Boundary Condtions - causes warp divergence.
			if(w.start_y == 0)
			w[N][tx] = w[ty][tx];
			if(w.start_y == rows - w.window_dim_y)
			w[S][tx] = w[ty][tx];
			if(w.start_x == 0)
			w[ty][W] = w[ty][tx];
			if(w.start_x == cols - w.window_dim_x)
			w[ty][E] = w[ty][tx];
			if(w.start_y == 0 && w.start_x == 0)
			w[N][W] = w[ty][tx];
			if(w.start_y == rows - w.window_dim_y && w.start_x == cols - w.window_dim_x)
			w[S][E] = w[ty][tx];
			if(w.start_x == 0 && w.start_y == rows - w.window_dim_y)
			w[S][W] = w[ty][tx];
			if(w.start_x == cols - w.window_dim_x && w.start_y == 0)
			w[N][E] = w[ty][tx];
		}
	};

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
		// printf("WG size of kernel = %d X %d\n", BLOCK_SIZE, BLOCK_SIZE);

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

		FilesavingTemp = (float *) malloc(size*sizeof(float));
		FilesavingPower = (float *) malloc(size*sizeof(float));

		if( !FilesavingPower || !FilesavingTemp)
		fatal((char *)"unable to allocate memory");

		readinput(FilesavingTemp, grid_rows, grid_cols, tfile);
		readinput(FilesavingPower, grid_rows, grid_cols, pfile);
		thrust::block_2d<float> TemperatureBlock(grid_rows,grid_cols);
		thrust::block_2d<float> PowerBlock(grid_rows,grid_cols);
		TemperatureBlock.assign(FilesavingTemp,FilesavingTemp+size);
		PowerBlock.assign(FilesavingPower,FilesavingPower+size);
		printf("Start computing the transient temperature\n");
		float grid_height = chip_height / grid_rows;
		float grid_width = chip_width / grid_cols;

		float Cap = FACTOR_CHIP * SPEC_HEAT_SI * t_chip * grid_width * grid_height;
		float Rx = grid_width / (2.0 * K_SI * t_chip * grid_height);
		float Ry = grid_height / (2.0 * K_SI * t_chip * grid_width);
		float Rz = t_chip / (K_SI * grid_height * grid_width);

		float max_slope = MAX_PD / (FACTOR_CHIP * t_chip * SPEC_HEAT_SI);
		float step = PRECISION / max_slope;
		int t;
		float step_div_Cap;
		float Rx_1,Ry_1,Rz_1;
		step_div_Cap=step/Cap;
		Rx_1=1/Rx;
		Ry_1=1/Ry;
		Rz_1=1/Rz;
		printf("step_div_Cap = %f\nrx,ry,rz = %f,%f,%f\n",step_div_Cap,Rx_1,Ry_1,Rz_1);
		cudaEvent_t tstart, tstop;
		cudaEventCreate(&tstart);
		cudaEventCreate(&tstop);
		cudaEventRecord(tstart);
		for (t = 0; t < total_iterations; t+=pyramid_height)
		{
			int required_iterations = MIN(pyramid_height,total_iterations-t);
			HotspotFunctor functor(PowerBlock.device_pointer,required_iterations,grid_cols,grid_rows,step_div_Cap,Rx_1,Ry_1,Rz_1);
			thrust::window_vector<float> wv = thrust::window_vector<float>(&(TemperatureBlock),3,3,1,1);
			// thrust::window_vector<float> wp = thrust::window_vector<float>(&(PowerBlock),3,3,1,1);
			// thrust::device_vector<int> null_vector(grid_rows*grid_cols);
			// thrust::transform(wv.begin(),wv.end(),wp.begin(),null_vector.begin(),functor);
			thrust::for_each(wv.begin(),wv.end(),functor);
		}
		printf("Ending simulation\n");
		cudaEventRecord(tstop);
		cudaEventSynchronize(tstop);
		float timeTaken;
		cudaEventElapsedTime(&timeTaken,tstart,tstop);
		printf("Thrust Time = %f \n",timeTaken);
		cudaMemcpy(FilesavingTemp,thrust::raw_pointer_cast(TemperatureBlock.data()),size*sizeof(float),cudaMemcpyDeviceToHost);
		writeoutput(FilesavingTemp,grid_rows, grid_cols, ofile);
	}
