#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
using namespace thrust;
// testing window indexing
int main()
{
  Block_2D<int> a1(4,5);
  Block_2D<int> b = a1;
  device_vector<int> a(20);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  window_2D<int> c(&b,0,0,3,4);
  std::cout<<"Indexing Test \n";
  for (int i=0; i<3;i++)
  {
    for (int j=0;j<4;j++)
    {
      std::cout<<c[i][j]<< " ";
    }
    std::cout<<"\n";
  }

  return 0;
}
