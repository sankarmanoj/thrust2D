#pragma once

#include <thrust/device_vector.h>
#include <thrust/device_ptr.h>
#include <thrust/host_vector.h>

namespace thrust
{
	template <class T> class block_2d;
	template<class T>
	class block_iterator : private detail::normal_iterator<device_ptr<T>  >
	{
	public:
		block_2d<T> *parent_block;
		block_2d<T> *parent_block_host;
		int position;
		int dim_x,dim_y;
		typedef T value_type;
		typedef long difference_type;
		typedef detail::iterator_category_with_system_and_traversal<random_access_device_iterator_tag, system::cuda::detail::tag, random_access_traversal_tag> iterator_category;
		typedef thrust::device_reference<T> reference;
		typedef T* pointer;
		__host__ __device__ reference	operator* () const;
		__host__ __device__ reference operator[] (long index);

		__host__ __device__ block_iterator (const block_iterator<T> &pb) ;
		__host__ __device__ block_iterator (block_2d<T> *pB, int position);

		__host__ __device__ block_iterator<T> operator+ (long value);
		__host__ __device__ difference_type operator- (const block_iterator& it);
		__host__ __device__ difference_type operator- (const block_iterator& it) const;
		__host__ __device__ block_iterator<T> operator- (const long N);
		__host__ __device__ block_iterator<T> operator- (const long N) const;
		__host__ __device__ block_iterator<T> operator-- ();
		__host__ __device__ block_iterator<T>& operator+= (long N);

		// __host__ __device__ block_iterator<T>& operator+= (const long N)const ;
		__host__ __device__ block_iterator<T>& operator++ ();
		__host__ __device__ bool operator!= (const block_iterator<T>& it) const;
		__host__ __device__ bool operator== (const block_iterator<T>& it) const;
		__host__ __device__ bool operator>= (const block_iterator<T>& it) const;
		__host__ __device__ bool operator<= (const block_iterator<T>& it) const;
		__host__ __device__ bool operator> (const block_iterator<T>& it) const;
		__host__ __device__ bool operator< (const block_iterator<T>& it) const;

	};

	template <class T>
	class block_2d : public device_vector<T>
	{
	public:

		int dim_x,dim_y;
		int offset_x, offset_y;
		// device_vector<T> device_data;
		detail::normal_iterator<device_ptr<T> > device_iterator;
		block_2d * device_pointer;
		block_2d(int dim_x,int dim_y);
		block_2d(int dim_x,int dim_y,T value);

		block_2d(block_2d<T> &other);
		__host__ __device__ int2 index_to_int2(int index);
		block_2d* sub_block (int ul_x, int ul_y, int br_x, int br_y);

		template <class InputIterator>
		block_2d(InputIterator first, InputIterator last) : device_vector<T>(first,last)
		{
			this->dim_x = last-first;
			this->dim_y = 1;
			this->offset_x = 0;
			this->offset_y = 0;
			// device_data = device_vector<T>(dim_x * dim_y);
			device_iterator = this->data();
			block_2d<T> * temp;
			cudaMalloc((void **)&temp,sizeof(block_2d));
			cudaMemcpy(temp,this,sizeof(block_2d),cudaMemcpyHostToDevice);
			this->device_pointer = temp;
		}

		__host__ __device__ detail::normal_iterator<device_ptr<T> > operator[] (int index);
		__host__ __device__ T operator[] (int2 index);

		block_iterator<T> begin();
		block_iterator<T> end();

	};

	template <class T>
	class host_block_2d : public host_vector<T>
	{
	public:
		typedef typename detail::vector_base<T,std::allocator<T> >::iterator iterator;
		int dim_x,dim_y;
		int offset_x, offset_y;
		// device_vector<T> device_data;
		iterator host_iterator;
		// block_2d * device_pointer;
		host_block_2d(int dim_x,int dim_y);
		host_block_2d(int dim_x,int dim_y,T value);

		host_block_2d(host_block_2d<T> &other);
		__host__ int2 index_to_int2(int index);
		host_block_2d* sub_block (int ul_x, int ul_y, int br_x, int br_y);

		template <class InputIterator>
		host_block_2d(InputIterator first, InputIterator last) : host_vector<T>(first,last)
		{
			this->dim_x = last-first;
			this->dim_y = 1;
			this->offset_x = 0;
			this->offset_y = 0;
			// device_data = device_vector<T>(dim_x * dim_y);
			host_iterator = this->data();
		}

		__host__ iterator operator[] (int index);
		__host__ T operator[] (int2 index);

		iterator begin();
		iterator end();

	};
}
#include <thrust/system/cuda/block_2d.inl>
