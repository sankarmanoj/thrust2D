/* 
* This Example Show The Working Of Reduce Operation
*/

#include <thrust/device_vector.h>
#include <vector>

int main ()
{
	int N = 1<<26;
	int answer;
	std::vector<int> a(N);

	for (int i=0;i<N;i++)
		a[i] = 1;

	thrust::device_vector<int> d(a.begin(),a.end());

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

		answer = thrust::reduce (d.begin(),d.end());

/*		cudaEventRecord(stop);
	    cudaEventSynchronize(stop);

	    cudaEventElapsedTime(&elapsedTime, start, stop);

	    total_time += elapsedTime;
	}

    printf("Average Elapsed Time Is %lf\n", total_time/num_iterations);
*/
	printf ("Answer is %d\n",answer);

	return 0;
}
