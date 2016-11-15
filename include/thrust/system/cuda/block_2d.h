#pragma once
#include <thrust/detail/vector_base.h>
#include <thrust/device_malloc_allocator.h>
#include <typeinfo>
#include <memory.h>
namespace thrust
{
	template <class T,class Alloc=device_malloc_allocator<T> > class block_2d;
	template <class T,class Alloc>
	class block_2d_iterator
	{
	public:
		const block_2d<T,Alloc> *b;
		int index_y;
		__host__ __device__ block_2d_iterator(const block_2d<T,Alloc> *b, int index);
		__host__ __device__ T& operator[] (int index) const;
	};
	template <class T,class Alloc>
	class block_2d
	{
	public:
		int dim_x,dim_y;
		T* data;
		block_2d<T,Alloc> *device_pointer;
		block_2d(int dim_x,int dim_y);
		block_2d(int dim_x,int dim_y,T value);
		block_2d(block_2d<T,Alloc> &other);
		__host__ __device__ int2 index_to_int2(int index) const;
		__host__ __device__ block_2d_iterator<T,Alloc> operator[] (int index) const;
		__host__ __device__ T& operator[] (int2 index) const;
		void assign(T *begin,T *end);
		T* download();
		T* begin();
		T* end();
	};
	template <class T>
	using host_block_2d=block_2d<T,std::allocator<T> >;
}
#include <thrust/system/cuda/block_2d.inl>
