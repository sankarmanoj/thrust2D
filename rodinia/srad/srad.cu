// includes, system
#include "srad.h"
#include "graphics.c"
#include "resize.c"

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
	fprintf(stderr, "\t<input_file>   - input file\n");
	fprintf(stderr, "\t<output file>   - output file\n");

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

  runTest( argc, argv);
  return EXIT_SUCCESS;
}


void
runTest( int argc, char** argv)
{
  unsigned int rows, cols, size_I, size_R, niter = 10, iter;
  float *J,lambda, q0sqr, sum, sum2,meanROI,varROI ;
	unsigned int r1, r2, c1, c2;
	char *in,*out;
	if (argc == 7)
	{
		rows = atoi(argv[1]);  //number of rows in the domain
		cols = atoi(argv[2]);  //number of cols in the domain
		lambda = atof(argv[3]); //Lambda value
		niter = atoi(argv[4]); //number of iterations
		in = argv[5];
		out = argv[6];
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

	int image_ori_rows = rows;
	int image_ori_cols = cols;
	// long image_ori_elem = image_ori_rows * image_ori_cols;

	size_I = cols * rows;

	J = (float*) malloc(sizeof(float) * size_I);

	read_graphics(in,J,image_ori_rows,image_ori_cols,0);

	// resize(	image_ori,image_ori_rows,image_ori_cols,J,rows,cols,0);

	thrust::Block_2D<float> J_cuda (cols,rows);
	thrust::Block_2D<float> J_square(cols,rows);
	thrust::Block_2D<float> d_c(cols,rows);
	thrust::Block_2D<float> nullBlock(cols,rows);
	thrust::fill(d_c.begin(),d_c.end(),0);
	J_cuda.device_data.assign(J,J+size_I);
	thrust::for_each(J_cuda.begin(),J_cuda.end(),extractFunctor());
	printf("Start the SRAD main loop\n");
 	for (iter=0; iter< niter; iter++)
	{
		J_square.copy(J_cuda.begin(),J_cuda.end());
		thrust::for_each(J_square.begin(),J_square.end(),square());
		sum = thrust::reduce(J_cuda.begin(),J_cuda.end());
		sum2 = thrust::reduce(J_square.begin(),J_square.end());
	  meanROI = sum / size_R;
	  varROI  = (sum2 / size_R) - meanROI*meanROI;
	  q0sqr   = varROI / (meanROI*meanROI);
		SRADFunctor1 functor1(cols,rows,q0sqr);
		SRADFunctor2 functor2(cols,rows,lambda,q0sqr);
		thrust::window_vector<float> wv = thrust::window_vector<float>(&(J_cuda),3,3,1,1);
		thrust::window_vector<float> d_cwv = thrust::window_vector<float>(&(d_c),3,3,1,1);
		thrust::transform(wv.begin(),wv.end(),d_cwv.begin(),nullBlock.begin(),functor1);
		thrust::transform(wv.begin(),wv.end(),d_cwv.begin(),nullBlock.begin(),functor2);
	}
	printf("Computation Done\n");
	thrust::for_each(J_cuda.begin(),J_cuda.end(),compressFunctor());
	cudaMemcpy(J,thrust::raw_pointer_cast(J_cuda.device_data.data()),size_I*sizeof(float),cudaMemcpyDeviceToHost);
	write_graphics(out,J,rows,cols,0,255);
}
