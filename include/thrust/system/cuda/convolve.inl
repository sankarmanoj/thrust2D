#pragma once
#include <thrust/system/cuda/window_transform.h>
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
      c_kernel = get_constant_memory_pointer(kernel, kernel+dim*dim, cudaMemoryTypeHost);
      // cudaMalloc((void **)&c_kernel, dim*dim*sizeof(U));
      // cudaMemcpy(c_kernel, kernel, dim*dim*sizeof(U),cudaMemcpyHostToDevice);
    }
    __device__ void operator() (const thrust::window_2d<T> &input_window,const thrust::window_2d<T> &output_window) const
    {
      T temp = 0;
      for(int i = 0; i< dim; i++)
      {
        for(int j = 0; j<dim; j++)
        {
          temp += (input_window[make_int2(j,i)]) * (c_kernel[i*dim + j]);
        }
      }
      output_window[dim/2][dim/2]=temp;
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
  template <class T,class U>
  void convolve(cuda::texture_policy,block_2d<T> *input, U *kernel,int dim,block_2d<T> *output)
  {
    window_vector<T> input_wv(input,dim,dim,1,1);
    window_vector<T> output_wv(output,dim,dim,1,1);
    convolutionFunctor<T,U> f(dim,kernel);
    transform(cuda::texture,input_wv.begin(),input_wv.end(),output_wv.begin(),f);
  }
}
