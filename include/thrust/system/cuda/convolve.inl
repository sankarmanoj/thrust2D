#pragma once
#include <thrust/system/cuda/window_transform.h>
#define MAX_KERNEL_SIZE 51*51*4
__constant__ char c_memory[MAX_KERNEL_SIZE];
namespace thrust
{
  template <class T,class U>
  class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<uchar>
  {
  public:
    int dim;
    U *c_kernel;
    convolutionFunctor(int dim, U *kernel)
    {
      this->dim =dim;
      cudaMemcpyToSymbol(c_memory, kernel,dim*dim*sizeof(U));
      c_kernel = (U*) c_memory;
    }
    __device__ void operator() (const thrust::window_2d<T> &input_window,const thrust::window_2d<T> &output_window) const
    {
      // T temp = 0;
      // for(int i = 0; i< dim; i++)
      // {
      //   for(int j = 0; j<dim; j++)
      //   {
      //     // temp += (input_window[make_int2(j,i)]) * (c_kernel[i*dim + j]);
      //   }
      // }
      // output_window[dim/2][dim/2]=temp;
    }
  };

  template <class T,class U>
  void convolve(cuda::shared_policy,block_2d<T> *input, U *kernel,int dim,block_2d<T> *output)
  {
    window_vector<T> input_wv(input,dim,dim,1,1);
    window_vector<T> output_wv(output,dim,dim,1,1);
    convolutionFunctor<T,U> f(dim,kernel);
    transform(cuda::shared,input_wv.begin(),input_wv.end(),output_wv.begin(),f);
  }
}
