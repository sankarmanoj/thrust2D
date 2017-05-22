#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#include <thrust/host_vector.h>
#include <thrust/window_transform.h>
#include <thrust/window_for_each.h>
#include <thrust/device_vector.h>
#include <thrust/window_2d.h>
#define X 100
#define Y 100
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

	__device__ void operator() (const thrust::window_2d<int> &c) const
	{
  	for(int i = 0; i< 3; i++)
			for(int j = 0; j<3;j++)
				c[i][j]=i*3+j;
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
  block_2d<int> a(X,Y,1);
  block_2d<int> c(X,Y,0);
  device_vector<int> hello(X*Y);
	fill(a.begin(),a.end(),1);
  // window_vector<int> myVector(&a,3,3,1,1);
  // std::cout<<"Size ="<<myVector.end()-myVector.begin()<<"\n Pitch = "<<a.pitch<<std::endl;
  // for_each(myVector.begin(),myVector.end(),printFunctor());
  // cudaDeviceSynchronize();
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
  thrust::window_vector<int> wv(&a,3,3,1,1);
  thrust::window_vector<int> wv2(&c,3,3,1,1);

  thrust::for_each(thrust::cuda::shared,wv.begin(),wv.end(),bob());

  b = a;
  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      printf("%4d ",b[i][j]);
    }
    std::cout<<"\n";
  }
  return 0;
}
