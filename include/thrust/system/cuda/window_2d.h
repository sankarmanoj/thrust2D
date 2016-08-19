#pragma once

#include <thrust/block_2d.h>
namespace thrust
{
  template <class T>
  class window_2D
  {
  public:
    int start_x,start_y;
    int block_dim_x, block_dim_y;
    int window_dim_x, window_dim_y;
    thrust::Block_2D<T> *b;
    __host__ __device__ window_2D ();
    __host__ __device__ window_2D (Block_2D<T> *b, int start_x, int start_y, int window_dim_x, int window_dim_y);
    __host__ __device__ window_2D (const window_2D &obj);
    __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > operator[] (int index);
    __host__ __device__ operator device_reference<window_2D<T> >() const;
  };

  template <class T>
  class window_iterator : public thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > >
  {
    int windows_along_x, windows_along_y;
    int position;
  public:
    Block_2D<T> *b;

    int window_dim_x;
    int window_dim_y;
    int block_dim_x;
    int block_dim_y;
    int stride_x;
    int stride_y;
    __host__ window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y);
    __host__ window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int position);
    __host__ __device__ window_2D<T> operator[] (unsigned int index);
    __host__ __device__ const window_2D<T> operator[] (unsigned int index) const;
    __host__ __device__ window_2D<T> operator* ();
    __host__ __device__ const window_2D<T> operator* () const;

    __host__ __device__ int operator- (const window_iterator& it);

    __host__ __device__ window_iterator<T> operator+ (long N);

    __host__ __device__ window_iterator<T> operator++ ();

    __host__ __device__ window_iterator<T> operator- (long N);

    __host__ __device__ window_iterator<T> (const window_iterator<T>& other);

    __host__ __device__ window_iterator<T>& operator= (window_iterator<T> it);

    __host__ __device__ __forceinline__ window_iterator<T> operator+= (long N);
    __host__ __device__ __forceinline__ const window_iterator<T> operator+= (long N) const;

    // __host__ __device__ bool operator< (const window_iterator<T>& it);

  };

  template <class T>
  class window_vector
  {
    int windows_along_x, windows_along_y;
    int position;
  public:
    Block_2D<T> *b;
    int window_dim_x;
    int window_dim_y;
    int block_dim_x;
    int block_dim_y;
    int stride_x;
    int stride_y;
    window_vector(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y);

    __host__ __device__ window_2D<T> operator[] (unsigned int index);
    __host__ __device__ const window_2D<T> operator[] (unsigned int index) const;
    __host__ __device__ window_2D<T> operator* ();
    __host__ __device__ const window_2D<T> operator* () const;


    window_iterator<T> begin();
    window_iterator<T> end();
  };
}
#include <thrust/system/cuda/window_2d.inl>
