// #include <thrust/device_vector.h>

// #include <thrust/for_each.h>
#include <thrust/sequence.h>
#include <thrust/scan.h>
#include <thrust/device_vector.h>
#include <thrust/functional.h>
// #include <thrust/reduce.h>
// #include <thrust/system/cuda/window_structures.h>
#include <thrust/shared_algorithms.h>
#include <thrust/block_2d.h>
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
  block_2d<int> a(100,100);
  //
  sequence(a.begin(),a.end());
  // inclusive_scan(a.begin(),a.end(),b.begin());
  // // for (int i =0;i<1;i++)
  // // {
    printf("Shared = %d \n",reduce(cuda::shared,a.begin(),a.end(),0,thrust::plus<int>()));
    printf("Thrust = %d \n",reduce(a.begin(),a.end()));
  //   // cudaDeviceSynchronize();
  //   // printf("Thrust = %ld \n",reduce(a.begin(),a.end()));
  // // }
  // cudaDeviceSynchronize();
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
