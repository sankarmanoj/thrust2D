#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
#include <typeinfo>
using namespace thrust;

// testing basic block functions
class printFunctor
{
public:

__device__  void operator() (window_2D<int>  a)
  {


printf("hello %p \n",a.b);
int value = a[0][0];
printf(" %d \n",value);

  }
};
int main()
{
  Block_2D<int> a1(5,5);
  Block_2D<int> b = a1;
  device_vector<int> a(25);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  // std::cout<<"Indexing Test \n";
  // for (int i=0; i<4;i++)
  // {
  //   for (int j=0;j<5;j++)
  //   {
  //     std::cout<<b[i][j]<< " ";
  //   }
  //   std::cout<<"\n";
  // }
  window_2D<int> * windows = getWindows(&(b),3,3);
  std::cout<<"Windows Created\n";
  thrust::device_vector<window_2D<int> > windowVector (windows,windows+9);
    std::cout<<"Vector Created\n";
   thrust::for_each(windowVector.begin(),windowVector.end(),printFunctor());
  return 0;
}
