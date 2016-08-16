#pragma once
#include <thrust/system/cuda/block_2d.h>
namespace thrust
{
  template <class T>
  Block_2D<T>::Block_2D (int dim_x, int dim_y)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    this->offset_x = 0;
    this->offset_y = 0;
		device_data = thrust::device_vector<T>(dim_x * dim_y);
		device_iterator = device_data.begin();
  }
  template <class T>
  Block_2D<T>::Block_2D (Block_2D<T> &other)
  {
    this->dim_x = other.dim_x;
    this->dim_y = other.dim_y;
    this->offset_x = other.offset_x;
    this->offset_y = other.offset_y;
		device_data = thrust::device_vector<T>(other.device_data.begin(), other.device_data.end());
		device_iterator = device_data.begin();
    this->device_pointer = other.device_pointer;
  }
  template <class T>
  void Block_2D<T>::initalize_device_memory()
  {
    Block_2D<T> * temp;
		cudaMalloc((void **)&temp,sizeof(Block_2D));
		cudaMemcpy(temp,this,sizeof(Block_2D),cudaMemcpyHostToDevice);
		this->device_pointer = temp;
  }
  template <class T>
  Block_2D<T>* Block_2D<T>::sub_block (int ul_x, int ul_y, int br_x, int br_y)
  {
    // TODO: Is this the best and most valid way to create sub_block?
    // NOTE: Alternative method due to problems with data copying. Make copy and create sub block.
    this->offset_x = ul_x;
    this->offset_y = ul_y;
    this->dim_x = br_x - ul_x + 1;
    this->dim_y = br_y - ul_y + 1;
    return this;
  }
  template <class T>
  __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > Block_2D<T>::operator[] (int index)
  {
    return this->device_iterator + ((index * (this->dim_y + this->offset_y)) + offset_x);
  }
  template <class T>
  thrust::detail::normal_iterator<thrust::device_ptr<T> > Block_2D<T>::begin()
  {
    return this->device_data.begin();

  }
  template <class T>
  thrust::detail::normal_iterator<thrust::device_ptr<T> > Block_2D<T>::end()
  {
    return this->device_data.end();

  }

  // template <class T>
  // thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > > Block_2D<T>::begin(int window_dim_x,int window_dim_y)
  // {
  //   // printf("Reached Here");
  //   return window_iterator<T>(this,window_dim_x,window_dim_y,1,1);
  // }
  // template <class T>
  // thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > > Block_2D<T>::end(int window_dim_x,int window_dim_y)
  // {
  //   // printf("Reached Here");
  //   int xSpacing = (window_dim_x-1)/2;
  //   int ySpacing = (window_dim_y-1)/2;
  //   int windowsX = (dim_x)-(2)*xSpacing;
  //   int windowsY = (dim_y)-(2)*ySpacing;
  //   return window_iterator<T>(this,window_dim_x,window_dim_y,1,1) + windowsX * windowsY;
  //
  // }
  //
  // template <class T>
  // thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > > Block_2D<T>::begin(int window_dim_x,int window_dim_y, int stride_x, int stride_y)
  // {
  //   return window_iterator<T>(this,window_dim_x,window_dim_y,stride_x,stride_y);
  //
  // }
  // template <class T>
  // thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > > Block_2D<T>::end(int window_dim_x,int window_dim_y, int stride_x, int stride_y)
  // {
  //   int xSpacing = (window_dim_x-1)/2;
  //   int ySpacing = (window_dim_y-1)/2;
  //   int windowsX = (dim_x)-(stride_x + 1)*xSpacing;
  //   int windowsY = (dim_y)-(stride_y + 1)*ySpacing;
  //   return window_iterator<T>(this,window_dim_x,window_dim_y,stride_x,stride_y) + windowsX * windowsY;;
  //
  // }
}
