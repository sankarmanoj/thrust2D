// #include <thrust/device_vector.h>

// #include <thrust/for_each.h>
#include <thrust/sequence.h>
#include <thrust/scan.h>
#include <thrust/device_vector.h>
#include <thrust/functional.h>
#include <thrust/reduce.h>
// #include <thrust/system/cuda/window_structures.h>
#include <thrust/shared_for_each.h>
// #include <thrust/shared_reduce.h>
using namespace thrust;
class printFunctor
{
public:

__device__  void  operator() ( int  &a)
  {
    printf("%d\n",a);
  }
};
int main()
{
  device_vector<int> a(1024*102);
  // device_vector<int> b(63);
  //
  sequence(a.begin(),a.end());
  printf("Shared = %d \n",reduce(cuda::shared,a.begin(),a.end()));
  cudaDeviceSynchronize();
  printf("Thrust = %d \n",reduce(a.begin(),a.end(),0,thrust::plus<int>()));
  cudaDeviceSynchronize();
  // printf("\n");
  // for_each(cuda::shared,a.begin(),a.end(),printFunctor());
  // inclusive_scan(a.begin(),a.end(),b.begin());
  // cudaDeviceSynchronize();
  // printf("\n");
  // for_each(cuda::shared,b.begin(),b.end(),printFunctor());
  // inclusive_scan(cuda::shared,a.begin(),a.end(),b.begin());
  // cudaDeviceSynchronize();
  // printf("\n");
  // for_each(cuda::shared,b.begin(),b.end(),printFunctor());
  // cudaDeviceSynchronize();
  // printf("\n");
}