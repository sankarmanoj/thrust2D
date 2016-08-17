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
  __host__ window_iterator<T>::window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {

      this->b = b->device_pointer;
      this->block_dim_x = b->dim_x;
      this->block_dim_y = b->dim_y;
      // printf("Reached Here");
      this->window_dim_x = window_dim_x;
      this->window_dim_y = window_dim_y;
      this->stride_x = stride_x;
      this->stride_y = stride_y;
      this->position =0;
      this->windows_along_x= int((this->block_dim_x-window_dim_x)/stride_x) +1;
      this->windows_along_y = int((this->block_dim_y-window_dim_y)/stride_y)+1;

  }

  template <class T>
  __host__ window_iterator<T>::window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int position)
  {

      this->b = b->device_pointer;
      this->block_dim_x = b->dim_x;
      this->block_dim_y = b->dim_y;
      // printf("Reached Here");
      this->window_dim_x = window_dim_x;
      this->window_dim_y = window_dim_y;
      this->stride_x = stride_x;
      this->stride_y = stride_y;
      this->position =position;
      this->windows_along_x= int((this->block_dim_x-window_dim_x)/stride_x) +1;
      this->windows_along_y = int((this->block_dim_y-window_dim_y)/stride_y)+1;

  }
  template <class T>
  __host__ __device__ window_2D<T> window_iterator<T>::operator[] (unsigned int index)
  {
    // printf("Reached Here 1");
    int j = index/windows_along_x;
    int i = index%windows_along_x;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
    // int x = index * stride_x / block_dim_y;
    // int y = index * stride_y % block_dim_y;
    // int start_x = stride_x * x;
    // int start_y = stride_y * y;
    window_2D<T> temp = (b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    current_x = start_x;
    current_y = start_y;
    return temp;
  }

  template <class T>
  __host__ __device__ const window_2D<T> window_iterator<T>::operator[] (unsigned int index) const
  {
    // printf("Reached Here 2");
    int j = index/windows_along_x;
    int i = index%windows_along_x;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
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
    return this->position - it.position;
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator+ (long N)
  {
    this->position = this->position+N;
    if(this->position>(this->windows_along_x*this->windows_along_y-1))
    this->position=(this->windows_along_x*this->windows_along_y-1);
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator++ ()
  {
    this->position++;
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator- (long N)
  {
    this->position = this->position - N;
    if(this->position<0)
    this->position = 0;
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
    this->block_dim_x = other.block_dim_x;
    this->block_dim_y = other.block_dim_y;
    this->position = other.position;
    this->windows_along_x = other.windows_along_x;
    this->windows_along_y = other.windows_along_y;
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
    this->block_dim_x = it.block_dim_x;
    this->block_dim_y = it.block_dim_y;
    this->position = it.position;
    this->windows_along_x = it.windows_along_x;
    this->windows_along_y = it.windows_along_y;
    // this->device_it = it.device_it;
    return this;
  }

  template <class T>
  __host__ __device__ __forceinline__ window_iterator<T> window_iterator<T>::operator+= (long N)
  {
    this->position+=N;
    // printf("Reached Here += %d %d \n",current_x,current_y);
    return *this;
  }

  template <class T>
  __host__ __device__ __forceinline__ const window_iterator<T> window_iterator<T>::operator+= (long N) const
  {
    this->position+=N;
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
    return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y);
  }
  template <class T>
  window_iterator<T> window_vector<T>::end()
  {

    int windowsX = int((b->dim_x-window_dim_x)/stride_x) +1;
    int windowsY = int((b->dim_y-window_dim_y)/stride_y)+1;
    return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y) + (windowsX*windowsY-1);
  }
}
