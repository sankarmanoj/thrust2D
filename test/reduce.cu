#include <thrust/device_vector.h>
#include <thrust/sequence.h>
#include <thrust/reduce.h>
// #include <thrust/shared_algorithms.h>
#include <thrust/multi_algorithms.h>
#include <iostream>
#include <cxxabi.h>
int main()
{
  thrust::host_vector<int> a(102r4);
  thrust::sequence(a.begin(),a.end());
  // for(int i = 0; i<2; i++)
  printf("%p - %d\n",&(a[0]),a[10]);
  printf("Sum = %d\n",thrust::reduce(thrust::cuda::multi,a.begin(),a.end()));
  // std::cout<<abi::__cxa_demangle(typeid(a.begin()).name(),0,0,&status);
  return 0;
}
