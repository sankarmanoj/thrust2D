#pragma once

#include <thrust/detail/vector_base.h>
#include <thrust/device_malloc_allocator.h>
#include <thrust/device_ptr.h>
#include <thrust/host_vector.h>
#include <typeinfo>

namespace thrust
{
	template <class T,class Alloc=device_malloc_allocator<T> > class block_2d;
	template<class T,class Alloc=device_malloc_allocator<T> >
	class block_iterator : public block_2d<T,Alloc>::iterator_base
	{
	public:
		block_2d<T,Alloc> *parent_block;
		block_2d<T,Alloc> *parent_block_host;

		int position;
		int dim_x,dim_y;
		typedef typename block_2d<T,Alloc>::value_type value_type;
		typedef typename block_2d<T,Alloc>::reference reference;
		typedef long difference_type;
		// typedef detail::iterator_category_with_system_and_traversal<random_access_device_iterator_tag, system::cuda::detail::tag, random_access_traversal_tag> iterator_category;
		// typedef thrust::device_reference<T> reference;
		// typedef T* pointer;
		__host__ __device__ reference	operator* () const;
		__host__ __device__ reference operator[] (long index);

		__host__ __device__ block_iterator (const block_iterator<T,Alloc> &pb) ;
		__host__ __device__ block_iterator (block_2d<T,Alloc> *pB, int position);

		__host__ __device__ block_iterator<T,Alloc> operator+ (long value);
		__host__ __device__ difference_type operator- (const block_iterator<T,Alloc>& it);
		__host__ __device__ difference_type operator- (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ block_iterator<T,Alloc> operator- (const long N);
		__host__ __device__ block_iterator<T,Alloc> operator- (const long N) const;
		__host__ __device__ block_iterator<T,Alloc> operator-- ();
		__host__ __device__ block_iterator<T,Alloc>& operator+= (long N);

		// __host__ __device__ block_iterator<T>& operator+= (const long N)const ;
		__host__ __device__ block_iterator<T,Alloc>& operator++ ();
		__host__ __device__ bool operator!= (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator== (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator>= (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator<= (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator> (const block_iterator<T,Alloc>& it) const;
		__host__ __device__ bool operator< (const block_iterator<T,Alloc>& it) const;

	};

	template <class T,class Alloc>
	class block_2d : public detail::vector_base<T,Alloc>
	{
	public:
		typedef typename detail::vector_base<T,Alloc>::iterator iterator_base;
		typedef block_iterator<T,Alloc> iterator;
		typedef typename detail::vector_base<T,Alloc>::reference reference;
		typedef typename detail::vector_base<T,Alloc>::value_type value_type;
		int dim_x,dim_y;
		int offset_x, offset_y;
		// device_vector<T> device_data;
		iterator_base device_iterator;
		block_2d *device_pointer;
		block_2d(int dim_x,int dim_y);
		block_2d(int dim_x,int dim_y,T value);

		block_2d(block_2d<T> &other);
		__host__ __device__ int2 index_to_int2(int index);
		block_2d* sub_block (int ul_x, int ul_y, int br_x, int br_y);

		template <class InputIterator>
		block_2d(InputIterator first, InputIterator last) : detail::vector_base<T,Alloc>(first,last)
		{
			this->dim_x = last-first;
			this->dim_y = 1;
			this->offset_x = 0;
			this->offset_y = 0;
			// device_data = device_vector<T>(dim_x * dim_y);
			device_iterator = this->data();
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

		__host__ __device__ iterator_base operator[] (int index);
		__host__ __device__ reference operator[] (int2 index);

		iterator begin();
		iterator end();
	};
	template <class T>
	using host_block_2d=block_2d<T,std::allocator<T> >;
}
#include <thrust/system/cuda/block_2d.inl>
