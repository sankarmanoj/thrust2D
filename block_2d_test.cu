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
  Block_2D<int> a1(5,5);
  Block_2D<int> b = a1;
  device_vector<int> a(5*5);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  thrust::for_each(b.begin(),b.end(),printFunctor());

  thrust::device_vector<window_2D<int> > window_vector = get_windows(&(b),3,3,2,2);

  std::cout<<"Windows Created\n";

 thrust::for_each(window_vector.begin(),window_vector.end(),windowPrintFunctor());
 thrust::for_each(b.begin(),b.end(),printFunctor());
 return 0;
}
