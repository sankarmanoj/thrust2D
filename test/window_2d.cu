#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#define X 7
#define Y 6
using namespace thrust;
// testing window indexing
class printFunctor
{
public:
  __host__ __device__ void operator() (window_2d<int,std::allocator<int> > myWindow)
  {
    int value = myWindow[0][0];

    myWindow[0][0]=666;
    printf(" %d , %d , %d\n",myWindow.start_x, myWindow.start_y,value);

  }
};
int main()
{
  block_2d<int,std::allocator<int> > a(X,Y,0);
  sequence(a.begin(),a.end());
  window_vector<int,std::allocator<int> > myVector(&a,3,3,3,3);
  std::cout<<"Size ="<<myVector.end()-myVector.begin()<<std::endl;
  for_each(host,myVector.begin(),myVector.end(),printFunctor());
  cudaDeviceSynchronize();
  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      std::cout<<a[i][j]<< " ";
    }
    std::cout<<"\n";
  }
  return 0;
}
