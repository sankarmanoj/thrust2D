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
		this->b = b->devicePointer;
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
      this->b = obj.b->devicePointer;
      this->block_dim_y = obj.block_dim_y;
      this->block_dim_x = obj.block_dim_x;
    }

  template <class T>
  __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > window_2D<T>::operator[] (int index)
  {
    // TODO: Check Indexing of Window of a SubBlock.
    return (*b)[start_y + index] + start_x;
  }

  template <class T,class Func>
  __global__ void  window_for_each_kernel(int stride_x, int stride_y, int dimension_x, int dimension_y, Block_2D<T> *my_block, Func functor)
  {
    int x = blockIdx.x*DEFAULT_BLOCK_SIZE + threadIdx.x;
    int y = blockIdx.y*DEFAULT_BLOCK_SIZE + threadIdx.y;
    if((stride_x*x + dimension_x < my_block->dim_x) && (stride_y*y+dimension_y < my_block->dim_y))
    {
      window_2D<T> my_window (my_block, stride_x*x , stride_y*y , dimension_x, dimension_y);
      functor(my_window);
    }
  }

  template<class T, class Func>
  void window_for_each (block_iterator<T> first, block_iterator<T> last, int stride_x, int stride_y, int window_dim_x, int window_dim_y, Func wf)
  {
    if (stride_x>first.dim_x || stride_y>first.dim_y)
    {
      fprintf(stderr,"\n FATAL ERROR :Stride is Larger than Dimension\n");
      exit(-1);
    }
    int x_threads = first.dim_x-stride_x + 1;
    int y_threads = first.dim_y-stride_y +1;
    if(x_threads % DEFAULT_BLOCK_SIZE)
    {
      x_threads=(x_threads/DEFAULT_BLOCK_SIZE)+1;
    }
    else
      x_threads=x_threads/DEFAULT_BLOCK_SIZE-1;

    if(y_threads%DEFAULT_BLOCK_SIZE)
    {
      y_threads=(y_threads/DEFAULT_BLOCK_SIZE)+1;
    }
    else
      y_threads=y_threads/DEFAULT_BLOCK_SIZE-1;
    dim3 grid(x_threads,y_threads);
    dim3 block(DEFAULT_BLOCK_SIZE,DEFAULT_BLOCK_SIZE);
    window_for_each_kernel<<<grid,block>>>(stride_x,stride_y,window_dim_x,window_dim_y,first.b->get_device_pointer(),wf);
  }
  template <class T>
  thrust::device_vector<window_2D<T> >getWindows(Block_2D<T> * parentBlock, int window_dim_x, int window_dim_y)
  {

    assert(window_dim_x%2);
    assert(window_dim_y%2);
    int xSpacing = (window_dim_x-1)/2;
    int ySpacing = (window_dim_y-1)/2;
    int windowsX = (parentBlock->dim_x)-2*xSpacing;
    int windowsY = (parentBlock->dim_y)-2*ySpacing;
    window_2D<T> *windows ;
    cudaHostAlloc(&windows, sizeof(window_2D<T> )*windowsY*windowsX,cudaHostAllocDefault);
    for(int j = 0; j<windowsY;j++)
    {
      for(int i = 0; i<windowsX;i++)
      {
            windows[j*windowsX + i]=*(new window_2D<T>(parentBlock,i,j,window_dim_x,window_dim_y));
      }
    }
    thrust::device_vector<window_2D<T> > windowVector (windows,windows+windowsX*windowsY);
    return windowVector;
  }

  // template<class T, class Func>
  // void window_for_each (block_iterator<T> first, block_iterator<T> last, Func wf)
  // {
  //
  // }
  //
  // template<class T, class Func>
  // void window_transform (block_iterator<T> first, block_iterator<T> last, block_iterator<T> second, block_iterator<T> dest, Func wf)
  // {
  //
  // }
  //
  // template<class T, class Func>
  // void window_transform (block_iterator<T> first, block_iterator<T> last, block_iterator<T> second, block_iterator<T> dest, int stride_x, int stride_y, Func wf)
  // {
  //
  // }
  //
  // template<class T>
  // void convolution_2D (block_iterator<T> first, block_iterator<T> last, block_iterator<T> dest, Block_2D<T> conv_kernel, int dim_x, int dim_y)
  // {
  //
  // }
  //
  // template<class T, class Func>
  // T block_reduce (block_iterator<T> first, block_iterator<T> last, Func f)
  // {
  //
  // }
  //
  // template<class T, class Func>
  // thrust::device_vector<T> row_reduce (block_iterator<T> first, block_iterator<T> last, Func f)
  // {
  //
  // }
  //
  // template<class T, class Func>
  // void block_scan (block_iterator<T> first, block_iterator<T> last, Func f)
  // {
  //
  // }
  // template<class T, class Func>
  // void row_scan (block_iterator<T> first, block_iterator<T> last, Func f)
  // {
  //
  // }
  // template <class T>
  // void transpose (block_iterator<T> first, block_iterator<T> last, block_iterator<T> dest)
  // {
  //
  // }
  // template <class T>
  // Block_2D<T> matrix_multiply (block_iterator<T> first, block_iterator<T> last, block_iterator<T> second, block_iterator<T> dest)
  // {
  //
  // }
}
