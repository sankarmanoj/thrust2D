#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
#include <typeinfo>
using namespace thrust;

// testing basic block functions
class windowPrintFunctor
{
public:

__device__  void operator() (window_2D<int> a)
  {
    a[0][0]=3;
    int value = a[0][0];
    printf("%d \n",value);
  }
};
class printFunctor
{
public:

__device__  void operator() (int  & a)
  {
    printf("%d \n",a);
  }
};

int main()
{
  Block_2D<int> a1(5,5);
  Block_2D<int> b = a1;
  device_vector<int> a(5*5);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  thrust::for_each(b.begin(),b.end(),printFunctor());

  thrust::window_vector<int> wv = window_vector<int>(&(b),3,3,1,1);
  printf("Start\n");
  // thrust::window_iterator<int> wi = wv.end();
  // int num = wv.begin().operator-(wv.end());
  // printf("%d\n", num);
  thrust::for_each(wv.begin(),wv.end(),windowPrintFunctor());
  thrust::for_each(b.begin(),b.end(),printFunctor());
  return 0;
}