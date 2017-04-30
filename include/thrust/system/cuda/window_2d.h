#pragma once

#include <thrust/block_2d.h>
namespace thrust
{
  template<class T> class window_2d_iterator;
  template <class T,class Alloc=device_malloc_allocator<T> >
  class window_2d
  {
  public:
    typedef window_2d<T,Alloc> reference;
    int start_x,start_y;
    int local_start_x,local_start_y;
    int block_dim_x, block_dim_y;
    int window_dim_x, window_dim_y;
    T *data;
    int pitch;
    #if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CUDA
    cudaTextureObject_t texref;
    bool is_shared;
    bool is_texture;
    #endif
    __host__ __device__ window_2d();
    __host__ __device__ window_2d(block_2d<T,Alloc> *b, int start_x, int start_y, int window_dim_x, int window_dim_y);
    #if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CUDA
    __host__ __device__ window_2d(cudaTextureObject_t texref, int start_x, int start_y, int window_dim_x, int window_dim_y);
    __host__ __device__ window_2d(block_2d<T,Alloc> *b,T *data , int start_x, int start_y, int local_start_x, int local_start_y, int window_dim_x, int window_dim_y, int block_dim_x, int block_dim_y,int pitch);
    #endif
    __host__ __device__ window_2d(const window_2d &obj);
    __host__ __device__ window_2d_iterator<T> operator[](int index) const;
    __host__ __device__ T operator[](int2 index) const ;
  };

  template<class T>
  class window_2d_iterator
  {
    int position;
    T* data;
  public:
    typedef T& reference;
    typedef T* pointer;
    __host__ __device__ window_2d_iterator(pointer data, int position);
    __host__ __device__ reference operator[] (int index) const;
  };

  template <class T>
	using host_window_2d=window_2d<T,std::allocator<T> >;

  template <class T,class Alloc=device_malloc_allocator<T> >
  class window_iterator : private detail::normal_iterator<typename detail::vector_base<window_2d<T>,Alloc>::pointer>
  {
    int position;
  public:
    block_2d<T,Alloc> *b;
    typedef long difference_type;
    typedef T base_value_type;
    typedef window_2d<T,Alloc> value_type;
    typedef typename detail::normal_iterator<typename detail::vector_base<window_2d<T>,Alloc>::pointer> iterator;
    typedef typename iterator::iterator_category iterator_category;
    typedef window_2d<T,Alloc> reference;
    typedef window_2d<T,Alloc>* pointer;
    int window_dim_x;
    int window_dim_y;
    int block_dim_x;
    int block_dim_y;
    int stride_x;
    int stride_y;
    int windows_along_x, windows_along_y;
    int pitch;
    T * data_pointer;
    window_iterator *device_pointer;
    __host__ window_iterator(block_2d<T,Alloc> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y);
    __host__ window_iterator(block_2d<T,Alloc> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int position);
    __host__ __device__ reference operator* () const;
    __host__ __device__ difference_type operator- (window_iterator<T,Alloc>& it) const;
    __host__ __device__ difference_type operator- (const window_iterator<T,Alloc>& it) const;
    __host__ __device__ window_iterator<T,Alloc> operator+ (long N);
    __host__ __device__ window_iterator<T,Alloc> operator++ ();
    __host__ __device__ window_iterator<T,Alloc> operator- (long N);
    __host__ __device__ window_iterator<T,Alloc> (const window_iterator<T,Alloc>& other);
    __host__ __device__ window_iterator<T,Alloc>& operator= (window_iterator<T,Alloc>& it);
    __host__ __device__ bool operator!= (const window_iterator<T,Alloc>& it) const;
    __host__ __device__ bool operator== (const window_iterator<T,Alloc>& it) const;
    __host__ __device__ bool operator> (const window_iterator<T,Alloc>& it) const;
    __host__ __device__ bool operator>= (const window_iterator<T,Alloc>& it) const;
    __host__ __device__ bool operator< (const window_iterator<T,Alloc>& it) const;
    __host__ __device__ bool operator<= (const window_iterator<T,Alloc>& it) const;
    __host__ __device__ __forceinline__ window_iterator<T,Alloc> operator+= (long N);
  };

  template <class T,class Alloc=device_malloc_allocator<T> >
  class window_vector
  {
    int position;
  public:
    typedef window_2d<T,Alloc> reference;
    block_2d<T,Alloc> *b;
    int window_dim_x;
    int window_dim_y;
    int block_dim_x;
    int block_dim_y;
    int stride_x;
    int stride_y;
    window_vector(block_2d<T,Alloc> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y);
    window_iterator<T,Alloc> begin();
    window_iterator<T,Alloc> end();
  };

  template <class T>
	using host_window_vector=window_vector<T,std::allocator<T> >;
}
#include <thrust/system/cuda/window_2d.inl>
