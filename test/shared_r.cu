// #include <thrust/device_vector.h>

// #include <thrust/for_each.h>
#include <thrust/sequence.h>
#include <thrust/scan.h>
#include <thrust/device_vector.h>
#include <thrust/functional.h>
// #include <thrust/reduce.h>
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
  cudaEvent_t start,stop;
  cudaEventCreate (&start);
  cudaEventCreate (&stop);
  cudaEventRecord(start);
  device_vector<long int> a(1024*1024);
  device_vector<int> b(63);
  //
  sequence(a.begin(),a.end());
  inclusive_scan(a.begin(),a.end(),b.begin());
  // // for (int i =0;i<1;i++)
  // // {
  //   printf("Shared = %ld \n",reduce(cuda::shared,a.begin(),a.end()));
  //   // cudaDeviceSynchronize();
  //   // printf("Thrust = %ld \n",reduce(a.begin(),a.end()));
  // // }
  cudaEventRecord(stop);
  cudaEventSynchronize(stop);
  float milliseconds = 0;
  cudaEventElapsedTime(&milliseconds, start, stop);
  printf("%f\n", milliseconds);
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
