#pragma once
#include<thrust/system/cuda/window_2d.h>
#include <stdlib.h>
#include <stdio.h>
namespace thrust
{
  template <class T>
  __host__ __device__ window_2D<T>::window_2D()
  {

  }

  template <class T>
  __host__ __device__ window_2D<T>::window_2D(Block_2D<T> *b,int start_x, int start_y, int window_dim_x, int window_dim_y)
  {
    // TODO: Better Boundary checks.
    this->start_x = start_x;
    this->window_dim_x = window_dim_x;
    //printf("start x = %d , window_dim_x = %d , parent_dim = %d\n", start_x,window_dim_x,b->dim_x);
    // NOTE: Strictly less or less than equal to? Should a window comprising of entire block be allowed?
		// assert(start_x + window_dim_x <= b->dim_x);
		this->start_y = start_y;
    this->window_dim_y = window_dim_y;
		// assert(start_y + window_dim_y <= b->dim_y);
		this->b = b;
    this->block_dim_x = b->dim_x;
    this->block_dim_y = b->dim_y;
  }
  template <class T>
  __host__ __device__ window_2D<T>::window_2D (const window_2D<T> &obj)
  {
    this->start_x = obj.start_x;
    this->start_y = obj.start_y;
    this->window_dim_x = obj.window_dim_x;
    this->window_dim_y = obj.window_dim_y;
    this->b = obj.b;
    this->block_dim_y = obj.block_dim_y;
    this->block_dim_x = obj.block_dim_x;
  }

  template <class T>
  __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > window_2D<T>::operator[] (int index)
  {
    // TODO: Check Indexing of Window of a SubBlock.
    // printf("%d\n",b->dim_x);
    return (*b)[start_y + index] + start_x;
  }

