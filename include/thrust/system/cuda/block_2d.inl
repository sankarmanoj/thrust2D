#pragma once
#include <thrust/system/cuda/block_2d.h>
namespace thrust
{
  template <class T>
  block_2d<T>::block_2d (int dim_x, int dim_y) : device_vector<T>(dim_x*dim_y)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    this->offset_x = 0;
    this->offset_y = 0;
  	// device_data = device_vector<T>(dim_x * dim_y);
  	device_iterator = this->data();
    block_2d<T> * temp;
    cudaMalloc((void **)&temp,sizeof(block_2d));
    cudaMemcpy(temp,this,sizeof(block_2d),cudaMemcpyHostToDevice);
    this->device_pointer = temp;
  }

  template <class T>
  block_2d<T>::block_2d (int dim_x, int dim_y, T value) : device_vector<T>(dim_x*dim_y,value)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    this->offset_x = 0;
    this->offset_y = 0;
    // device_data = device_vector<T>(dim_x * dim_y);
    device_iterator = this->data();
    block_2d<T> * temp;
    cudaMalloc((void **)&temp,sizeof(block_2d));
    cudaMemcpy(temp,this,sizeof(block_2d),cudaMemcpyHostToDevice);
    this->device_pointer = temp;
  }

  template <class T>
  block_2d<T>::block_2d (block_2d<T> &other) : device_vector<T>(other)
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
  block_2d<T>* block_2d<T>::sub_block (int ul_x, int ul_y, int br_x, int br_y)
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
  __host__ __device__ detail::normal_iterator<device_ptr<T> > block_2d<T>::operator[] (int index)
  {
    return this->device_iterator + ((index * (this->dim_x + this->offset_x)) + offset_y);
  }

  template<class T>
	__host__ __device__ T block_2d<T>::operator[] (int2 index)
  {
    if(index.y<0||index.x<0||index.y>=dim_y||index.x>=dim_x)
    {
      return 0;
    }
    return this->device_iterator[index.y * (this->dim_x + this->offset_x) + offset_y + index.x];
  }

  template <class T>
  __host__ __device__ __forceinline__ int2 block_2d<T>::index_to_int2(int position)
  {
    int i = position/dim_x;
    int j = position%dim_x;
    return make_int2(j,i);
  }

  template <class T>
  __host__ block_iterator<T> block_2d<T>::begin()
  {
    return block_iterator<T>(this,0);
  }
  template <class T>
  __host__  block_iterator<T> block_2d<T>::end()
  {
    return block_iterator<T>(this,(this->dim_y)*(this->dim_x));
  }

  template<class T>
	__host__ __device__ block_iterator<T>::block_iterator (block_2d<T> *pB, int position)
  {
    parent_block = pB->device_pointer;
    parent_block_host = pB;
    this->position = position;
    this->dim_y = pB->dim_y;
    this->dim_x = pB->dim_x;
  }

  template<class T>
__host__ __device__ block_iterator<T>::block_iterator(const block_iterator<T> &it)
  {
    this->parent_block = it.parent_block;
    this->parent_block_host = it.parent_block_host;
    this->position = it.position;
    this->dim_x = it.dim_x;
    this->dim_y = it.dim_y;
  }

  template<class T>
  __host__ __device__ block_iterator<T>::reference	block_iterator<T>::operator* () const
  {
    int2 temp = parent_block->index_to_int2(position);
    return (*parent_block)[temp.y][temp.x];
  }
  template<class T>
  __host__ __device__ block_iterator<T>::reference	block_iterator<T>::operator[] (long index)
  {
    int2 temp = parent_block->index_to_int2(index);
    return (*parent_block)[temp.y][temp.x];
  }
  template<class T>
  __host__ __device__ block_iterator<T> block_iterator<T>::operator+ (long value)
  {
    block_iterator<T> temp = *this;
    temp.position+=value;
    return temp;
  }
  template<class T>
  __host__ __device__ block_iterator<T>& block_iterator<T>::operator+= (long value)
  {
    this->position+=value;
    return *this;
  }
  template<class T>
  __host__ __device__ block_iterator<T>& block_iterator<T>::operator++ ()
  {
    this->position++;
    return *this;
  }
  template<class T>
  __host__ __device__ block_iterator<T>::difference_type block_iterator<T>::operator- (const block_iterator& it)
  {
    return position - it.position;
  }

  template<class T>
  __host__ __device__ block_iterator<T>::difference_type block_iterator<T>::operator- (const block_iterator& it) const
  {
    return position - it.position;
  }
  template<class T>
  __host__ __device__ block_iterator<T> block_iterator<T>::operator- (const long N)
  {
    block_iterator<T> temp = *this;
    temp.position-=N;
    return temp;
  }
  template<class T>
  __host__ __device__ block_iterator<T> block_iterator<T>::operator- (const long N) const
  {
    block_iterator<T> temp = *this;
    temp.position-=N;
    return temp;
  }
  template<class T>
  __host__ __device__ block_iterator<T> block_iterator<T>::operator-- ()
  {
    block_iterator<T> temp = *this;
    temp.position-=1;
    return temp;
  }

  template<class T>
  __host__ __device__ bool block_iterator<T>::operator!= (const block_iterator<T>& it) const
  {
    return !((*this)==it);
  }
  template<class T>
  __host__ __device__ bool block_iterator<T>::operator== (const block_iterator<T>& it) const
  {
    return (this->position==it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T>
  __host__ __device__ bool block_iterator<T>::operator<= (const block_iterator<T>& it) const
  {
    return (this->position<=it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T>
  __host__ __device__ bool block_iterator<T>::operator>= (const block_iterator<T>& it) const
  {
    return (this->position>=it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T>
  __host__ __device__ bool block_iterator<T>::operator> (const block_iterator<T>& it) const
  {
    return (this->position>it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T>
  __host__ __device__ bool block_iterator<T>::operator< (const block_iterator<T>& it) const
  {
    return (this->position<it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
}
