#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/block_2d.h>
using namespace thrust;


class printFunctor
{
public:

__device__  void  operator() ( int  &a)
  {
    printf("%d \n",a);
    // return 10;
  }
};
class printFunctor2
{
public:

__device__  __host__ void operator() (const int  &a) const
  {
    printf("%d \n",a);
  }
};
int main()
{
  block_2d<int> a(5,5);
  sequence(a.begin(),a.end());
  for_each(thrust::host,a.begin(),a.end(),printFunctor2());


  // copy(a.begin(),a.end(),b.begin());
  // for(int i = 0; i<25; i++)
  // {
  //   printf("%f\n",a[i/5][i%5]);
  // }
  // // cudaDeviceSynchronize();

  // thrust::window_vector<int> wv = window_vector<int>(&(b),3,3,1,1);
  // printf("Start\n");
  // // thrust::window_iterator<int> wi = wv.end();
  // // int num = wv.begin().operator-(wv.end());
  // // printf("%d\n", num);
  // thrust::for_each(wv.begin(),wv.end(),windowPrintFunctor());
  // cudaDeviceSynchronize();
  // // cudaMemcpy(temp,thrust::raw_pointer_cast(b.data()),25*sizeof(int),cudaMemcpyDeviceToHost);
  // // b.assign(temp,temp+25);
  // thrust::for_each(b.begin(),b.end(),printFunctor());
  return 0;
}
