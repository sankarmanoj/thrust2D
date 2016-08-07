#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <iostream>

#include <thrust/device_vector.h>
#include <thrust/transform.h>
#include <thrust/sequence.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/replace.h>
#include <thrust/functional.h>
// #include <thrust/block_2d.h>

class printFunctor
{
public:

__device__ __host__  void operator() (int a)
  {
    printf("%d\n",a);
  }
};
int main(int argc, char ** argv)
{

  thrust::host_vector<int> H(4);
  thrust::sequence(H.begin(),H.end());
  printFunctor a = printFunctor();
  a(2);
   thrust::for_each(H.begin(),H.end(),a);

}
