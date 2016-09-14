#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
#include <thrust/window_transform.h>
#define X 10
#define Y 10
#define XSTART 0
#define XRANGE 10
#define YSTART 0
#define YRANGE 10

class printFunctor
{
public:
  __device__ void operator() (const thrust::window_2D<float> &w) const
  {
     w[1][1]=666;
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
  thrust::window_vector<float> myVector = thrust::window_vector<float>(&inBlock,3,3 ,3,3);
  for (int j=YSTART;j<YSTART + YRANGE;j++)
  {
    for (int i=XSTART; i<XSTART + XRANGE;i++)
    {
        int2 pos = make_int2(i,j);
        printf("%5.0f ",inBlock[pos]);
    }
    std::cout<<"\n";
  }
  cudaEvent_t start, stop;
  cudaEventCreate(&start);
  cudaEventCreate(&stop);
  cudaEventRecord(start);
  thrust::for_each(thrust::cuda::shared,myVector.begin(),myVector.end(),printFunctor());
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float milliseconds = 0;
  cudaEventElapsedTime(&milliseconds, start, stop);
  printf("\nTime Taken = %f\n",milliseconds);

  for (int j=YSTART;j<YSTART + YRANGE;j++)
  {
    for (int i=XSTART; i<XSTART + XRANGE;i++)
    {
        int2 pos = make_int2(i,j);
        printf("%5.0f  ",inBlock[pos]);
    }
    std::cout<<"\n";
  }
}
