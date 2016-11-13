#pragma once
#include <thrust/system/cuda/window_2d.h>
namespace thrust
{
  template <class T,class Alloc>
  __host__ __device__ window_2d<T,Alloc>::window_2d()
  {

  }

  template <class T,class Alloc>
  __host__ __device__ window_2d<T,Alloc>::window_2d(block_2d<T,Alloc> *b,int start_x, int start_y, int window_dim_x, int window_dim_y, int block_dim_x, int block_dim_y)
  {
    this->start_x = start_x;
    this->window_dim_x = window_dim_x;
    this->start_y = start_y;
    this->window_dim_y = window_dim_y;
    this->b = b;
    this->block_dim_x = block_dim_x;
    this->block_dim_y = block_dim_y;
    is_shared = false;
  }
  template <class T,class Alloc>
  __host__ __device__ window_2d<T,Alloc>::window_2d (const window_2d<T,Alloc> &obj)
  {
    start_x = obj.start_x;
    start_y = obj.start_y;
    window_dim_x = obj.window_dim_x;
    window_dim_y = obj.window_dim_y;
    b = obj.b;
    block_dim_y = obj.block_dim_y;
    block_dim_x = obj.block_dim_x;
    is_shared = obj.is_shared;
  }

  template <class T,class Alloc>
  __host__ __device__ window_2d<T,Alloc>::window_2d(T *data,int start_x, int start_y, int window_dim_x, int window_dim_y, int block_dim_x, int block_dim_y)
  {
    this->start_x = start_x;
    this->window_dim_x = window_dim_x;
    this->start_y = start_y;
    this->window_dim_y = window_dim_y;
    this->data = data;
    this->block_dim_x = block_dim_x;
    this->block_dim_y = block_dim_y;
    is_shared = true;
  }

  template <class T,class Alloc>
  __host__ __device__ window_2d_iterator<T,Alloc>::window_2d_iterator<T,Alloc>(T * data, long position)
  {
    this->data = data;
    this->position = position;
    is_shared =true;
  }

  template <class T,class Alloc>
  __host__ __device__ window_2d_iterator<T,Alloc>::window_2d_iterator<T,Alloc>(block_2d<T,Alloc> *b, long position)
  {
    this->b = b;
    this->position = position;
    is_shared = false;
  }
  template <class T,class Alloc>
  __host__ __device__ window_2d_iterator<T,Alloc> window_2d<T,Alloc>::operator[] (long index)
  {
    long position = (start_y+index)*block_dim_x + start_x;
    if(is_shared)
    {
      return window_2d_iterator<T,Alloc>(data,position);
    }
    else
    {
      return window_2d_iterator<T,Alloc>(b,position);
    }
  }

  template <class T,class Alloc>
  __host__ __device__ const window_2d_iterator<T,Alloc> window_2d<T,Alloc>::operator[] (long index) const
  {
    long position = (start_y+index)*block_dim_x + start_x;
    if(is_shared)
    {
      return window_2d_iterator<T,Alloc>(data,position);
    }
    else
    {
      return window_2d_iterator<T,Alloc>(b,position);
    }
  }
  template<class T,class Alloc>
  __host__ __device__ T& window_2d_iterator<T,Alloc>::operator[] (long index)
  {
    if(is_shared)
    {
      return &data[position + index];
    }
    else
    {
      &(b->data[position + index]);
    }
  }

  template<class T,class Alloc>
  __host__ __device__ T& window_2d_iterator<T,Alloc>::operator[] (long index) const
  {
    if(is_shared)
    {
      return data[position + index];
    }
    else
    {
      return (b->data[position + index]);
    }
  }

