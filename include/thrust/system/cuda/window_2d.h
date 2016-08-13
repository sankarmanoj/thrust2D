#pragma once

#include <thrust/block_2d.h>
namespace thrust
{
  template <class T>
  class window_2D
  {
  public:
    int start_x,start_y;
    int block_dim_x, block_dim_y;
    int window_dim_x, window_dim_y;
    thrust::Block_2D<T> *b;
    __host__ __device__ window_2D ();
    __host__ __device__ window_2D (Block_2D<T> *b, int start_x, int start_y, int window_dim_x, int window_dim_y);
    __host__ __device__ window_2D (const window_2D &obj);
    __host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > operator[] (int index);
  };

  template <class T>
  class window_iterator : public thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > >
  {
    int current_x;
    int current_y;
  public:
    // thrust::detail::normal_iterator<thrust::device_ptr<window_2D<T> > > device_it;
    thrust::Block_2D<T> *b;
    int window_dim_x;
    int window_dim_y;
    int stride_x;
    int stride_y;
    __host__ __device__
    window_iterator(thrust::Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
    {

        this->b = b;
        this->b->initalize_device_memory();
        // TODO: Better boundary and odd check
        // assert(window_dim_x%2);
        // assert(window_dim_y%2);
        this->window_dim_x = window_dim_x;
        this->window_dim_y = window_dim_y;
        this->stride_x = stride_x;
        this->stride_y = stride_y;
        this->current_x = 0;
        this->current_y = 0;
    }

    __host__ __device__
    thrust::device_reference<window_2D<T> > operator[] (unsigned int index)
    {
      // printf("Reached Here");
      int start_x = stride_x * index;
      int start_y = stride_y * index;
      thrust::window_2D<T> temp = (b, start_x,start_y,this->window_dim_x, this->window_dim_y);
      current_x = start_x;
      current_y = start_y;
      return (thrust::device_reference<window_2D<T> >) temp;
    }
    __host__ __device__
    const thrust::device_reference<window_2D<T> > operator[] (unsigned int index) const
    {
      // printf("Reached Here");
      int start_x = stride_x * index;
      int start_y = stride_y * index;
      thrust::window_2D<T> temp = (b, start_x,start_y,this->window_dim_x, this->window_dim_y);
      current_x = start_x;
      current_y = start_y;
      return (thrust::device_reference<window_2D<T> >) temp;
      // return (thrust::device_reference<window_2D<T> >) device_it[index];
    }

    __host__ __device__
    int operator- (const window_iterator& it)
    {
      int diff_x = this->current_x - it.current_x + 1;
      int diff_y = this->current_y - it.current_y + 1;
      return (diff_x/stride_x) * (diff_y/stride_y);
      // return (int)(this->device_it-it.device_it);
    }

    __host__ __device__
    thrust::window_iterator<T> operator+ (long N)
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

    __host__ __device__
    thrust::window_iterator<T> operator- (long N)
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

    __host__ __device__
    window_iterator<T> (const window_iterator<T>& other)
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

    __host__ __device__
    window_iterator<T>& operator= (window_iterator<T> it)
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

    // __host__ __device__
    // thrust::device_reference<window_2D<T> > operator* ()
    // {
    //
    //   // return *(this->device_it);
    // }
    //
    // __host__ __device__
    // const thrust::device_reference<window_2D<T> > operator* () const
    // {
    //
    //   // return *(this->device_it);
    // }

    // __host__ __device__ __forceinline__
    // thrust::window_iterator<T> operator+= (int N)
    // {
    //
    //   this->device_it += N;
    //   return *this;
    //
    // }

    // __host__ __device__ __forceinline__
    // const thrust::window_iterator<T> operator+= (int N) const
    // {
    //
    //   this->device_it += N;
    //   return *this;
    //
    // }
    //
    // __host__ __device__
    // bool operator< (const window_iterator<T>& it)
    // {
    //   return this->device_it < it.device_it;
    // }

  };
  // template <class T>
  // class window_transform_functor
  // {
  // public:
  // 	__device__ virtual void operator() (window_2D<T> w_in1, window_2D<T> w_in2, window_2D<T> w_out) = 0;
  // };
  //
  // template <class T>
  // thrust::device_vector<window_2D<T> >get_windows(Block_2D<T> * parentBlock, int window_dim_x, int window_dim_y);
  //
  // template <class T>
  // thrust::device_vector<window_2D<T> >get_windows(Block_2D<T> * parentBlock, int window_dim_x, int window_dim_y, int stride_x, int stride_y);
  //
  // template <class T>
  // class window_for_each_functor
  // {
  // public:
  //   __device__ virtual void operator() (window_2D<T> w) = 0;
  // };
}
#include <thrust/system/cuda/window_2d.inl>
