#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <iostream>
#include <typeinfo>
using namespace thrust;

// testing basic block functions
class windowPrintFunctor
{
public:

__device__  void operator() (const window_2D<int> &a) const
  {
    a[0][0] = 666;
    // int value = a[0][0];
    // printf("%d \n",value);
  }
};
class printFunctor
{
public:

__device__  void  operator() ( int  &a)
  {
    printf("%d \n",a);
    // return 10;
  }
};
class printFunctor2
{
public:

__device__  void operator() (const int  &a) const
  {
    printf("%d \n",a);
  }
};
int main()
{
  // int *temp;
  // temp = (int *) malloc(25 * sizeof(int));
  Block_2D<int> a1(5,5);
  Block_2D<int> b = a1;
  device_vector<int> a(5*5);
  device_vector<int> c(5*5);

  sequence(b.begin(),b.end());
  thrust::detail::normal_iterator<thrust::device_ptr<int> > adf = a.begin();
  std::cout<<typeid(thrust::detail::normal_iterator<thrust::device_ptr<int> >::reference).name()<<"\n";

  // copy(a.begin(),a.end(),b.begin());
  // for(int i = 0; i<25; i++)
  // {
  //   printf("%f\n",a[i/5][i%5]);
  // }
  // // cudaDeviceSynchronize();

  // thrust::window_vector<int> wv = window_vector<int>(&(b),3,3,1,1);
  // printf("Start\n");
  // // thrust::window_iterator<int> wi = wv.end();
  // // int num = wv.begin().operator-(wv.end());
  // // printf("%d\n", num);
  // thrust::for_each(wv.begin(),wv.end(),windowPrintFunctor());
  // cudaDeviceSynchronize();
  // // cudaMemcpy(temp,thrust::raw_pointer_cast(b.data()),25*sizeof(int),cudaMemcpyDeviceToHost);
  // // b.assign(temp,temp+25);
  thrust::for_each(b.begin(),b.end(),printFunctor());
  return 0;
}
