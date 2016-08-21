#pragma once

#include <thrust/block_2d.h>
namespace thrust
{
  template <class T>
  class window_2D
  {

  public:
    typedef window_2D reference;
    int start_x,start_y;
    int block_dim_x, block_dim_y;
    int window_dim_x, window_dim_y;
    thrust::Block_2D<T> *b;
    __host__ __device__ window_2D ();
    __host__ __device__ window_2D (Block_2D<T> *b, int start_x, int start_y, int window_dim_x, int window_dim_y);
    __host__ __device__ window_2D (const window_2D &obj);
    __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > operator[] (long index);
    __host__ __device__ const thrust::detail::normal_iterator<thrust::device_ptr<T> > operator[] (long index) const;
    // __host__ __device__ operator device_reference<window_2D<T> >() const;
  };

  template <class T>
  class window_iterator : private thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > >
  {
    int windows_along_x, windows_along_y;
    int position;
  public:
    Block_2D<T> *b;
    typedef long difference_type;
    typedef window_2D<T > value_type;
    typedef thrust::detail::iterator_category_with_system_and_traversal<thrust::random_access_device_iterator_tag, thrust::system::cuda::detail::tag, thrust::random_access_traversal_tag> iterator_category;
    typedef window_2D<T> reference;
    typedef window_2D<T>* pointer;
    int window_dim_x;
    int window_dim_y;
    int block_dim_x;
    int block_dim_y;
    int stride_x;
    int stride_y;
    __host__ window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y);
    __host__ window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int position);
    __host__ __device__ window_2D<T> operator[] (long index);
    __host__ __device__ const window_2D<T> operator[] (long index) const;
    __host__ __device__ window_2D<T> operator* ();
    __host__ __device__ const window_2D<T> operator* () const;

    __host__ __device__ long operator- (window_iterator& it);
    __host__ __device__ long operator- (const window_iterator& it);
    __host__ __device__ long operator- (const window_iterator& it) const;
    __host__ __device__ long operator- (window_iterator& it) const;


    __host__ __device__ window_iterator<T> operator+ (long N);

    __host__ __device__ window_iterator<T> operator++ ();

    __host__ __device__ window_iterator<T> operator- (long N);

    __host__  __device__ window_iterator<T> (const window_iterator<T>& other);

    __host__ __device__ window_iterator<T>& operator= (window_iterator<T>& it);

    __host__ __device__ bool operator!= (const window_iterator<T>& it) const;
    __host__ __device__ bool operator== (const window_iterator<T>& it) const;
    __host__ __device__ bool operator> (const window_iterator<T>& it) const;
    __host__ __device__ bool operator>= (const window_iterator<T>& it) const;
    __host__ __device__ bool operator< (const window_iterator<T>& it) const;
    __host__ __device__ bool operator<= (const window_iterator<T>& it) const;

    __host__ __device__ __forceinline__ window_iterator<T> operator+= (long N);
    __host__ __device__ __forceinline__ const window_iterator<T> operator+= (long N) const;


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
