/* 
* This Example Shows The Matrix Transpose Operation
*/
#include <cstdio>
#include <iostream>
#include <thrust/shared_vector.h>

const int row = 10240;
const int col = 10240;

int a[row][col];

int main ()
{

	thrust::hybrid::shared_vector<int> out (&a[0][0],&a[row-1][col-1]); // Initialised to 0

	for (int i=0;i<row;i++)
	  for (int j=0; j<col;j++)
		a[i][j] = i*col+j;

	thrust::hybrid::shared_vector<int> inp (&a[0][0],&a[row-1][col-1]); // Initialised inp[i] = i

/*	const int num_iterations = 1000; // This Is For Profiling The Code To Get An Average Value
  	float elapsedTime = 0.0f;
	float total_time  = 0.0f;

	cudaEvent_t start, stop;
	for (int i=0;i<num_iterations;i++)
	{
		cudaEventCreate(&start);
	    cudaEventCreate(&stop);
	    cudaEventRecord(start);
*/
		thrust::hybrid::transpose (inp.begin(),out.begin(),10240);

/*		cudaEventRecord(stop);
	    cudaEventSynchronize(stop);

	    cudaEventElapsedTime(&elapsedTime, start, stop);

	    total_time += elapsedTime;
	}
		
	printf("Average Elapsed Time Is %lf\n", total_time/num_iterations);
*/
	std::cout<<out[100]<<"\n";

	return 0;
}
