#pragma once
#include <thrust/system/cuda/block_2d.h>
namespace thrust
{
  template <class T>
  Block_2D<T>::Block_2D (int dim_x, int dim_y) : device_vector<T>(dim_x*dim_y)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    this->offset_x = 0;
    this->offset_y = 0;
		// device_data = device_vector<T>(dim_x * dim_y);
		device_iterator = this->data();
    Block_2D<T> * temp;
    cudaMalloc((void **)&temp,sizeof(Block_2D));
    cudaMemcpy(temp,this,sizeof(Block_2D),cudaMemcpyHostToDevice);
    this->device_pointer = temp;
  }
  template <class T>
  Block_2D<T>::Block_2D (Block_2D<T> &other) : device_vector<T>(other)
  {
    this->dim_x = other.dim_x;
    this->dim_y = other.dim_y;
    this->offset_x = other.offset_x;
    this->offset_y = other.offset_y;
		// device_data = device_vector<T>(other.device_data.begin(), other.device_data.end());
		device_iterator = this->data();
    this->device_pointer = other.device_pointer;
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
  __host__ __device__ detail::normal_iterator<device_ptr<T> > Block_2D<T>::operator[] (int index)
  {
    return this->device_iterator + ((index * (this->dim_x + this->offset_x)) + offset_y);
  }
  template <class T>
  __host__ __device__ int2 Block_2D<T>::convert2D(int position)
  {
    int i = position/dim_x;
    int j = position%dim_x;
    return make_int2(i,j);
  }
  // template <class T>
  // detail::normal_iterator<device_ptr<T> > Block_2D<T>::begin()
  // {
  //   // block_iterator<T> it;
  //   // return it;
  //   return this->device_pointer->device_iterator;
  // }
  //
  // template <class T>
  // detail::normal_iterator<device_ptr<T> > Block_2D<T>::end()
  // {
  //   // block_iterator<T> it;
  //   // // TODO: Need two more cases here where only one of the offsets is 0
  //   // if (this->offset_x == 0 && this->offset_y == 0)
  //   //   it = it + (this->dim_x * this->dim_y);
  //   // else
  //   //   it = it + ((this->dim_x + this->offset_x - 1)*(this->dim_y + this->offset_y - 1));
  //   // return it;
  //   return this->device_pointer->device_iterator + dim_x*dim_y;
  // }
  //
  // template <class T>
  // block_iterator<T>::block_iterator () : detail::normal_iterator<device_ptr<T> >()
  // {
  //   // this->dim_x = b->dim_x;
  //   // this->dim_y = b->dim_y;
  //   // this->start_x = start_x;
  //   // this->start_y = start_y;
  //   // TODO: stride_x and stride_y should be passed as parameter. Overload.
  //   this->stride_x = 1;
  //   this->stride_y = 1;
  //
  //   this->current_x = 0;
  //   this->current_y = 0;
  //   // TODO: Should following be this instead. b->device_iterator +start_x*dim_y +start_y;
  //   // this->device_iterator = b->device_iterator;
  //   // this->b = b->device_pointer;
  // }
  // template <class T>
  // __host__ __device__ detail::normal_iterator<device_ptr<T> > block_iterator<T>::operator[] (unsigned int index)
  // {
  //   return this->device_iterator + ((index * (this->dim_y + this->start_y)) + start_x);
  // }
  //
  // template <class T>
  // __host__ __device__ const detail::normal_iterator<device_ptr<T> > block_iterator<T>::operator[] (unsigned int index) const
  // {
  //   return this->device_iterator + ((index * (this->dim_y + this->start_y)) + start_x);
  // }

  // template <class T>
  // __host__ __device__ detail::normal_iterator<device_ptr<T> > block_iterator<T>::operator* ()
  // {
  //   // return this->device_iterator + ((index * (this->dim_y + this->start_y)) + start_x);
  // }
  //
  // template <class T>
  // __host__ __device__ const detail::normal_iterator<device_ptr<T> > block_iterator<T>::operator* () const
  // {
  //   // return this->device_iterator + ((index * (this->dim_y + this->start_y)) + start_x);
  // }
  //
  // template <class T>
  // __host__ __device__ int block_iterator<T>::operator- (const block_iterator& it)
  // {
  //
  // }

  // template <class T>
  // __host__ __device__ block_iterator<T> block_iterator<T>::operator+ (long value)
  // {
  //   int temp = this->current_x*(this->dim_y + this->start_y) + this->current_y;
  //   // assert((this->dim_x + this->start_x)*(this->dim_y + this->start_y) - temp > value);
  //   temp = temp + value;
  //   this->current_x = temp / (this->dim_y + this->start_y);
  //   this->current_y = temp % (this->dim_y + this->start_y);
  //   this->device_iterator += value;
  //   return *this;
  // }
  //
  // template <class T>
  // __host__ __device__ block_iterator<T> block_iterator<T>::operator++ ()
  // {
  //   int temp = this->current_x*(this->dim_y + this->start_y) + this->current_y;
  //   // assert((this->dim_x + this->start_x)*(this->dim_y + this->start_y) - temp > value);
  //   temp = temp + 1;
  //   this->current_x = temp / (this->dim_y + this->start_y);
  //   this->current_y = temp % (this->dim_y + this->start_y);
  //   this->device_iterator += 1;
  //   return *this;
  // }

  // template <class T>
  // __host__ __device__ block_iterator<T> block_iterator<T>::operator- (long N)
  // {
  //   return
  // }
  //
  // template <class T>
  // __host__ __device__ block_iterator<T>::block_iterator<T>(const block_iterator<T>& other)
  // {
  //
  // }
  //
  // template <class T>
  // __host__ __device__ block_iterator<T>& block_iterator<T>::operator= (block_iterator<T> it)
  // {
  //
  // }
  //
  // template <class T>
  // __host__ __device__ __forceinline__ block_iterator<T> block_iterator<T>::operator+= (long N)
  // {
  //
  // }
  // template <class T>
  // __host__ __device__ __forceinline__ const block_iterator<T> block_iterator<T>::operator+= (long N) const
  // {
  //
  // }

  // template <class T>
  // void block_iterator<T>::move_forward ()
  // {
  //   int temp = this->current_x*(this->dim_y + this->start_y) + this->current_y,ntemp;
  //   if (this->dim_y - this->current_y > this->stride_y)
  //     ntemp = temp + this->stride_y;
  //   else
  //     ntemp = temp - this->dim_y + this->stride_y;
  //     this->current_x = ntemp / (this->dim_y + this->start_y);
  //     this->current_y = ntemp % (this->dim_y + this->start_y);
  //   this->device_iterator += (ntemp - temp);
  // }
  //
  // template <class T>
  // void block_iterator<T>::move_backward ()
  // {
  //   int temp = this->current_x*(this->dim_y + this->start_y) + this->current_y,ntemp;
  //   if(this->current_y - this->stride_y >= 0)
  //     ntemp = temp - this->stride_y;
  //   else
  //     ntemp = temp + this->dim_y -this->stride_y;
  //     this->current_x = ntemp / (this->dim_y + this->start_y);
  //     this->current_y = ntemp % (this->dim_y + this->start_y);
  //   this->device_iterator += (ntemp - temp);
  // }
  //
  // template <class T>
  // void block_iterator<T>::move_downward ()
  // {
  //   int temp = this->current_x*(this->dim_y + this->start_y) + this->current_y,ntemp;
  //   if (this->dim_x - this->current_x > this->stride_x)
  //     ntemp = temp + this->stride_x * (this->dim_y + this->start_y);
  //   else
  //     ntemp = temp - (this->dim_x - this->stride_x)*(this->dim_y + this->start_y);
  //     this->current_x = ntemp / (this->dim_y + this->start_y);
  //     this->current_y = ntemp % (this->dim_y + this->start_y);
  //   this->device_iterator += (ntemp - temp);
  // }
  //
  // template <class T>
  // void block_iterator<T>::move_upward ()
  // {
  //   int temp = this->current_x*(this->dim_y + this->start_y) + this->current_y,ntemp;
  //   if(this->current_x - this->stride_x >= 0)
  //     ntemp = temp - this->stride_x * (this->dim_y + this->start_y);
  //   else
  //     ntemp = temp + (this->dim_x - this->stride_x)*(this->dim_y + this->start_y);
  //     this->current_x = ntemp / (this->dim_y + this->start_y);
  //     this->current_y = ntemp % (this->dim_y + this->start_y);
  //   this->device_iterator += (ntemp - temp);
  // }
}
