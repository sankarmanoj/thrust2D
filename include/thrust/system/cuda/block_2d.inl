#pragma once
#include <thrust/system/cuda/block_2d.h>
namespace thrust
{
  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (int dim_x, int dim_y) : detail::vector_base<T,Alloc>(dim_x*dim_y+1)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    this->offset_x = 0;
    this->offset_y = 0;
  	device_iterator = this->data();
    data_pointer = this->data().get();
    if (typeid(Alloc) == typeid(device_malloc_allocator<T>))
    {
      block_2d<T,Alloc> * temp;
      cudaMalloc((void **)&temp,sizeof(block_2d));
      cudaMemcpy(temp,this,sizeof(block_2d),cudaMemcpyHostToDevice);
      this->device_pointer = temp;
    }
    else
      this->device_pointer = this;
  }

  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (int dim_x, int dim_y, T value) : detail::vector_base<T,Alloc>(dim_x*dim_y+1,value)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    this->offset_x = 0;
    this->offset_y = 0;
    device_iterator = this->data();
    data_pointer = this->data().get();
    if (typeid(Alloc) == typeid(device_malloc_allocator<T>))
    {
      block_2d<T,Alloc> * temp;
      cudaMalloc((void **)&temp,sizeof(block_2d));
      cudaMemcpy(temp,this,sizeof(block_2d),cudaMemcpyHostToDevice);
      this->device_pointer = temp;
    }
    else
      this->device_pointer = this;
  }

  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (block_2d<T> &other) : detail::vector_base<T,Alloc>(other)
  {
    this->dim_x = other.dim_x;
    this->dim_y = other.dim_y;
    this->offset_x = other.offset_x;
    this->offset_y = other.offset_y;
  	// device_data = device_vector<T>(other.device_data.begin(), other.device_data.end());
  	device_iterator = this->data();
    this->data_pointer = other.data_pointer;
    this->device_pointer = other.device_pointer;
  }

  template <class T,class Alloc>
  __host__ __device__ block_2d<T,Alloc>::iterator_base block_2d<T,Alloc>::operator[] (int index) const
  {
    return this->device_iterator + ((index * (this->dim_x + this->offset_x)) + offset_y);
  }

  template <class T,class Alloc>
	__host__ __device__ block_2d<T,Alloc>::reference block_2d<T,Alloc>::operator[] (int2 index) const
  {
    if(index.y<0||index.x<0||index.y>=dim_y||index.x>=dim_x)
    {

      return this->device_iterator[this->dim_x*this->dim_y];
    }
    return this->device_iterator[index.y * (this->dim_x + this->offset_x) + offset_y + index.x];
  }

  template <class T,class Alloc>
  __host__ __device__ __forceinline__ int2 block_2d<T,Alloc>::index_to_int2(int position) const
  {
    int i = position/dim_x;
    int j = position%dim_x;
    return make_int2(j,i);
  }

  template <class T,class Alloc>
  __host__ block_2d<T,Alloc>::iterator block_2d<T,Alloc>::begin()
  {
    return block_iterator<T,Alloc>(this,0);
  }
  template <class T,class Alloc>
  __host__  block_2d<T,Alloc>::iterator block_2d<T,Alloc>::end()
  {
    return block_iterator<T,Alloc>(this,(this->dim_y)*(this->dim_x));
  }

  template <class T,class Alloc>
  __host__ cudaTextureObject_t block_2d<T,Alloc>::getCudaTextureObject ()
  {
    //TODO : Remove MallocPitch after updating Block 2D to aligned memory
    T * aligned_device_memory;
    size_t pitch;
    cudaMallocPitch(&aligned_device_memory,&pitch,dim_x*sizeof(T),dim_y);
    cudaMemcpy2D(aligned_device_memory,pitch,data_pointer, dim_x*sizeof(T), dim_x*sizeof(T), dim_y,cudaMemcpyDeviceToDevice);

    //Create Resource Descriptor
    cudaResourceDesc resDesc;
    memset(&resDesc, 0, sizeof(resDesc));
    resDesc.resType = cudaResourceTypePitch2D;
    resDesc.res.pitch2D.desc = cudaCreateChannelDesc<T>();
    resDesc.res.pitch2D.pitchInBytes=pitch;
    resDesc.res.pitch2D.height =  dim_y;
    resDesc.res.pitch2D.width= dim_x;
    resDesc.res.pitch2D.devPtr = aligned_device_memory;
    //Create Texture Descriptor
    cudaTextureDesc texDesc;
    memset(&texDesc, 0, sizeof(texDesc));
    //Texture Object Creation
    cudaTextureObject_t texref;
    cudaCreateTextureObject(&texref, &resDesc, &texDesc, NULL);
    return texref;
  }

  template<class T,class Alloc>
	__host__ __device__ block_iterator<T,Alloc>::block_iterator (block_2d<T,Alloc> *pB, int position)
  {
    parent_block = pB->device_pointer;
    parent_block_host = pB;
    this->position = position;
    this->dim_y = pB->dim_y;
    this->dim_x = pB->dim_x;
  }

  template<class T,class Alloc>
