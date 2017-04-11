// #include <thrust/device_vector.h>

// #include <thrust/for_each.h>
#include <thrust/sequence.h>
#include <thrust/constant_memory.h>
#include <thrust/scan.h>
#include <thrust/transform_reduce.h>
#include <thrust/shared_algorithms.h>
// #include <thrust/shared_reduce.h>
using namespace thrust;
class printFunctor
{
public:
__device__  void  operator() ( float &a)
  {
    printf("%f\n",a);
  }
};
class copyFunctor
{
public:

__device__  float  operator() ( float  &a)
  {
    return a*a;
  }
};
class binaryFunctor
{
public:

__device__  float  operator() ( float  &a,float &b)
  {
    return a*b;
  }
};
int main(int argc, char ** argv)
{
  if(argc!=2)
    exit(0);
  device_vector<float> a(atoi(argv[1]));
  device_vector<float> b(atoi(argv[1]));
  device_vector<float> c(atoi(argv[1]));
  // device_vector<int> c(1200);
  //
  sequence(a.begin(),a.end());
  sequence(b.begin(),b.end());

  // printf("%d ",reduce(cuda::shared,a.begin(),a.end()));
  // printf("%d ",reduce(a.begin(),a.end()));
  // exclusive_scan(cuda::shared,a.begin(),a.end(),b.begin());
  // cudaDeviceSynchronize();
  transform(cuda::shared_first,a.begin(),a.end(),b.begin(),c.begin(),binaryFunctor());

  // cudaDeviceSynchronize();
  // printf("\n");
  for_each(cuda::shared,c.begin(),c.end(),printFunctor());
  // cudaDeviceSynchronize();
  // printf("\n");

  // printf("Thrust = %f\n",transform_reduce(a.begin(),a.end(),copyFunctor(),0.0f, thrust::plus<float>()));
  // printf("Shared = %f\n",transform_reduce(cuda::shared,a.begin(),a.end(),b.begin(),binaryFunctor()));
  //   printf("Shared = %f \n",reduce(cuda::shared,a.begin(),a.end()-10));
}
