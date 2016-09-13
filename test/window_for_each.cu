#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
#include <thrust/window_transform.h>
#define X 30
#define Y 30
class printFunctor
{
public:
  __device__ void operator() (thrust::window_2D<float> &w)
  {
  printf("%f",w[0][0]);
}
};
int main()
{
  srand(13);
  thrust::Block_2D<float> inBlock(X,Y);
  thrust::Block_2D<float> kernel(3,3);
  thrust::device_vector<float> a((long long int)X*Y);
  thrust::sequence(a.begin(),a.end());
  thrust::copy(a.begin(),a.end(),inBlock.begin());
  thrust::fill(kernel.begin(),kernel.end(),1.0);
<<<<<<< HEAD
  thrust::window_vector<float> myVector = thrust::window_vector<float>(&inBlock,3,3 ,4,4);

  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X  ;j++)
    {
        printf("%5.0f ",inBlock[make_int2(j,i)]);
    }
    std::cout<<"\n";
  }
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  thrust::for_each(shared_policy,myVector.begin(),myVector.end(),printFunctor());
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float milliseconds = 0;
  cudaEventElapsedTime(&milliseconds, start, stop);
  printf("Time Taken = %f\n",milliseconds);

  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
          printf("%5.0f ",inBlock[make_int2(j,i)]);
    }
    std::cout<<"\n";
  }
}
