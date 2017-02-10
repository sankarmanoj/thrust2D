// #include <thrust/device_vector.h>

// #include <thrust/for_each.h>
#include <thrust/sequence.h>
#include <thrust/scan.h>
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
class copyFunctor
{
public:

__device__  int  operator() ( int  &a)
  {
    return a*a;
  }
};
class binaryFunctor
{
public:

__device__  int  operator() ( int  &a,int &b)
  {
    return a*b;
  }
};
int main()
{
  device_vector<int> a(1200);
  device_vector<int> b(1200);
  device_vector<int> c(1200);
  //
  sequence(a.begin(),a.end());
  sequence(b.begin(),b.end());
  // printf("%d ",reduce(cuda::shared,a.begin(),a.end()));
  // printf("%d ",reduce(a.begin(),a.end()));
  // exclusive_scan(cuda::shared,a.begin(),a.end(),b.begin());
  // cudaDeviceSynchronize();
  // for_each(cuda::shared,a.begin(),a.end(),printFunctor());
  transform(cuda::shared,a.begin(),a.end(),b.begin(),c.begin(),binaryFunctor());
  cudaDeviceSynchronize();
  printf("\n");
  for_each(cuda::shared,c.begin(),c.end(),printFunctor());
  cudaDeviceSynchronize();
  // printf("\n");
}
