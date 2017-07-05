#include <thrust/device_vector.h>
#include <thrust/sequence.h>
#include <thrust/reduce.h>
#include <thrust/shared_algorithms.h>
#include <iostream>
#include <cxxabi.h>
class printFunctor
{
public:
__device__  void  operator() ( int &a)
  {
    a=a*10;
  }
};
int main()
{
  thrust::host_vector<int> a(1024*1024*32);
  thrust::sequence(a.begin(),a.end());
  // for(int i = 0; i<2; i++)
  thrust::device_vector<int> d_a = a;
  thrust::for_each(thrust::cuda::shared,d_a.begin(),d_a.end(),printFunctor());
  // std::cout<<abi::__cxa_demangle(typeid(a.begin()).name(),0,0,&status);
  a = d_a;

  return 0;
}
