#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
#define X 7
#define Y 6
using namespace thrust;
// testing window indexing
class printFunctor
{
public:
  __device__ void operator() (window_2D<int> myWindow)
  {
    int value = myWindow[0][0];

    myWindow[0][0]=666;
    printf(" %d , %d , %d\n",myWindow.start_x, myWindow.start_y,value);

  }
};
int main()
{
  Block_2D<int> a1(X,Y);
  Block_2D<int> b = a1;
  device_vector<int> a(X*Y);
  sequence(a.begin(),a.end());
  copy(a.begin(),a.end(),b.begin());
  window_vector<int> myVector = window_vector<int>(&b,2,3 ,2,3);
  std::cout<<"Size ="<<myVector.end()-myVector.begin()<<std::endl;
  window_iterator<int> myIter = myVector.begin();
  // myIter[0];
  for_each(myVector.begin(),myVector.end(),printFunctor());
  // std::cout<<hello.start_x;
  // std::cout<<"Indexing Test \n";

  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      std::cout<<b[i][j]<< " ";
    }
    std::cout<<"\n";
  }
  //
  // for (int i=0; i<3;i++)
  // {
  //   for (int j=0;j<3;j++)
  //   {
  //     std::cout<<c[i][j]<< " ";
  //   }
  //   std::cout<<"\n";
  // }
  //
  // for (int i=0; i<3;i++)
  // {
  //   for (int j=0;j<3;j++)
  //   {
  //     c[i][j]++;
  //   }
  // }
  //
  // for (int i=0; i<3;i++)
  // {
  //   for (int j=0;j<3;j++)
  //   {
  //     std::cout<<c[i][j]<< " ";
  //   }
  //   std::cout<<"\n";
  // }
  //
  // for (int i=0; i<4;i++)
  // {
  //   for (int j=0;j<5;j++)
  //   {
  //     std::cout<<b[i][j]<< " ";
  //   }
  //   std::cout<<"\n";
  // }



  return 0;
}
