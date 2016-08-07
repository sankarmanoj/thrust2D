#pragma once

#include <thrust/device_vector.h>
#include <thrust/device_ptr.h>
// #include <thrust/transform.h>
// #include <thrust/sequence.h>
// #include <thrust/copy.h>
// #include <thrust/fill.h>
// #include <thrust/replace.h>
// #include <thrust/functional.h>

namespace thrust
{
	template <class T> class Block_2D;
	template<class T>
	class block_iterator
	{
	public:
		Block_2D<T> *b;
		int current_x,current_y;
		int dim_x,dim_y;
		int start_x,start_y;
		int stride_x,stride_y;
		thrust::detail::normal_iterator<thrust::device_ptr<T> > device_iterator;

		block_iterator (Block_2D<T> *b, int start_x, int start_y);
		__host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > operator[] (int index);
		__host__ __device__ block_iterator<T> operator + (int value);
		void move_forward();
		void move_backward();
		void move_upward();
		void move_downward();


	};

	template <class T>
	class Block_2D
	{
	public:

		int dim_x,dim_y;
	  int offset_x, offset_y;
		thrust::device_vector<T> device_data;
		thrust::detail::normal_iterator<thrust::device_ptr<T> > device_iterator;

	  Block_2D(int dim_x,int dim_y);

	  Block_2D(Block_2D<T> &other);

		Block_2D<T> * get_device_pointer();

	  Block_2D* sub_block (int ul_x, int ul_y, int br_x, int br_y);

	  template <class InputIterator>
	  void copy(InputIterator first, InputIterator last)
		{
			// NOTE: Implementation has to be inline because partial template specialisation of a single function in a class is not possible.
			int n_elements = last - first;
	    if (n_elements != this->dim_x * this->dim_y)
	    {
	      // TODO: More graceful exit.
	      printf("Fatal Error : Mismatch in number of elements\n");
				exit(1);
	    }
	    thrust::copy(first, last, device_data.begin());
		}

		__host__ __device__ thrust::detail::normal_iterator<thrust::device_ptr<T> > operator[] (int index);

		block_iterator<T> begin();
		block_iterator<T> end();

	};

	template <class T>
	class block_transform_functor
	{
	public:
		__device__ virtual void operator() (T &b_in1, T &b_in2, T &b_out) = 0;
	};

	template <class T>
	class block_for_each_functor
	{
	public:
	  __device__ virtual void operator() (T &b) = 0;
	};
}
#include <thrust/system/cuda/block_2d.inl>
