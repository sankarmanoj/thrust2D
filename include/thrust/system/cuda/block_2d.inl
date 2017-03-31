#pragma once
#include <thrust/system/cuda/block_2d.h>
namespace thrust
{
  template <class T,class Alloc>
  host_block_2d<T,Alloc>::host_block_2d (int dim_x,int dim_y) : block_2d<T,Alloc>( dim_x,dim_y)
  {

  }
  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d ()// : block_2d<T,std::allocator<T> >::block_2d (int dim_x,int dim_y)
  {

  }
  template <class T,class Alloc>
  host_block_2d<T,Alloc>::host_block_2d (int dim_x,int dim_y,T value) : block_2d<T,Alloc> (dim_x,dim_y, value)
  {

  }
  // template <class T,class Alloc>
  // host_block_2d<T,Alloc>::host_block_2d (block_2d<T> &b) //: block_2d<T,std::allocator<T> > (block_2d<T> &other)
  // {
  //   this->dim_x = b.dim_x;
  //   this->dim_y = b.dim_y;
  //   this->pitch = b.dim_x*sizeof(T);
  //   cudaMemcpy2D(this->data_pointer,this->pitch,b.data_pointer,b.pitch,this->dim_x,this->dim_y,cudaMemcpyDeviceToHost);
  //   this->device_pointer = this;
  // }
  template <class T,class Alloc>
  __host__ void host_block_2d<T,Alloc>::operator= (const block_2d<T> &b)
  {
    this->dim_x = b.dim_x;
    this->dim_y = b.dim_y;
    this->pitch = b.dim_x*sizeof(T);
    cudaMemcpy2D(this->data_pointer,this->pitch,b.data_pointer,b.pitch,this->dim_x*sizeof(T),this->dim_y,cudaMemcpyDeviceToHost);
    this->device_pointer = this;
  }
  template <class T, class Alloc>
  __host__ void block_2d<T,Alloc>::operator= (const host_block_2d<T> &b)
  {
    this->dim_x = b.dim_x;
    this->dim_y = b.dim_y;
    cudaMemcpy2D(this->data_pointer,this->pitch,b.data_pointer,b.pitch,this->dim_x*sizeof(T),this->dim_y,cudaMemcpyHostToDevice);
  }
  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (int dim_x, int dim_y)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    #if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CUDA
    // if (typeid(Alloc) == typeid(device_malloc_allocator<T>))
    {
      cudaMallocPitch((void **)&data_pointer,&pitch,dim_x*sizeof(T),dim_y);
      block_2d<T,Alloc> * temp;
      cudaMalloc((void **)&temp,sizeof(block_2d));
      cudaMemcpy(temp,this,sizeof(block_2d),cudaMemcpyHostToDevice);
      this->device_pointer = temp;
    }
    // else
    #else
    {
      data_pointer = (T*) std::malloc(dim_x*dim_y*sizeof(T));
      this->device_pointer = this;
      pitch=dim_x*sizeof(T);
    }
    #endif
  }

  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (int dim_x, int dim_y, T value)
  {
    this->dim_x = dim_x;
    this->dim_y = dim_y;
    // if (typeid(Alloc) == typeid(device_malloc_allocator<T>))
    #if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CUDA
    {
      cudaMallocPitch((void **)&data_pointer,&pitch,dim_x*sizeof(T),dim_y);
      cudaMemset2D((void **)data_pointer,pitch,value,dim_x*sizeof(T),dim_y);
      block_2d<T,Alloc> * temp;
      cudaMalloc((void **)&temp,sizeof(block_2d));
      cudaMemcpy(temp,this,sizeof(block_2d),cudaMemcpyHostToDevice);
      this->device_pointer = temp;
    }
    // else
    #else
    {
      data_pointer = (T*) std::malloc(dim_x*dim_y*sizeof(T));
      std::memset(data_pointer,value,dim_x*dim_y*sizeof(T));
      this->device_pointer = this;
      pitch=dim_x*sizeof(T);
    }
    #endif
  }

  template <class T,class Alloc>
  block_2d<T,Alloc>::block_2d (block_2d<T> &other)
  {
    this->dim_x = other.dim_x;
    this->dim_y = other.dim_y;
    this->pitch = other.pitch;
    this->data_pointer = other.data_pointer;
    this->device_pointer = other.device_pointer;
  }

  template <class T,class Alloc>
  __host__ void block_2d<T,Alloc>::upload (T* data)
  {
    #if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CUDA
    cudaMemcpy2D(data_pointer,pitch,data,dim_x*sizeof(T),dim_x*sizeof(T),dim_y,cudaMemcpyHostToDevice);
    #else
    memcpy(this->data_pointer,data,this->dim_x*sizeof(T)*this->dim_y);
    #endif
  }
  template <class T,class Alloc>
  __host__ void block_2d<T,Alloc>::download (T** data)
  {
    #if THRUST_DEVICE_SYSTEM==THRUST_DEVICE_SYSTEM_CUDA
    *data = (T*) std::malloc(sizeof(T)*dim_x*dim_y);
    cudaMemcpy2D(*data,dim_x*sizeof(T),data_pointer,pitch,dim_x*sizeof(T),dim_y,cudaMemcpyDeviceToHost);
    #else
    *data = this->data_pointer;
    #endif
  }
  template <class T,class Alloc>
  __host__ void host_block_2d<T,Alloc>::upload (T* data)
  {
    memcpy(this->data_pointer,data,this->dim_x*sizeof(T)*this->dim_y);
  }
  template <class T,class Alloc>
  __host__ void host_block_2d<T,Alloc>::download (T** data)
  {
    *data = (T*) std::malloc(sizeof(T)*this->dim_x*this->dim_y);
    memcpy(*data,this->data_pointer,this->dim_x*sizeof(T)*this->dim_y);
  }

  template <class T,class Alloc>
  __host__ __device__ block_2d_iterator<T,Alloc> block_2d<T,Alloc>::operator[] (int index)
  {
    return block_2d_iterator<T,Alloc>(this,index);
  }

  template <class T,class Alloc>
	__host__ __device__ block_2d<T,Alloc>::reference block_2d<T,Alloc>::operator[] (int2 index) const
  {
    // if(index.y<0||index.x<0||index.y>=dim_y||index.x>=dim_x)
    // {
    //
    //   return this->device_iterator[this->dim_x*this->dim_y];
    // }
    return data_pointer[index.y*pitch/sizeof(T)+index.x];
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

    //Create Resource Descriptor
    cudaResourceDesc resDesc;
    memset(&resDesc, 0, sizeof(resDesc));
    resDesc.resType = cudaResourceTypePitch2D;
    resDesc.res.pitch2D.desc = cudaCreateChannelDesc<T>();
    resDesc.res.pitch2D.pitchInBytes=pitch;
    resDesc.res.pitch2D.height =  dim_y;
    resDesc.res.pitch2D.width= dim_x;
    resDesc.res.pitch2D.devPtr = data_pointer;
    //Create Texture Descriptor
    cudaTextureDesc texDesc;
    memset(&texDesc, 0, sizeof(texDesc));
    //Texture Object Creation
    cudaTextureObject_t texref;
    cudaCreateTextureObject(&texref, &resDesc, &texDesc, NULL);
    return texref;
  }

  template<class T,class Alloc>
  __host__ __device__ block_2d_iterator<T,Alloc>::block_2d_iterator<T,Alloc>(block_2d<T,Alloc> *b, int index)
  {
    this->b=b;
    this->index_y=index;
  }

  template<class T,class Alloc>
  __host__ __device__ T & block_2d_iterator<T,Alloc>::operator[] (int index) const
  {
      return b->data_pointer[index_y*b->pitch/sizeof(T) + index];
  }

  template<class T,class Alloc>
	__host__ __device__ block_iterator<T,Alloc>::block_iterator<T,Alloc>(block_2d<T,Alloc> *pB, int position)
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
    return (*parent_block)[temp];
  }
  template<class T,class Alloc>
  __host__ __device__ block_iterator<T,Alloc>::reference	block_iterator<T,Alloc>::operator[] (const int index) const
  {
    int2 temp = parent_block->index_to_int2(position+index);
    return (*parent_block)[temp];
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