__host__ __device__ block_iterator<T,Alloc>::block_iterator(const block_iterator<T,Alloc> &it)
  {
    this->parent_block = it.parent_block;
    this->parent_block_host = it.parent_block_host;
    this->position = it.position;
    this->dim_x = it.dim_x;
    this->dim_y = it.dim_y;
  }

  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc>::reference	block_iterator<T,Alloc>::operator* () const
  {
    int2 temp = parent_block->index_to_int2(position);
    return (*parent_block)[temp.y][temp.x];
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc>::reference	block_iterator<T,Alloc>::operator[] (const int index) const
  {
    int2 temp = parent_block->index_to_int2(position+index);
    return (*parent_block)[temp.y][temp.x];
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc> block_iterator<T,Alloc>::operator+ (long value)
  {
    block_iterator<T> temp = *this;
    temp.position+=value;
    return temp;
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc>& block_iterator<T,Alloc>::operator+= (long value)
  {
    this->position+=value;
    return *this;
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc>& block_iterator<T,Alloc>::operator++ ()
  {
    this->position++;
    return *this;
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc>::difference_type block_iterator<T,Alloc>::operator- (const block_iterator<T,Alloc>& it) const
  {
    return position - it.position;
  }

  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc>::difference_type block_iterator<T,Alloc>::operator- (block_iterator<T,Alloc>& it) const
  {
    return position - it.position;
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc> block_iterator<T,Alloc>::operator- (const long N)
  {
    block_iterator<T,Alloc> temp = *this;
    temp.position-=N;
    return temp;
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc> block_iterator<T,Alloc>::operator- (const long N) const
  {
    block_iterator<T,Alloc> temp = *this;
    temp.position-=N;
    return temp;
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc> block_iterator<T,Alloc>::operator-- ()
  {
    block_iterator<T,Alloc> temp = *this;
    temp.position-=1;
    return temp;
  }

  template<class T,class Alloc>
  __host__ __device__ bool block_iterator<T,Alloc>::operator!= (const block_iterator<T,Alloc>& it) const
  {
    return !((*this)==it);
  }
  template<class T,class Alloc>
  __host__ __device__ bool block_iterator<T,Alloc>::operator== (const block_iterator<T,Alloc>& it) const
  {
    return (this->position==it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T,class Alloc>
  __host__ __device__ bool block_iterator<T,Alloc>::operator<= (const block_iterator<T,Alloc>& it) const
  {
    return (this->position<=it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T,class Alloc>
  __host__ __device__ bool block_iterator<T,Alloc>::operator>= (const block_iterator<T,Alloc>& it) const
  {
    return (this->position>=it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T,class Alloc>
  __host__ __device__ bool block_iterator<T,Alloc>::operator> (const block_iterator<T,Alloc>& it) const
  {
    return (this->position>it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
  template<class T,class Alloc>
  __host__ __device__ bool block_iterator<T,Alloc>::operator< (const block_iterator<T,Alloc>& it) const
  {
    return (this->position<it.position&&this->dim_x==it.dim_x&&this->dim_y==it.dim_y);
  }
}
