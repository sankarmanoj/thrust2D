#include <stdio.h>
#include <stdlib.h>


__global__
void reduce_kernel (int *start,int *output,int N)
{

    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    int num_threads = gridDim.x * blockDim.x;

    extern __shared__ int partial_sum[]; // Dynamic Shared Memory

    int sum = 0; // For Generic Function, Replace By Idendity Element

    for (int i=idx;i<N;i+=num_threads)
        sum += start[i]; // For Generic Function, Replace By Functor

    partial_sum[threadIdx.x] = sum;

    __syncthreads ();

    // This Step Computes The Reduction Function In A Bottom's Up Manner

    for (int activeThreads = blockDim.x>>1;activeThreads != 0;activeThreads >>= 1)
    {
        if (threadIdx.x < activeThreads)
            partial_sum[threadIdx.x] += partial_sum[threadIdx.x+activeThreads]; // For Generic Function, Replace += with functor

        __syncthreads ();
    }

    // When You Reach The Root Of The Tree Store It In Output Vector
    if (threadIdx.x == 0)
        output[blockIdx.x] = partial_sum[0];
}

int a[1<<26];
int main ()
{
    int *d_v,*partial_output,*d_answer;
    int *answer;
    int N = 1<<26;

    for (int i=0;i<N;i++)
        a[i] = 1;

    cudaMalloc ((int**)&d_v,N*sizeof(int));

    cudaMalloc ((int**)&d_answer,sizeof(int));

    cudaMemcpy (d_v,a,N*sizeof(int),cudaMemcpyHostToDevice);

    const int numBlocks = 26;
    const int numThreads = 1024;    
    const int sharedSize = numThreads*sizeof (int);

    answer = (int*)malloc (sizeof(int));
    *answer = 0;

/*   const int num_iterations = 1000; // This Is For Profiling The Code To Get An Average Value
    float elapsedTime = 0.0f;
    float total_time  = 0.0f;
    cudaEvent_t start, stop;

    for (int i=0;i<num_iterations;i++)
    {
        cudaEventCreate(&start);
        cudaEventCreate(&stop);
        cudaEventRecord(start);

        
*/      
        cudaMalloc ((int**)&partial_output,N*sizeof(int));
      
        reduce_kernel<<<numBlocks,numThreads,sharedSize>>> (d_v,partial_output,N);
        reduce_kernel<<<1,numThreads,sharedSize>>> (partial_output,d_answer,numBlocks);

        cudaMemcpy (answer,d_answer,sizeof(int),cudaMemcpyDeviceToHost);
        cudaFree (partial_output);
/*
        cudaEventRecord(stop);
        cudaEventSynchronize(stop);

        cudaEventElapsedTime(&elapsedTime, start, stop);

        total_time += elapsedTime;


    }

    printf("Average Elapsed Time Is %lf\n", total_time/num_iterations);
*/
    printf ("Answer is %d\n",*answer);

    return 0;
}
