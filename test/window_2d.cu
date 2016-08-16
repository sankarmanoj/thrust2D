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
  b.initalize_device_memory();
  window_2D<int> c(&b,0,0,3,3);
  std::cout<<"Indexing Test \n";

  for (int i=0; i<4;i++)
  {
    for (int j=0;j<5;j++)
    {
      std::cout<<b[i][j]<< " ";
    }
    std::cout<<"\n";
  }

  for (int i=0; i<3;i++)
  {
    for (int j=0;j<3;j++)
    {
      std::cout<<c[i][j]<< " ";
    }
    std::cout<<"\n";
  }

  for (int i=0; i<3;i++)
  {
    for (int j=0;j<3;j++)
    {
      c[i][j]++;
    }
  }

  for (int i=0; i<3;i++)
  {
    for (int j=0;j<3;j++)
    {
      std::cout<<c[i][j]<< " ";
    }
    std::cout<<"\n";
  }

  for (int i=0; i<4;i++)
  {
    for (int j=0;j<5;j++)
    {
      std::cout<<b[i][j]<< " ";
    }
    std::cout<<"\n";
  }

  return 0;
}
