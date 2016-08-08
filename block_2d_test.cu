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

__device__  void operator() (window_2D<int>  & a)
  {



    int value = a[0][0];
    a[0][0]=3;

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
  Block_2D<int> a1(3,3);
  Block_2D<int> b = a1;
  device_vector<int> a(3*3);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  thrust::for_each(b.begin(),b.end(),printFunctor());

  thrust::device_vector<window_2D<int> >windowVector = getWindows(&(b),3,3);

  std::cout<<"Windows Created\n";

 thrust::for_each(windowVector.begin(),windowVector.end(),windowPrintFunctor());
   thrust::for_each(b.begin(),b.end(),printFunctor());
  return 0;
}
