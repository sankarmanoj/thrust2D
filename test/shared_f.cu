#include <thrust/device_vector.h>

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
    printf("%d ",a);
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
  device_vector<int> a(12);
  device_vector<int> b(12);
  // device_vector<int> c(1250);
  //
  sequence(a.begin(),a.end());
  // sequence(b.begin(),b.end());
  // printf("%d ",reduce(cuda::shared,a.begin(),a.end()));
  // printf("%d ",reduce(a.begin(),a.end()));
  exclusive_scan(cuda::shared,a.begin(),a.end(),b.begin());
  cudaDeviceSynchronize();
  for_each(a.begin(),a.end(),printFunctor());
  cudaDeviceSynchronize();
  printf("\n");
  for_each(b.begin(),b.end(),printFunctor());
  cudaDeviceSynchronize();
  printf("\n");
}
