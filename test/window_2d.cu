#include <thrust/window_2d.h>
#include <thrust/window_transform.h>
#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <thrust/device_vector.h>
#include <iostream>
#define X 7
#define Y 6
using namespace thrust;
// testing window indexing
class printFunctor
{
public:
  __host__ __device__ void operator() (const host_window_2d<int> &myWindow) const
  {
    int value = myWindow[0][0];
    myWindow[0][0]=666;
    printf(" %d , %d , %d\n",myWindow.start_x, myWindow.start_y,value);
  }
};

class printFunctor2
{
public:
  __host__ __device__ int operator() (const host_window_2d<int> &myWindow) const
  {
    int value = myWindow[0][0];
    myWindow[0][0]=666;
    printf(" %d , %d , %d\n",myWindow.start_x, myWindow.start_y,value);
    return value;
  }
};

class printFunctor1 : shared_window_for_each_functor<int>
{
public:
  __device__ void operator() (const window_2d<int> &myWindow) const
  {
    int value = myWindow[0][0];

    myWindow[0][0]=666;
    printf(" %d , %d , %d\n",myWindow.start_x, myWindow.start_y,value);

  }
};
int main()
{
  host_block_2d<int> a(X,Y,0);
  sequence(a.begin(),a.end());
  host_window_vector<int> myVector(&a,3,3,3,3);
  std::cout<<"Size ="<<myVector.end()-myVector.begin()<<std::endl;
  host_vector<int> b(myVector.end()-myVector.begin(),0);
  transform(thrust::host,myVector.begin(),myVector.end(),b.begin(),printFunctor2());
  cudaDeviceSynchronize();
  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      std::cout<<a[i][j]<< " ";
    }
    std::cout<<"\n";
  }
  for(int i=0; i<myVector.end()-myVector.begin(); i++)
    std::cout<<b[i]<< " ";
  std::cout<<"\n";
  return 0;
}
