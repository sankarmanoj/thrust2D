#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#include <thrust/block_2d.h>
using namespace thrust;
#define X 6
#define Y 6
class printFunctor
{
public:

__device__  void  operator() ( int  &a)
  {
    // a=threadIdx.x;
    printf("%d \n",a);
    // return 10;
  }
};
class printFunctor2
{
public:

__device__  __host__ int operator() (int  &a)
  {
    return 2*a;
  }
};
int main()
{
  block_2d<int> a(X,Y,99);
  // block_2d<int> b(X,Y);
  // printf("Last value = %d",(int)a[1][2]);
  sequence(a.begin(),a.end());

  // transform(a.begin(),a.end(),b.begin(),printFunctor2());
  for_each(a.begin(),a.end(),printFunctor());
  // host_block_2d<int> b(5,5);
  // sequence(b.begin(),b.end());
  // for_each(thrust::host,b.begin(),b.end(),printFunctor2());

  // copy(a.begin(),a.end(),b.begin());
  // for(int i = 0; i<25; i++)
  // {
  //   printf("%f\n",a[i/5][i%5]);
  // }
  cudaDeviceSynchronize();
  int *b = (int *) malloc(X*Y);
  cudaMemcpy2D(b,X*sizeof(int),a.data_pointer,a.pitch,X,Y,cudaMemcpyDeviceToHost);
  for (int i=0; i<Y;i++)
  {
    for (int j=0;j<X;j++)
    {
      std::cout<<b[i*X+j]<< " ";
    }
    std::cout<<"\n";
  }

  // thrust::window_vector<int> wv = window_vector<int>(&(b),3,3,1,1);
  // printf("Start\n");
  // // thrust::window_iterator<int> wi = wv.end();
  // // int num = wv.begin().operator-(wv.end());
  // // printf("%d\n", num);
  // thrust::for_each(wv.begin(),wv.end(),windowPrintFunctor());
  // cudaDeviceSynchronize();
  // // cudaMemcpy(temp,thrust::raw_pointer_cast(b.data()),25*sizeof(int),cudaMemcpyDeviceToHost);
  // // b.assign(temp,temp+25);
  // thrust::for_each(b.begin(),b.end(),printFunctor());
  return 0;
}
