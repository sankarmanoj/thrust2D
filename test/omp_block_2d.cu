#define THRUST_DEVICE_SYSTEM 2
#include <thrust/sequence.h>
#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/device_vector.h>
#include <thrust/system/omp/execution_policy.h>
#include <iostream>
using namespace thrust;
#define X 30
#define Y 30
class printFunctor
{
public:

  __host__ __device__  void  operator() ( int  &a)
  {
    // a=threadIdx.x;
    printf("%d \n",a);
    // return 10;
  }
};
class printFunctorW
{
public:
  __host__ __device__ void operator() (const window_2d<int> &myWindow) const
  {
    int value = myWindow[0][0];
    myWindow[0][0]=666;
    printf(" %ld , %ld , %d\n",myWindow.start_x, myWindow.start_y,value);
  }
};
int main()
{
  block_2d<int> a(X,Y,99);
  sequence(thrust::omp::par,a.begin(),a.end());
  for_each(thrust::omp::par,a.begin(),a.end(),printFunctor());
  window_vector<int> myVector(&a,3,3,3,3);
  for_each(myVector.begin(),myVector.end(),printFunctorW());
  cudaDeviceSynchronize();
  return 0;
}
