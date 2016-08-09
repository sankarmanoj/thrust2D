#pragma once

#include <thrust/block_2d.h>
#define DEFAULT_BLOCK_SIZE 32
namespace thrust
{
template <class T>
class window_2D
{
public:
  int start_x,start_y;
  int block_dim_x, block_dim_y;
  int window_dim_x, window_dim_y;
  Block_2D<T> *b;
  __host__ __device__ window_2D ();
  __host__ __device__ window_2D (Block_2D<T> *b, int start_x, int start_y, int window_dim_x, int window_dim_y);
  __host__ __device__ window_2D (const window_2D &obj);
  __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > operator[] (int index);
};

template <class T>
class window_transform_functor
{
public:
	__device__ virtual void operator() (window_2D<T> w_in1, window_2D<T> w_in2, window_2D<T> w_out) = 0;
};

template <class T>
thrust::device_vector<window_2D<T> >getWindows(Block_2D<T> * parentBlock, int window_dim_x, int window_dim_y);

template <class T>
thrust::device_vector<window_2D<T> >getWindows(Block_2D<T> * parentBlock, int window_dim_x, int window_dim_y, int stride_x, int stride_y);

template <class T>
class window_for_each_functor
{
public:
  __device__ virtual void operator() (window_2D<T> w) = 0;
};
}
#include <thrust/system/cuda/window_2d.inl>
