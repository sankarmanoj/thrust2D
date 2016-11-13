#pragma once
#include <thrust/system/cuda/block_2d.h>
namespace thrust
{
  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (int dim_x, int dim_y)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    if (typeid(Alloc) == typeid(device_malloc_allocator<T>))
    {
      cudaMalloc((void **) &data, sizeof(T)*dim_x*dim_y);
      cudaDeviceSynchronize();
      cudaMalloc((void **)&device_pointer,sizeof(block_2d));
      cudaMemcpy(device_pointer,this,sizeof(block_2d),cudaMemcpyHostToDevice);
      cudaDeviceSynchronize();
    }
    else
    {
      data = (T *) std::malloc(sizeof(T)*dim_x*dim_y);
      this->device_pointer=this;
    }
  }

  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (int dim_x, int dim_y, T value)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    if (typeid(Alloc) == typeid(device_malloc_allocator<T>))
    {
      cudaMalloc((void **) &data, sizeof(T)*dim_x*dim_y);
      cudaMemset((void *) data, value, sizeof(T)*dim_x*dim_y);
      cudaDeviceSynchronize();
      cudaMalloc((void **)&device_pointer,sizeof(block_2d));
      cudaMemcpy(device_pointer,this,sizeof(block_2d),cudaMemcpyHostToDevice);
      cudaDeviceSynchronize();
    }
    else
    {
      data = (T *) std::malloc(sizeof(T)*dim_x*dim_y);
      std::memset(data,(T)value,sizeof(T)*dim_x*dim_y);
      this->device_pointer=this;
    }
  }

  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (block_2d<T,Alloc> &other)
  {
    this->dim_x = other.dim_x;
    this->dim_y = other.dim_y;
  	this->data = other.data;
    this->device_pointer = other.device_pointer;
  }

  template <class T,class Alloc>
  __host__ __device__ block_2d_iterator<T,Alloc> block_2d<T,Alloc>::operator[] (int index)
  {
    return block_2d_iterator<T,Alloc>(this,index);
  }

  template <class T,class Alloc>
	__host__ __device__ T& block_2d<T,Alloc>::operator[] (int2 index)
  {
    if(index.y<0||index.x<0||index.y>=dim_y||index.x>=dim_x)
    {
      return data[dim_y*dim_x];
    }
    return data[index.y*(dim_x) + index.x];
  }

  template <class T,class Alloc>
  __host__ __device__ __forceinline__ int2 block_2d<T,Alloc>::index_to_int2(int position)
  {
    int i = position/dim_x;
    int j = position%dim_x;
    return make_int2(j,i);
  }

  template <class T,class Alloc>
  void block_2d<T,Alloc>::assign(T *begin,T *end)
  {
    cudaMemcpy(data,begin,sizeof(T)*(end-begin),cudaMemcpyHostToDevice);
  }

  template <class T,class Alloc>
  __host__ T* block_2d<T,Alloc>::begin()
  {
    return data;
  }
  template <class T,class Alloc>
  __host__  T* block_2d<T,Alloc>::end()
  {
    return data+dim_x*dim_y;
  }

  template <class T,class Alloc>
  __host__ __device__ block_2d_iterator<T,Alloc>::block_2d_iterator(block_2d<T,Alloc> *b, int index)
  {
    this->b = b;
    index_y = index;
  }

  template <class T, class Alloc>
  __host__ __device__ T& block_2d_iterator<T,Alloc>::operator[] (int index)
  {
    return b->data[index_y*(b->dim_x) + index];
  }
}
