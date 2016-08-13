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
		assert(start_x + window_dim_x <= b->dim_x);
		this->start_y = start_y;
    this->window_dim_y = window_dim_y;
		assert(start_y + window_dim_y <= b->dim_y);
		this->b = b->device_pointer;
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
      this->b = obj.b->device_pointer;
      this->block_dim_y = obj.block_dim_y;
      this->block_dim_x = obj.block_dim_x;
    }

  template <class T>
  __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > window_2D<T>::operator[] (int index)
  {
    // TODO: Check Indexing of Window of a SubBlock.
    return (*b)[start_y + index] + start_x;
  }

  template <class T>
  __host__ window_iterator<T>::window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {

      this->b = b;
      this->b->initalize_device_memory();
      // TODO: Better boundary and odd check
      this->window_dim_x = window_dim_x;
      this->window_dim_y = window_dim_y;
      this->stride_x = stride_x;
      this->stride_y = stride_y;
      this->current_x = 0;
      this->current_y = 0;
  }

  template <class T>
  __host__ __device__ thrust::device_reference<window_2D<T> > window_iterator<T>::operator[] (unsigned int index)
  {
    // printf("Reached Here");
    int start_x = stride_x * index;
    int start_y = stride_y * index;
    window_2D<T> temp = (b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    current_x = start_x;
    current_y = start_y;
    return (thrust::device_reference<window_2D<T> >) temp;
  }

  template <class T>
  __host__ __device__ const thrust::device_reference<window_2D<T> > window_iterator<T>::operator[] (unsigned int index) const
  {
    // printf("Reached Here");
    int start_x = stride_x * index;
    int start_y = stride_y * index;
    window_2D<T> temp = (b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    current_x = start_x;
    current_y = start_y;
    return (thrust::device_reference<window_2D<T> >) temp;
  }

  template <class T>
  __host__ __device__ int window_iterator<T>::operator- (const window_iterator& it)
  {
    int diff_x = this->current_x - it.current_x + 1;
    int diff_y = this->current_y - it.current_y + 1;
    return (diff_x/stride_x) * (diff_y/stride_y);
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator+ (long N)
  {
    if (b->dim_x - window_dim_x >= current_x + stride_x && b->dim_y - window_dim_y >= current_y +stride_y)
    {
      int i = 0;
      while (i<= N)
      {
        current_y += stride_y;
        i++;
        if (current_y >= b->dim_y - window_dim_y)
        {
          current_x += stride_x;
          i++;
        }
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
    this->b = other.b;
    this->window_dim_x = other.window_dim_x;
    this->window_dim_y = other.window_dim_y;
    this->stride_x = other.stride_x;
    this->stride_y = other.stride_y;
    this->current_x = other.current_x;
    this->current_y = other.current_y;
    // this->device_it = other.device_it;
  }

  template <class T>
  __host__ __device__ window_iterator<T>& window_iterator<T>::operator= (window_iterator<T> it)
  {
    this->b = it.b;
    this->window_dim_x = it.window_dim_x;
    this->window_dim_y = it.window_dim_y;
    this->stride_x = it.stride_x;
    this->stride_y = it.stride_y;
    this->current_x = it.current_x;
    this->current_y = it.current_y;
    // this->device_it = it.device_it;
    return this;
  }

  // template <class T>
  // __host__ __device__ thrust::device_reference<window_2D<T> > window_iterator::operator* ()
  // {
  //
  //   // return *(this->device_it);
  // }
  //
  // template <class T>
  // __host__ __device__ const thrust::device_reference<window_2D<T> > window_iterator::operator* () const
  // {
  //
  //   // return *(this->device_it);
  // }

  // template <class T>
  // __host__ __device__ __forceinline__ window_iterator<T> window_iterator::operator+= (int N)
  // {
  //
  //   this->device_it += N;
  //   return *this;
  //
  // }
  // template <class T>
  // __host__ __device__ __forceinline__ const window_iterator<T> window_iterator::operator+= (int N) const
  // {
  //
  //   this->device_it += N;
  //   return *this;
  //
  // }

  // template <class T>
  // __host__ __device__ bool window_iterator::operator< (const window_iterator<T>& it)
  // {
  //   return this-template>device_it < it.device_it;
  // }
  template <class T>
  window_vector<T>::window_vector (Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {
    this->b = b;
    this->window_dim_x = window_dim_x;
    this->window_dim_y = window_dim_y;
    this->stride_x = stride_x;
    this->stride_y = stride_y;
  }
  template <class T>
  thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > > window_vector<T>::begin()
  {
    return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y);
  }
  template <class T>
  thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > > window_vector<T>::end()
  {
    int xSpacing = (window_dim_x-1)/2;
      int ySpacing = (window_dim_y-1)/2;
      int windowsX = (b->dim_x)-(stride_x + 1)*xSpacing;
      int windowsY = (b->dim_y)-(stride_y + 1)*ySpacing;
      return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y) + windowsX * windowsY;;
  }
}
