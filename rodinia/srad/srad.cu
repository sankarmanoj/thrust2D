// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "srad.h"
#include "graphics.c"
#include "resize.c"
// includes, project
#include <cuda.h>

// includes, kernels
#include "srad_kernel.cu"

void random_matrix(float* I, int rows, int cols);
void runTest( int argc, char** argv);
void usage(int argc, char **argv)
{
	fprintf(stderr, "Usage: %s <rows> <cols> <lamda> <no. of iter>\n", argv[0]);
	fprintf(stderr, "\t<rows>   - number of rows\n");
	fprintf(stderr, "\t<cols>    - number of cols\n");
	fprintf(stderr, "\t<lamda>   - lambda (0,1)\n");
	fprintf(stderr, "\t<no. of iter>   - number of iterations\n");

	exit(1);
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
  float *J,*image_ori,lambda, q0sqr, sum, sum2, tmp, meanROI,varROI ;
	unsigned int r1, r2, c1, c2;

	if (argc == 5)
	{
		rows = atoi(argv[1]);  //number of rows in the domain
		cols = atoi(argv[2]);  //number of cols in the domain
		lambda = atof(argv[3]); //Lambda value
		niter = atoi(argv[4]); //number of iterations

	}
  else
	{
		usage(argc, argv);
  }

	r1 = 0;
	r2 = rows - 1;
	c1 = 0;
	c2 = cols - 1;

	size_R = (r2-r1+1)*(c2-c1+1);

	int image_ori_rows = 502;
	int image_ori_cols = 458;
	long image_ori_elem = image_ori_rows * image_ori_cols;

	image_ori = (float*)malloc(sizeof(float) * image_ori_elem);


	size_I = cols * rows;

	J = (float*) malloc(sizeof(float) * size_I);

	read_graphics("image.pgm",J,image_ori_rows,image_ori_cols,0);

	// resize(	image_ori,image_ori_rows,image_ori_cols,J,rows,cols,0);

	thrust::Block_2D<float> J_cuda (cols,rows);

	J_cuda.device_data.assign(J,J+size_I);

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
          tmp   = J[i*cols+j];
          sum  += tmp ;
          sum2 += tmp*tmp;
        }
    }
	  meanROI = sum / size_R;
	  varROI  = (sum2 / size_R) - meanROI*meanROI;
	  q0sqr   = varROI / (meanROI*meanROI);
		// SRADFunctor0 functor0;
		SRADFunctor1 functor1(cols,rows,q0sqr,lambda);
		// SRADFunctor2 functor2(cols,rows,lambda,q0sqr);
		thrust::window_vector<float> wv = thrust::window_vector<float>(&(J_cuda),3,3,1,1);
		// thrust::for_each(wv.begin(),wv.end(),functor0);
		thrust::for_each(wv.begin(),wv.end(),functor1);
		// cudaDeviceSynchronize();
		// thrust::for_each(wv.begin(),wv.end(),functor2);
		// cudaDeviceSynchronize();
		printf("Iteration Ended\n");
	}
	printf("Computation Done\n");
	cudaMemcpy(J,thrust::raw_pointer_cast(J_cuda.device_data.data()),size_I,cudaMemcpyDeviceToHost);
	write_graphics(	"image_out.pgm",J,rows,cols,0,255);
	// cudaDeviceReset();
}
