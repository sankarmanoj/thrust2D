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

__device__  void operator() (window_2D<int>  & a)
  {



    int value = a[0][0];
    a[0][0]=3;

  }
};
int main()
{
  Block_2D<int> a1(1000,1000);
  Block_2D<int> b = a1;
  device_vector<int> a(1000*1000);
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
  b.get_device_pointer();
  thrust::device_vector<window_2D<int> >windowVector = getWindows(&(b),3,3);
  std::cout<<"Windows Created\n";

    std::cout<<"Vector Created\n";
   thrust::for_each(windowVector.begin(),windowVector.end(),printFunctor());
  return 0;
}
