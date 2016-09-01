#include<thrust/window_2d.h>
#include <thrust/generate.h>
#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#define X 10000
#define Y 500
int main()
{
  srand(13);
  thrust::Block_2D<int> inBlock(X,Y);
  thrust::Block_2D<int> kernel(7,7);
  thrust::device_vector<int> a(X*Y);
  thrust::sequence(a.begin(),a.end());
  thrust::copy(a.begin(),a.end(),inBlock.begin());
  thrust::fill(kernel.begin(),kernel.end(),1);
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
  thrust::convolve(&inBlock,&kernel);
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float milliseconds = 0;
  cudaEventElapsedTime(&milliseconds, start, stop);
  printf("Time Taken = %f\n",milliseconds);
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
