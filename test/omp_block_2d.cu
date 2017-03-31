#define THRUST_DEVICE_SYSTEM 2
#include <thrust/sequence.h>
#include <thrust/block_2d.h>
#include <thrust/device_vector.h>
#include <thrust/system/omp/execution_policy.h>
#include <iostream>
using namespace thrust;
#define X 1
#define Y 10
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
class printFunctor2
{
public:

  __device__  __host__ int operator() (int  &a)
  {
    return 2*a;
  }
};

class sum
{
public:
  __host__ __device__ int operator() (int &a, int &b)
  {
    return a + b;
  }
};
int main()
{
  block_2d<int> a(X,Y,99);
  sequence(thrust::omp::par,a.begin(),a.end());
  for_each(thrust::omp::par,a.begin(),a.end(),printFunctor());
  return 0;
}
