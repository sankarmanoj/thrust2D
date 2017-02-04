#pragma once

#include <thrust/window_2d.h>
#include <thrust/execution_policy.h>

#include "window_structures.h"
#define maxThreadsPerBlock1 1024
#define minBlocksPerMultiprocessor 2

namespace thrust
{

  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f);
  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f);

  template <class T>
  void convolve(cuda::texture_policy,block_2d<T> *block, float *kernel);

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
#include <thrust/system/cuda/window_opt_transform.inl>
#include <thrust/system/cuda/convolve.inl>
