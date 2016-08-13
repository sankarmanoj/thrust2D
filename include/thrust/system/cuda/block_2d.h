#pragma once

#include <thrust/device_vector.h>
#include <thrust/device_ptr.h>

namespace thrust
{
	template <class T>
	class Block_2D
	{
	public:

		int dim_x,dim_y;
	  int offset_x, offset_y;
		thrust::device_vector<T> device_data;
		thrust::detail::normal_iterator<thrust::device_ptr<T> > device_iterator;
		Block_2D * device_pointer ;
	  Block_2D(int dim_x,int dim_y);

	  Block_2D(Block_2D<T> &other);

 		void initalize_device_memory();

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

		thrust::detail::normal_iterator<thrust::device_ptr<T> > begin();
		thrust::detail::normal_iterator<thrust::device_ptr<T> > end();

	};
}
#include <thrust/system/cuda/block_2d.inl>