  template <class T,class Alloc>
  __host__ window_iterator<T,Alloc>::window_iterator(block_2d<T,Alloc> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {
    this->b = b->device_pointer;
    this->data_pointer = b->data;
    this->block_dim_x = b->dim_x;
    this->block_dim_y = b->dim_y;
    this->window_dim_x = window_dim_x;
    this->window_dim_y = window_dim_y;
    this->stride_x = stride_x;
    this->stride_y = stride_y;
    this->position =0;
    this->windows_along_x = int((this->block_dim_x-window_dim_x)/stride_x)+1;
    this->windows_along_y = int((this->block_dim_y-window_dim_y)/stride_y)+1;
    if (typeid(Alloc) == typeid(device_malloc_allocator<T>))
    {
      cudaMemPrefetchAsync(this->data_pointer, sizeof(T)*block_dim_x*block_dim_y, 0, 0);
      cudaDeviceSynchronize();
    }
  }

  template <class T,class Alloc>
  __host__ window_iterator<T,Alloc>::window_iterator(block_2d<T,Alloc> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int position)
  {
    this->b = b->device_pointer;
    this->data_pointer = b->data;
    this->block_dim_x = b->dim_x;
    this->block_dim_y = b->dim_y;
    this->window_dim_x = window_dim_x;
    this->window_dim_y = window_dim_y;
    this->stride_x = stride_x;
    this->stride_y = stride_y;
    this->position =position;
    this->windows_along_x= int((this->block_dim_x-window_dim_x)/stride_x) +1;
    this->windows_along_y = int((this->block_dim_y-window_dim_y)/stride_y)+1;
  }
  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>::reference window_iterator<T,Alloc>::operator[] (long index)
  {
    int i = index%windows_along_x;
    int j = index/windows_along_x;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
    window_2d<T,Alloc> temp(b, start_x,start_y,window_dim_x, window_dim_y, block_dim_x, block_dim_y);
    return temp;
  }

  template <class T,class Alloc>
  __host__ __device__ const window_iterator<T,Alloc>::reference window_iterator<T,Alloc>::operator[] (long index) const
  {
    int i = index%windows_along_x;
    int j = index/windows_along_x;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
    window_2d<T,Alloc> temp(b, start_x,start_y,window_dim_x, window_dim_y, block_dim_x, block_dim_y);
    return temp;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>::reference window_iterator<T,Alloc>::operator* ()
  {
    int i = position%windows_along_x;
    int j = position/windows_along_x;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
    window_2d<T,Alloc> temp(b, start_x,start_y,window_dim_x, window_dim_y, block_dim_x, block_dim_y);
    return temp;
  }

  template <class T,class Alloc>
  __host__ __device__ const window_iterator<T,Alloc>::reference window_iterator<T,Alloc>::operator* () const
  {
    int i = position%windows_along_x;
    int j = position/windows_along_x;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
    window_2d<T,Alloc> temp(b, start_x,start_y,window_dim_x, window_dim_y, block_dim_x, block_dim_y);
    return temp;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>::difference_type window_iterator<T,Alloc>::operator- (window_iterator<T,Alloc> &it)
  {
    return this->position - it.position;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>::difference_type window_iterator<T,Alloc>::operator- (const window_iterator<T,Alloc> &it)
  {
    return this->position - it.position;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>::difference_type window_iterator<T,Alloc>::operator- (const window_iterator<T,Alloc> &it) const
  {
    return this->position - it.position;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>::difference_type window_iterator<T,Alloc>::operator- ( window_iterator<T,Alloc> &it) const
  {
    return this->position - it.position;
  }
  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc> window_iterator<T,Alloc>::operator+ (long N)
  {
    this->position = this->position+N;
    if(this->position>=(this->windows_along_x*this->windows_along_y))
      this->position=(this->windows_along_x*this->windows_along_y);
    return *this;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc> window_iterator<T,Alloc>::operator++ ()
  {
    this->position++;
    if(this->position>=(this->windows_along_x*this->windows_along_y))
      this->position=(this->windows_along_x*this->windows_along_y);
    return *this;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc> window_iterator<T,Alloc>::operator- (long N)
  {
    this->position = this->position - N;
    if(this->position<0)
      this->position = 0;
    return *this;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>::window_iterator<T,Alloc> (const window_iterator<T,Alloc>& other)
  {
    this->b = other.b;
    this->window_dim_x = other.window_dim_x;
    this->window_dim_y = other.window_dim_y;
    this->stride_x = other.stride_x;
    this->stride_y = other.stride_y;
    this->block_dim_x = other.block_dim_x;
    this->block_dim_y = other.block_dim_y;
    this->position = other.position;
    this->windows_along_x = other.windows_along_x;
    this->windows_along_y = other.windows_along_y;
  }

  template <class T,class Alloc>
  __host__ __device__ window_iterator<T,Alloc>& window_iterator<T,Alloc>::operator= (window_iterator<T,Alloc>& it)
  {
    this->b = it.b;
    this->window_dim_x = it.window_dim_x;
    this->window_dim_y = it.window_dim_y;
    this->stride_x = it.stride_x;
    this->stride_y = it.stride_y;
    this->block_dim_x = it.block_dim_x;
    this->block_dim_y = it.block_dim_y;
    this->position = it.position;
    this->windows_along_x = it.windows_along_x;
    this->windows_along_y = it.windows_along_y;
    return this;
  }

  template <class T,class Alloc>
  __host__ __device__ __forceinline__ window_iterator<T,Alloc> window_iterator<T,Alloc>::operator+= (long N)
  {
    this->position+=N;
    if(this->position>=(this->windows_along_x*this->windows_along_y))
      this->position=(this->windows_along_x*this->windows_along_y);
    return *this;
  }

  template <class T,class Alloc>
  __host__ __device__ __forceinline__ const window_iterator<T,Alloc> window_iterator<T,Alloc>::operator+= (long N) const
  {
    this->position+=N;
    if(this->position>=(this->windows_along_x*this->windows_along_y))
      this->position=(this->windows_along_x*this->windows_along_y);
    return *this;
  }

  template <class T,class Alloc>
  __host__ __device__ bool window_iterator<T,Alloc>::operator!= (const window_iterator<T,Alloc> &it) const
  {
    return this->position!=it.position;
  }

  template <class T,class Alloc>
  __host__ __device__ bool window_iterator<T,Alloc>::operator== (const window_iterator<T,Alloc> &it) const
  {
    return this->position==it.position;
  }

  template <class T,class Alloc>
  __host__ __device__ bool window_iterator<T,Alloc>::operator> (const window_iterator<T,Alloc> &it) const
  {
    return this->position>it.position;
  }

  template <class T,class Alloc>
  __host__ __device__ bool window_iterator<T,Alloc>::operator>= (const window_iterator<T,Alloc> &it) const
  {
    return this->position>=it.position;
  }

  template <class T,class Alloc>
  __host__ __device__ bool window_iterator<T,Alloc>::operator< (const window_iterator<T,Alloc> &it) const
  {
    return this->position<it.position;
  }
  template <class T,class Alloc>
  __host__ __device__ bool window_iterator<T,Alloc>::operator<= (const window_iterator<T,Alloc> &it) const
  {
    return this->position<=it.position;
  }

  template <class T,class Alloc>
  window_vector<T,Alloc>::window_vector (block_2d<T,Alloc> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {
    this->b = b;
    this->window_dim_x = window_dim_x;
    this->window_dim_y = window_dim_y;
    this->stride_x = stride_x;
    this->stride_y = stride_y;
  }
  template <class T,class Alloc>
  window_iterator<T,Alloc> window_vector<T,Alloc>::begin()
  {
    return window_iterator<T,Alloc>(b,window_dim_x,window_dim_y,stride_x,stride_y);
  }
  template <class T,class Alloc>
  window_iterator<T,Alloc> window_vector<T,Alloc>::end()
  {
    int windowsX = int((b->dim_x-window_dim_x)/stride_x) +1;
    int windowsY = int((b->dim_y-window_dim_y)/stride_y)+1;
    return window_iterator<T,Alloc>(b,window_dim_x,window_dim_y,stride_x,stride_y,windowsX*windowsY);
  }

  #define cudaCheckError() {                                          \
   cudaError_t e=cudaGetLastError();                                 \
   if(e!=cudaSuccess) {                                              \
     printf("Cuda failure %s:%d: '%s'\n",__FILE__,__LINE__,cudaGetErrorString(e));           \
     exit(0); \
   }                                                                 \
  }
}
