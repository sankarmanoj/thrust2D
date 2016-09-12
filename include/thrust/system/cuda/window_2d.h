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
    Block_2D<T> *b;
    __host__ __device__ window_2D ();
    __host__ __device__ window_2D (Block_2D<T> *b, int start_x, int start_y, int window_dim_x, int window_dim_y);
    __host__ __device__ window_2D (const window_2D &obj);
    __host__ __device__ detail::normal_iterator<device_ptr<T> > operator[] (long index);
    __host__ __device__ const detail::normal_iterator<device_ptr<T> > operator[] (long index) const;
    // __host__ __device__ operator device_reference<window_2D<T> >() const;
  };

template<class T>
class shared_window_2D_iterator
{
  int position;
  T * data;
public:
  __host__ __device__ shared_window_2D_iterator(T * data, long position);
  __host__ __device__ T& operator[] (long index) ;

};

  template<class T>
  class shared_window_2D : private window_2D<T>
  {
  public:
  using window_2D<T>::reference;
  using window_2D<T>::start_x;
  using window_2D<T>::start_y;
  using window_2D<T>::block_dim_x;
  using window_2D<T>::block_dim_y;
  using window_2D<T>::window_dim_x;
  using window_2D<T>::window_dim_y;
    T * data;
    __host__ __device__ shared_window_2D (T *data , int start_x, int start_y, int window_dim_x, int window_dim_y, int block_dim_x, int block_dim_y);
    __host__ __device__ shared_window_2D_iterator<T> operator[] (long index);

  };

  template <class T>
  class window_iterator : private detail::normal_iterator<device_ptr<window_2D<T> > >
  {

    int position;
  public:
    Block_2D<T> *b;
    typedef long difference_type;
    typedef T base_value_type;
    typedef window_2D<T > value_type;
    typedef detail::iterator_category_with_system_and_traversal<random_access_device_iterator_tag, system::cuda::detail::tag, random_access_traversal_tag> iterator_category;
    typedef window_2D<T> reference;
    typedef window_2D<T>* pointer;
    int window_dim_x;
    int window_dim_y;
    int block_dim_x;
    int block_dim_y;
    int stride_x;
    int stride_y;
    int windows_along_x, windows_along_y;
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