  template <class T>
  __host__ window_iterator<T>::window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int current_x,int current_y)
  {
      // TODO: Better boundary and odd check
      this->b = b->device_pointer;
      this->block_dim_x = b->dim_x;
      this->block_dim_y = b->dim_y;
      // printf("Reached Here");
      this->window_dim_x = window_dim_x;
      this->window_dim_y = window_dim_y;
      this->stride_x = stride_x;
      this->stride_y = stride_y;
      this->current_x = current_x;
      this->current_y = current_y;
  }

  template <class T>
  __host__ __device__ window_2D<T> window_iterator<T>::operator[] (unsigned int index)
  {
    // printf("Reached Here 1");
    int x = index * stride_x / block_dim_y;
    int y = index * stride_y % block_dim_y;
    int start_x = stride_x * x;
    int start_y = stride_y * y;
    window_2D<T> temp = (b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    current_x = start_x;
    current_y = start_y;
    return temp;
  }

  template <class T>
  __host__ __device__ const window_2D<T> window_iterator<T>::operator[] (unsigned int index) const
  {
    // printf("Reached Here 2");
    int x = index * stride_x / block_dim_y;
    int y = index * stride_y % block_dim_y;
    int start_x = stride_x * x;
    int start_y = stride_y * y;
    window_2D<T> temp = (b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    current_x = start_x;
    current_y = start_y;
    return temp;
  }

  template <class T>
  __host__ __device__ window_2D<T> window_iterator<T>::operator* ()
  {
    // printf("Reached Here 3");
    int start_x = stride_x * current_x;
    int start_y = stride_y * current_y;
    window_2D<T> temp(b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    return temp;
  }

  template <class T>
  __host__ __device__ const window_2D<T> window_iterator<T>::operator* () const
  {
    // printf("Reached Here 4");
    int start_x = stride_x * current_x;
    int start_y = stride_y * current_y;
    window_2D<T> temp(b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    return temp;
  }

  template <class T>
  __host__ __device__ int window_iterator<T>::operator- (const window_iterator& it)
  {
    int diff_x = this->current_x - it.current_x + 1;
    int diff_y = this->current_y - it.current_y + 1;
    // printf("%d %d %d %d\n",this->current_x,this->current_y,it.current_x,it.current_y);
    return (diff_x/stride_x) * (diff_y/stride_y);
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator+ (long N)
  {
    // printf("Reached operator+");
    // printf("Reached Here + %p \t %p\n", this->b, this->b->device_pointer);
    // printf("%d %d %ld\n",current_x,current_y,N);
    int i = 0;
    while (i<= N)
    {
      if (block_dim_x - window_dim_x >= current_x + stride_x && block_dim_y - window_dim_y >= current_y + stride_y)
      {
        current_y += stride_y;
        i++;
        if (current_y >= block_dim_y - window_dim_y - 1)
        {
          current_x += stride_x;
          i++;
        }
      }
      else
        break;
    }
    // printf("%d %d %ld\n",current_x,current_y,N);
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator++ ()
  {
    if (block_dim_x - window_dim_x >= current_x + stride_x && block_dim_y - window_dim_y >= current_y +stride_y)
    {
      if (current_y >= block_dim_y - window_dim_y - 1)
      {
        current_x += stride_x;
      }
      else
      {
        current_y += stride_y;
      }
    }
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator- (long N)
  {
    if (current_x - stride_x >= 0 && current_y - stride_y >= 0)
    {
      int i = 0;
      while (i<= N)
      {
        current_y -= stride_y;
        i++;
        if (current_y <= 0)
        {
          current_x -= stride_x;
          i++;
        }
      }
    }
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T>::window_iterator<T> (const window_iterator<T>& other)
  {
    // printf("Reached Here copy\n");
    this->b = other.b;
    this->window_dim_x = other.window_dim_x;
    this->window_dim_y = other.window_dim_y;
    this->stride_x = other.stride_x;
    this->stride_y = other.stride_y;
    this->current_x = other.current_x;
    this->current_y = other.current_y;
    this->block_dim_x = other.block_dim_x;
    this->block_dim_y = other.block_dim_y;
    // this->device_it = other.device_it;
  }

  template <class T>
  __host__ __device__ window_iterator<T>& window_iterator<T>::operator= (window_iterator<T> it)
  {
    // printf("Reached Here 2\n");
    this->b = it.b;
    this->window_dim_x = it.window_dim_x;
    this->window_dim_y = it.window_dim_y;
    this->stride_x = it.stride_x;
    this->stride_y = it.stride_y;
    this->current_x = it.current_x;
    this->current_y = it.current_y;
    this->block_dim_x = it.block_dim_x;
    this->block_dim_y = it.block_dim_y;
    // this->device_it = it.device_it;
    return this;
  }

  template <class T>
  __host__ __device__ __forceinline__ window_iterator<T> window_iterator<T>::operator+= (long N)
  {
    if (block_dim_x - window_dim_x >= current_x + stride_x && block_dim_y - window_dim_y >= current_y +stride_y)
    {
      long i = 0;
      while (i<= N)
      {
        current_y += stride_y;
        i++;
        if (current_y >= block_dim_y - window_dim_y - 1)
        {
          current_x += stride_x;
          i++;
        }
      }
    }
    // printf("Reached Here += %d %d \n",current_x,current_y);
    return *this;
  }

  template <class T>
  __host__ __device__ __forceinline__ const window_iterator<T> window_iterator<T>::operator+= (long N) const
  {
    // printf("Reached Here += const\n");
    if (block_dim_x - window_dim_x >= current_x + stride_x && block_dim_y - window_dim_y >= current_y +stride_y)
    {
      long i = 0;
      while (i<= N)
      {
        current_y += stride_y;
        i++;
        if (current_y >= block_dim_y - window_dim_y)
        {
          current_x += stride_x;
          i++;
        }
      }
    }
    return *this;
  }

  // template <class T>
  // __host__ __device__ bool window_iterator<T>::operator< (const window_iterator<T>& it)
  // {
  //   return this-template>device_it < it.device_it;
  // }
  template <class T>
  window_vector<T>::window_vector (Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {
    this->b = b;
    this->b->initalize_device_memory();
    this->window_dim_x = window_dim_x;
    this->window_dim_y = window_dim_y;
    this->stride_x = stride_x;
    this->stride_y = stride_y;
  }
  template <class T>
  window_iterator<T> window_vector<T>::begin()
  {
    return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y,0,0);
  }
  template <class T>
  window_iterator<T> window_vector<T>::end()
  {
    int xSpacing = (window_dim_x-1)/2;
    int ySpacing = (window_dim_y-1)/2;
    int windowsX = (b->dim_x)-(stride_x + 1)*xSpacing;
    int windowsY = (b->dim_y)-(stride_y + 1)*ySpacing;
    return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y,0,0) + windowsX*windowsY;
  }
}
