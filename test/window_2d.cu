#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#include <thrust/host_vector.h>
#include <thrust/window_2d.h>
#define X 6
#define Y 6
using namespace thrust;
// testing window indexing
class printFunctor
{
public:
  __host__ __device__ void operator() (const window_2d<int> &myWindow) const
  {
    int value = myWindow[0][0];
    myWindow[0][0]=666;
    printf(" %ld , %ld , %d\n",myWindow.start_x, myWindow.start_y,value);
  }
};

class printFunctor2
{
public:
  __host__ __device__ int operator() (const window_2d<int> &myWindow) const
  {
    int value = myWindow[0][0];
    myWindow[0][0]=666;
    printf(" %ld , %ld , %d\n",myWindow.start_x, myWindow.start_y,value);
    return value;
  }
};

class printFunctor1
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
  block_2d<int> a(X,Y,0);
  sequence(a.begin(),a.end());
  window_vector<int> myVector(&a,3,3,3,3);
  std::cout<<"Size ="<<myVector.end()-myVector.begin()<<"\n Pitch = "<<a.pitch<<std::endl;
  // for_each(myVector.begin(),myVector.end(),printFunctor());
  cudaDeviceSynchronize();
  int *b = (int *) malloc(a.pitch*Y);
  cudaMemcpy2D(b,a.pitch,a.data_pointer,a.pitch,X,Y,cudaMemcpyDeviceToHost);
  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      std::cout<<b[i*a.pitch/sizeof(int)+j]<< " ";
    }
    std::cout<<"\n";
  }
  // for(int i=0; i<myVector.end()-myVector.begin(); i++)
  //   std::cout<<b[i]<< " ";
  // std::cout<<"\n";
  return 0;
}
