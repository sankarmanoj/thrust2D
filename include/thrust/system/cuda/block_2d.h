#pragma once

#include <thrust/detail/vector_base.h>
#include <thrust/device_malloc_allocator.h>
#include <thrust/device_ptr.h>
#include <thrust/host_vector.h>
#include <typeinfo>
#include <vector_functions.h>
#include "memory.h"
namespace thrust
{
	template <class T,class Alloc=device_malloc_allocator<T> > class block_2d;
	template <class T,class Alloc=std::allocator<T> >	class host_block_2d;
	template<class T,class Alloc=device_malloc_allocator<T> >
	class block_iterator
	{
	public:
		block_2d<T,Alloc> *parent_block;
		block_2d<T,Alloc> *parent_block_host;
		int position;
		int dim_x,dim_y;
		typedef typename block_2d<T,Alloc>::value_type value_type;
		typedef typename block_2d<T,Alloc>::reference reference;
		typedef typename block_2d<T,Alloc>::pointer pointer;
		typedef typename detail::normal_iterator<typename detail::vector_base<T,Alloc>::pointer> iterator;
    typedef typename iterator::iterator_category iterator_category;
		typedef long difference_type;
		__host__ __device__ reference	operator* () const;
		__host__ __device__ reference	operator[] (const int index) const;
		__host__ __device__ block_iterator (const block_iterator<T,Alloc> &pb);
		__host__ __device__ block_iterator (block_2d<T,Alloc> *pB, int position);
		__host__ __device__ block_iterator<T,Alloc> operator+ (long value);
		__host__ __device__ difference_type operator- (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ difference_type operator- (block_iterator<T,Alloc>& it) const;
		__host__ __device__ block_iterator<T,Alloc> operator-- ();
		__host__ __device__ block_iterator<T,Alloc>& operator+= (long N);
		__host__ __device__ block_iterator<T,Alloc>& operator++ ();
		__host__ __device__ block_iterator<T,Alloc> operator- (const long N);
		__host__ __device__ block_iterator<T,Alloc> operator- (const long N) const;
		__host__ __device__ bool operator!= (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator== (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator>= (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator<= (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator> (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator< (const block_iterator<T,Alloc>& it) const;
	};

	template<class T,class Alloc>
	class block_2d_iterator
	{
		int index_y;
		block_2d<T,Alloc> *b;
	public:
		typedef T& reference;
		typedef T* pointer;
		__host__ __device__ block_2d_iterator (block_2d<T,Alloc> *b, int index);
		__host__ __device__ reference operator[] (int index) const;
	};

	template <class T,class Alloc>
	class block_2d
	{
	public:
		// typedef typename detail::vector_base<T,Alloc>::iterator iterator_base;
		typedef block_iterator<T,Alloc> iterator;
		// typedef typename detail::vector_base<T,Alloc>::reference reference;
		// typedef typename detail::vector_base<T,Alloc>::value_type value_type;
		typedef T& reference;
		typedef T* pointer;
		typedef T value_type;
		int dim_x,dim_y;
		size_t pitch;
		pointer data_pointer;
		// iterator_base device_iterator;
		block_2d *device_pointer;
		block_2d ();
		block_2d (int dim_x,int dim_y);
		block_2d (int dim_x,int dim_y,T value);
		block_2d (block_2d<T> &other);
		__host__ void operator=(const host_block_2d<T> &b);
		__host__ void upload (T* data);
		__host__ void download (T** data);
		__host__ __device__ int2 index_to_int2(int index) const;
		__host__ __device__ block_2d_iterator<T,Alloc> operator[] (int index);
		__host__ __device__ reference operator[] (int2 index) const;
		iterator begin();
		iterator end();
		cudaTextureObject_t getCudaTextureObject();
	};
	// template <class T>
	// using host_block_2d=block_2d<T,std::allocator<T> >;
	template <class T,class Alloc>
	class host_block_2d : public block_2d<T,Alloc>
	{
	public:
		host_block_2d (int dim_x,int dim_y);
		host_block_2d (int dim_x,int dim_y,T value);
		// host_block_2d (host_block_2d<T> &other);
		host_block_2d (block_2d<T> &b);
		__host__ void upload (T* data);
		__host__ void download (T** data);
		__host__ T* data();
		__host__ void operator= (const block_2d<T> &b);
	};
}
#include <thrust/system/cuda/block_2d.inl>
