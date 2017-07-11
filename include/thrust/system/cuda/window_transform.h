#pragma once

#include <thrust/window_2d.h>
#include "window_structures.h"
#include <thrust/constant_memory.h>
#define maxThreadsPerBlock1 1024
#define minBlocksPerMultiprocessor 2

namespace thrust
{

  template <class Iterator1, class Iterator2, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1, Iterator2 begin2, Func f);

  template <class Iterator1, class Iterator2, class Iterator3 , class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1, Iterator2 begin2, Iterator3 begin3, Func f);

  template <class T,class U>
  void convolve(cuda::shared_policy,block_2d<T> *input, U *kernelX, U *kernelY,int dim,block_2d<T> *output);
  template <class T, class U>
  void convolve(cuda::texture_policy,block_2d<T> *input, U *kernel,int dim,block_2d<T> *output);

  template <class T>
  class shared_binary_window_transform_functor
  {
  public:
    __device__ virtual void operator() (const window_2d<T> &w_in1, const window_2d<T> &w_in2, const window_2d<T> &w_out) const = 0;
  };
  template <class T>
  class shared_unary_window_transform_functor
  {
  public:
    __device__ virtual void operator() (const window_2d<T> &w_in, const window_2d<T> &w_out) const  = 0;
  };

}
#include <thrust/system/cuda/window_transform.inl>
#include <thrust/system/cuda/convolve.inl>
