#pragma once

#include <thrust/window_2d.h>
#include <thrust/execution_policy.h>

#define maxThreadsPerBlock1 1024
#define minBlocksPerMultiprocessor 2

namespace thrust
{
  namespace cuda
  {
    struct shared_policy : device_execution_policy<shared_policy> {};
    shared_policy shared;
  }
  struct launcher_config
  {
    int shared_block_dim_y , shared_block_dim_x ;
    int rows_per_block_by_windows ;
    int operations_per_block , operations_per_thread;
    int shared_memory_size;
    int blocks; // Total blocks
    int blocks_per_row;
    int total_operations;

  };
  struct warp_launcher_config
  {
    int size_along_x, size_along_y;
    int warp_size;
    int stride_x,stride_y;
    int shared_size_x;
    int padding;
  };
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
#include <thrust/system/cuda/window_opt_transform.inl>
