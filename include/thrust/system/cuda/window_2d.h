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
    size_t start_x,start_y;
    size_t local_start_x,local_start_y;
    size_t block_dim_x, block_dim_y;
    size_t window_dim_x, window_dim_y;
    T *data;
    size_t pitch;
    cudaTextureObject_t texref;
    bool is_shared;
    bool is_texture;
    __host__ __device__ window_2d();
    __host__ __device__ window_2d(block_2d<T,Alloc> *b, size_t start_x, size_t start_y, size_t window_dim_x, size_t window_dim_y);
    __host__ __device__ window_2d(cudaTextureObject_t texref, size_t start_x, size_t start_y, size_t window_dim_x, size_t window_dim_y);
    __host__ __device__ window_2d(block_2d<T,Alloc> *b,T *data , size_t start_x, size_t start_y, size_t local_start_x, size_t local_start_y, size_t window_dim_x, size_t window_dim_y, size_t block_dim_x, size_t block_dim_y,size_t pitch);
    __host__ __device__ window_2d(const window_2d &obj);
    __host__ __device__ window_2d_iterator<T> operator[](size_t index) const;
    __host__ __device__ T operator[](int2 index) const ;
  };

  template<class T>
  class window_2d_iterator
  {
    int position;
    T* data;
    bool is_shared;
  public:
    typedef T& reference;
    typedef T* pointer;
    __host__ __device__ window_2d_iterator(pointer data, size_t position);
    __host__ __device__ reference operator[] (size_t index) const;
  };

  template <class T>
	using host_window_2d=window_2d<T,std::allocator<T> >;

  template <class T,class Alloc=device_malloc_allocator<T> >
  class window_iterator : private detail::normal_iterator<typename detail::vector_base<window_2d<T>,Alloc>::pointer>
  {
    size_t position;
  public:
    block_2d<T,Alloc> *b;
    typedef long difference_type;
    typedef T base_value_type;
    typedef window_2d<T,Alloc> value_type;
    typedef typename detail::normal_iterator<typename detail::vector_base<window_2d<T>,Alloc>::pointer> iterator;
    typedef typename iterator::iterator_category iterator_category;
    typedef window_2d<T,Alloc> reference;
    typedef window_2d<T,Alloc>* pointer;
    size_t window_dim_x;
    size_t window_dim_y;
    size_t block_dim_x;
    size_t block_dim_y;
    size_t stride_x;
    size_t stride_y;
    size_t windows_along_x, windows_along_y;
    size_t pitch;
    T * data_pointer;
    __host__ window_iterator(block_2d<T,Alloc> *b, size_t window_dim_x, size_t window_dim_y, size_t stride_x, size_t stride_y);
    __host__ window_iterator(block_2d<T,Alloc> *b, size_t window_dim_x, size_t window_dim_y, size_t stride_x, size_t stride_y,size_t position);
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
    size_t windows_along_x, windows_along_y;
    size_t position;
  public:
    typedef window_2d<T,Alloc> reference;
    block_2d<T,Alloc> *b;
    size_t window_dim_x;
    size_t window_dim_y;
    size_t block_dim_x;
    size_t block_dim_y;
    size_t stride_x;
    size_t stride_y;
    window_vector(block_2d<T,Alloc> *b, size_t window_dim_x, size_t window_dim_y, size_t stride_x, size_t stride_y);
    window_iterator<T,Alloc> begin();
    window_iterator<T,Alloc> end();
  };

  template <class T>
	using host_window_vector=window_vector<T,std::allocator<T> >;
}
#include <thrust/system/cuda/window_2d.inl>
