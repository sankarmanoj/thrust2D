#pragma once

#include <thrust/window_2d.h>
#include <thrust/execution_policy.h>

namespace thrust
{
  namespace cuda
  {
    struct shared_policy : device_execution_policy<shared_policy> {};
    shared_policy shared;
  }
  template <class Iterator>
  void convolve(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2);
  template <class Iterator, class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f);
  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f);
  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f);
  #define MATRIX_TILE_WIDTH 2
  template <class T>
  block_2d<T> matrix_multiply(block_2d<T> *a, block_2d<T> *b);
  template <class T>
  void transpose(block_2d<T> *a);

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
  template <class T>
  class shared_window_for_each_functor
  {
  public:
    __device__ virtual void operator() (const window_2d<T> &w) const = 0;
  };
}
#include <thrust/system/cuda/window_transform.inl>
