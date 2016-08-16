// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "srad.h"
// includes, project
#include <cuda.h>

// includes, kernels
#include "srad_kernel.cu"

void random_matrix(float* I, int rows, int cols);
void runTest( int argc, char** argv);
void usage(int argc, char **argv)
{
	fprintf(stderr, "Usage: %s <rows> <cols> <y1> <y2> <x1> <x2> <lamda> <no. of iter>\n", argv[0]);
	fprintf(stderr, "\t<rows>   - number of rows\n");
	fprintf(stderr, "\t<cols>    - number of cols\n");
	fprintf(stderr, "\t<y1> 	 - y1 value of the speckle\n");
	fprintf(stderr, "\t<y2>      - y2 value of the speckle\n");
	fprintf(stderr, "\t<x1>       - x1 value of the speckle\n");
	fprintf(stderr, "\t<x2>       - x2 value of the speckle\n");
	fprintf(stderr, "\t<lamda>   - lambda (0,1)\n");
	fprintf(stderr, "\t<no. of iter>   - number of iterations\n");

	exit(1);
}
//
void writeoutput(thrust::host_vector<float> vect, int grid_rows, int grid_cols, char *file){
	int i,j, index=0;
	FILE *fp;
	char str[STR_SIZE];

	if( (fp = fopen(file, "w" )) == 0 )
        printf( "The file was not opened\n" );


	for (i=0; i < grid_rows; i++)
	{
	 for (j=0; j < grid_cols; j++)
	 {
		sprintf(str, "%g ", vect[i*grid_cols+j]);
		// printf("%g ",vect[i*grid_cols+j]);
		fputs(str,fp);
		index++;
	 }
	 sprintf(str, "\n");
	//  printf("\n");
	 fputs(str,fp);
 }

      fclose(fp);
}

////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
int
main( int argc, char** argv)
{
	time_t t;
	srand((unsigned) time(&t));
  printf("WG size of kernel = %d X %d\n", BLOCK_SIZE, BLOCK_SIZE);
  runTest( argc, argv);

  return EXIT_SUCCESS;
}


void
runTest( int argc, char** argv)
{
  unsigned int rows, cols, size_I, size_R, niter = 10, iter;
  float *J,*I,lambda, q0sqr, sum, sum2, tmp, meanROI,varROI ;
	unsigned int r1, r2, c1, c2;

	if (argc == 9)
	{
		rows = atoi(argv[1]);  //number of rows in the domain
		cols = atoi(argv[2]);  //number of cols in the domain
		if ((rows%16!=0) || (cols%16!=0)){
		fprintf(stderr, "rows and cols must be multiples of 16\n");
		exit(1);
		}
		r1   = atoi(argv[3]);  //y1 position of the speckle
		r2   = atoi(argv[4]);  //y2 position of the speckle
		c1   = atoi(argv[5]);  //x1 position of the speckle
		c2   = atoi(argv[6]);  //x2 position of the speckle
		lambda = atof(argv[7]); //Lambda value
		niter = atoi(argv[8]); //number of iterations

	}
  else
	{
		usage(argc, argv);
  }



	size_I = cols * rows;
  size_R = (r2-r1+1)*(c2-c1+1);

	J = (float *) malloc(size_I*sizeof(float));
	I = (float *) malloc(size_I*sizeof(float));

	thrust::Block_2D<float> J_cuda (rows,cols);

	printf("Randomizing the input matrix\n");
	//Generate a random matrix
	random_matrix(I, rows, cols);

  for (int k = 0;  k < size_I; k++ )
	{
   	J[k] = (float) exp(I[k]) ;
  }

	J_cuda.device_data.assign(J,J+size_I);

	writeoutput(J_cuda.device_data,rows,cols,"input.out");

	printf("Start the SRAD main loop\n");
 	for (iter=0; iter< niter; iter++)
	{
		printf("Iteration Started\n");
		sum=0; sum2=0;
    for (int i=r1; i<=r2; i++)
		{
        for (int j=c1; j<=c2; j++)
				{
					// printf("%f ", (float) J_cuda[i][j]);
          tmp   = J_cuda[i][j];
          sum  += tmp ;
          sum2 += tmp*tmp;
        }
    }
	  meanROI = sum / size_R;
	  varROI  = (sum2 / size_R) - meanROI*meanROI;
	  q0sqr   = varROI / (meanROI*meanROI);
		// SRADFunctor0 functor0;
		SRADFunctor1 functor1(cols,rows,q0sqr);
		SRADFunctor2 functor2(cols,rows,lambda,q0sqr);
		thrust::window_vector<float> wv = thrust::window_vector<float>(&(J_cuda),3,3,1,1);
		// thrust::for_each(wv.begin(),wv.end(),functor0);
		thrust::for_each(wv.begin(),wv.end(),functor1);
		cudaDeviceSynchronize();
		thrust::for_each(wv.begin(),wv.end(),functor2);
		cudaDeviceSynchronize();
		printf("Iteration Ended\n");
	}
	printf("Printing Output:\n");
  writeoutput(J_cuda.device_data,rows,cols,"result.out");
	printf("Computation Done\n");
	// cudaDeviceReset();
}


void random_matrix(float *I, int rows, int cols){
	for( int i = 0 ; i < rows ; i++){
		for ( int j = 0 ; j < cols ; j++){
		 I[i * cols + j] = rand()/(float)RAND_MAX ;
		}
	}

}
