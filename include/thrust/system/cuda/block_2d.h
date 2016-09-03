#pragma once

#include <thrust/device_vector.h>
#include <thrust/device_ptr.h>

namespace thrust
{
	// template <class T> class Block_2D;
	// template<class T>
	// class block_iterator : public detail::normal_iterator<device_ptr<T> >
	// {
	// public:
	// 	// Block_2D<T> *b;
	// 	int current_x,current_y;
	// 	// int dim_x,dim_y;
	// 	int start_x,start_y;
	// 	int stride_x,stride_y;
	// 	// detail::normal_iterator<device_ptr<T> > device_iterator;
	//
	// 	block_iterator ();
	//
	// 	// __host__ __device__ detail::normal_iterator<device_ptr<T> > operator[] (unsigned int index);
	// 	// __host__ __device__ const detail::normal_iterator<device_ptr<T> > operator[] (unsigned int index) const;
	// 	// __host__ __device__ detail::normal_iterator<device_ptr<T> > operator* ();
  //   // __host__ __device__ const detail::normal_iterator<device_ptr<T> > operator* () const;
	// 	//
	// 	// __host__ __device__ block_iterator<T> operator+ (long value);
	// 	//
	// 	// __host__ __device__ int operator- (const block_iterator& it);
	// 	//
	// 	// __host__ __device__ block_iterator<T> operator++ ();
	// 	//
	// 	// __host__ __device__ block_iterator<T> operator- (long N);
	// 	//
	// 	// __host__ __device__ block_iterator<T> (const block_iterator<T>& other);
	// 	//
	// 	// __host__ __device__ block_iterator<T>& operator= (block_iterator<T> it);
	// 	//
	// 	// __host__ __device__ __forceinline__ block_iterator<T> operator+= (long N);
	// 	// __host__ __device__ __forceinline__ const block_iterator<T> operator+= (long N) const;
	//
	// 	// void move_forward();
	// 	// void move_backward();
	// 	// void move_upward();
	// 	// void move_downward();
	// };

	template <class T>
	class Block_2D : public device_vector<T>
	{
	public:

	int dim_x,dim_y;
	int offset_x, offset_y;
	// device_vector<T> device_data;
	detail::normal_iterator<device_ptr<T> > device_iterator;
	Block_2D * device_pointer;
	Block_2D(int dim_x,int dim_y);
	Block_2D(int dim_x,int dim_y,T value);

	Block_2D(Block_2D<T> &other);

	// 	void initalize_device_memory();
	__host__ __device__ int2 convert2D(int index);
	Block_2D* sub_block (int ul_x, int ul_y, int br_x, int br_y);

	template <class InputIterator>
	Block_2D(InputIterator first, InputIterator last) : device_vector<T>(first,last)
	{
		this->dim_x = last-first;
		this->dim_y = 1;
		this->offset_x = 0;
		this->offset_y = 0;
		// device_data = device_vector<T>(dim_x * dim_y);
		device_iterator = this->data();
		Block_2D<T> * temp;
		cudaMalloc((void **)&temp,sizeof(Block_2D));
		cudaMemcpy(temp,this,sizeof(Block_2D),cudaMemcpyHostToDevice);
		this->device_pointer = temp;
	}

	__host__ __device__ detail::normal_iterator<device_ptr<T> > operator[] (int index);
	__host__ __device__ T operator[] (int2 index);

	// detail::normal_iterator<device_ptr<T> > begin();
	// detail::normal_iterator<device_ptr<T> > end();

	};
}
#include <thrust/system/cuda/block_2d.inl>
