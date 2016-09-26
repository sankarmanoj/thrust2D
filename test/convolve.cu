#include<thrust/window_transform.h>
#include <thrust/generate.h>
#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
int main(int argc, char** argv)
{
    int x,y;
    x = atoi(argv[1]);
    y = atoi(argv[2]);
    srand(13);
    thrust::Block_2D<float> inBlock(x,x);
    thrust::Block_2D<float> kernel(y,y);
    thrust::device_vector<float> a((long long int)x*x);
    thrust::sequence(a.begin(),a.end());
    thrust::copy(a.begin(),a.end(),inBlock.begin());
    thrust::fill(kernel.begin(),kernel.end(),1.0);
    // for (int i=0; i<Y;i++)
    // {
    //   for (int j=0;j<X  ;j++)
    //   {
    //       std::cout<<inBlock[make_int2(j,i)]<<" ";
    //   }
    //   std::cout<<"\n";
    // }
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);

    cudaEventRecord(start);
    thrust::convolve(inBlock.begin(), inBlock.end(), kernel.begin());
    cudaEventRecord(stop);
    cudaEventSynchronize(stop);
    float milliseconds = 0;
    cudaEventElapsedTime(&milliseconds, start, stop);
    printf("%f\n",milliseconds);
    // //
    // for (int i=0; i<Y;i++)
    // {
    //   for (int j=0;j<X;j++)
    //   {
    //         std::cout<<inBlock[make_int2(j,i)]<<" ";
    //   }
    //   std::cout<<"\n";
    // }
}
