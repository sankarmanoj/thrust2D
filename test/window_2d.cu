#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/window_2d.h>
#define X 10
#define Y 10
using namespace thrust;
// testing window indexing
class bob
{
public:
	int cols;
	int rows;
	int lambda;

  bob ()
	{
		this->cols = X;
		this->rows = Y;
		this->lambda = 1;
	}

	__device__ int operator() (thrust::window_2d<int> &c, thrust::window_2d<int> &w)
	{
    w[0][0]=c[0][0];
    printf("%d , %d = %d \n",c.start_x,c.start_y,&(c[0][0])- c.data);
    return 0;
	}
};
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
  block_2d<int> c(X,Y,0);
  device_vector<int> hello(X*Y);
  sequence(a.begin(),a.end());
  window_vector<int> myVector(&a,3,3,1,1);
  std::cout<<"Size ="<<myVector.end()-myVector.begin()<<"\n Pitch = "<<a.pitch<<std::endl;
  // for_each(myVector.begin(),myVector.end(),printFunctor());
  cudaDeviceSynchronize();
  // int *b = (int *) malloc(a.pitch*Y);
  // cudaMemcpy2D(b,a.pitch,a.data_pointer,a.pitch,X,Y,cudaMemcpyDeviceToHost);
  host_block_2d<int> b = a;
  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      std::cout<<b[i][j]<< " ";
    }
    std::cout<<"\n";
  }
  thrust::window_vector<int> wv(&a,1,1,1,1);
  thrust::window_vector<int> wv2(&c,1,1,1,1);

  printf("%d -%d  %d\n",wv.begin().windows_along_x,wv.begin().windows_along_y,wv.end()-wv.end());
  thrust::transform(wv.begin(),wv.end(),wv2.begin(),hello.begin(),bob());

  b = c ;
  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      std::cout<<b[i][j]<< " ";
    }
    std::cout<<"\n";
  }
  return 0;
}
