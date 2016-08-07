#pragma once

#include <thrust/system/cuda/shared_vector.h>
#include <thrust/system/cuda/detail/my_cuda_launch_config.h>
#include <thrust/device_ptr.h>
#include <iostream>
#include <exception>
#include <type_traits>
#include <cstdlib>

namespace thrust
{
	namespace hybrid
	{
		// The Actual For Each Kernel Which Will Be Called When host Calls thrust::for_each.
		template <class T, class F,typename Func>
			__global__
			void for_each_kernel_shared (T d_v, int N, Func f, F dummy)
			{
				int idx = blockIdx.x*blockDim.x + threadIdx.x;
				int num_threads = gridDim.x * blockDim.x;

				extern __shared__ F s_x[];

				/*
				 * Access Pattern Used ;
				 * Thread[0] Processes 0,1024,2048... Elements
				 * Since There are 1024 Threads Per Block
				 */

				for(int i = idx; i < N; i += num_threads)
				{
					//  Copy The Data From The Shared Memory
					s_x[threadIdx.x] = d_v[i];

					// Call The Functor On The Shared Memory Values/Vector

					f (s_x[threadIdx.x]);

					// Write Back The Values To The Global Memory
					d_v[i] = s_x[threadIdx.x];
				}
			}

		// The Actual Kernel That Is Executed When Host Calls thrust::transform ()
		template <class T,class F,typename Func>
			__global__
			void transform_kernel (T v1,T v2,T v3,int N,Func f,F dummy)
			{
				int idx = blockIdx.x*blockDim.x + threadIdx.x;
				int num_threads = gridDim.x * blockDim.x;

				const int NUM_TD=1024;

				__shared__ F s_x[NUM_TD];
				__shared__ F s_y[NUM_TD];

				for(int i = idx; i < N; i += num_threads)
				{
					//  Copy The Data To The Shared Memory
					s_x[threadIdx.x] = v1[i];
					s_y[threadIdx.x] = v2[i];

					__syncthreads();

					// Call The Functor On The Shared Memory Values/Vector
					v3[i] = f (s_x[threadIdx.x],s_y[threadIdx.x]);

				}
			}

		/*
		* Has been updated to have no shared memory bank conflicts
		*/
		template <class T,class F>
			__global__
			void transpose_kernel (T input,T output,F dummy)
			{
				const int TILE_DIM = 32;
				const int BLOCK_ROWS = 8;

				__shared__ F tile[TILE_DIM][TILE_DIM+1];

				int x = blockIdx.x * TILE_DIM + threadIdx.x;
				int y = blockIdx.y * TILE_DIM + threadIdx.y;
				int width = gridDim.x * TILE_DIM;

				for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
			   	tile[threadIdx.y+j][threadIdx.x] = input[(y+j)*width + x];

				__syncthreads();

				x = blockIdx.y * TILE_DIM + threadIdx.x;  // transpose block offset
				y = blockIdx.x * TILE_DIM + threadIdx.y;

				for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
			   	output[(y+j)*width + x] = tile[threadIdx.x][threadIdx.y + j];
			}

		template <class T,class F,class G>
			__global__
			void reduce_kernel (T start,F output,int N,G dummy)
			{

				int idx = blockIdx.x*blockDim.x + threadIdx.x;
				int num_threads = gridDim.x * blockDim.x;

				extern __shared__ G partial_sum[]; // Dynamic Shared Memory

				G sum = 0; // For Generic Function, Replace By Idendity Element

				for (int i=idx;i<N;i+=num_threads)
					sum += start[i]; // For Generic Function, Replace By Functor

				partial_sum[threadIdx.x] = sum;

				__syncthreads ();

				// This Step Computes The Reduction Function In A Bottom's Up Manner

				for (int activeThreads = blockDim.x>>1;activeThreads != 0;activeThreads >>= 1)
				{
					if (threadIdx.x < activeThreads)
						partial_sum[threadIdx.x] += partial_sum[threadIdx.x+activeThreads]; // For Generic Function, Replace += with functor

					__syncthreads ();
				}

				// When You Reach The Root Of The Tree Store It In Output Vector
				if (threadIdx.x == 0)
					output[blockIdx.x] = partial_sum[0];

				// TODO:: Below is the highly optimised reduce implementation. It is almost complete and will be uncomentted as soon as its finished.

				/*

					extern __shared__ int sdata[];

					int blockSize = 1024;
					int tid = threadIdx.x;
					int i = blockIdx.x*blockSize*2 + tid;
					int gridSize = blockSize*2*gridDim.x;

					sdata[tid] = 0;

					while (i < N)
					{
						sdata[tid] += start[i] + start[i+blockSize];
						i += gridSize;
					}


					__syncthreads();

					if (blockSize >= 1024)
					{
						if (tid < 512)
							sdata[tid] += sdata[tid+512];
						__syncthreads ();
					}

					if (blockSize >= 512)
					{
						if (tid < 256)
							sdata[tid] += sdata[tid+256];
						__syncthreads ();
					}
					if (blockSize >= 256)
					{
						if (tid < 128)
							sdata[tid] += sdata[tid+128];
						__syncthreads ();
					}
					if (blockSize >= 128)
					{
						if (tid < 64)
							sdata[tid] += sdata[tid+64];
						__syncthreads ();
					}

					if (tid < 32)
					{
						if (blockSize >= 64)
							sdata[tid] += sdata[tid+32];
						if (blockSize >= 32)
							sdata[tid] += sdata[tid+16];
						if (blockSize >= 16)
							sdata[tid] += sdata[tid+8];
						if (blockSize >= 8)
							sdata[tid] += sdata[tid+4];
						if (blockSize >= 4)
							sdata[tid] += sdata[tid+2];
						if (blockSize >= 2)
							sdata[tid] += sdata[tid+1];
					}

					if (tid == 0)
						output[blockIdx.x] = sdata[0];

				*/
		}

		/*
		*  Applies The functor specified in Func f on each element of the vector
		*/
		template <class T,typename InputIterator, typename Func>
			void for_each (InputIterator first,InputIterator last,Func f, T dummy)
			{
				int NUM_THREADS,NUM_BLK;
				calculate_launch_parameters (NUM_THREADS,NUM_BLK);

				/*
				* The Functions In thrust/system/cuda/shared_vector.inl need to be ported to this new_shared_vector.
				* After That Name Can be changed to shared_vector.
				* Till then we go on with the old shared_vector and the development will be done with new_shared_vector.
				*/

				int num_of_elements = last - first;

				bool shared = std::is_base_of<shared_iterator<T> ,InputIterator >::value;

				// printf ("%d\n",(int)shared);

				thrust::detail::wrapped_function<Func,void> wrapped_f(f);

				if (shared)
					for_each_kernel_shared <<<NUM_BLK,NUM_THREADS,NUM_THREADS*sizeof (first[0])>>> (first, num_of_elements, wrapped_f, dummy);
				else
					thrust::for_each (first,last,f);
			}


		template <typename InputIterator, typename Func>
			void for_each (InputIterator first,InputIterator last,Func f)
			{
				typedef typename thrust::iterator_value<InputIterator>::type InputType;

				for_each (first,last,f,InputType(0));
			}

		template <typename InputIterator,typename Func>
			void transform (InputIterator first,InputIterator last,InputIterator second,InputIterator third,Func f)
			{
				int NUM_THREADS,NUM_BLK;
				calculate_launch_parameters (NUM_THREADS,NUM_BLK);

				int num_of_elements = last - first;
				typedef typename thrust::iterator_value<InputIterator>::type InputType;

				transform_kernel<<<NUM_BLK,NUM_THREADS>>> (first,second,third,num_of_elements,f,InputType(0));

			}

		template <typename InputIterator>
			void transpose (InputIterator input,InputIterator output,int N)
			{
				const int TILE_DIM = 32;
				const int BLOCK_ROWS = 8;

				// NOTE : N is the number of rows/cols of the matrix.
				dim3 dimGrid (N/TILE_DIM,N/TILE_DIM,1);
				dim3 dimBlock (TILE_DIM,BLOCK_ROWS,1);

				typedef typename thrust::iterator_value<InputIterator>::type InputType;

				transpose_kernel<<<dimGrid,dimBlock>>> (input,output,InputType(0));
			}


		template <class T,typename InputIterator>
			T reduce (InputIterator first,InputIterator last,T dummy)
			{
				const int numBlocks = 26;
				const int numThreads = 1024;
				const int sharedSize = numThreads*sizeof (T);

				int number_of_elements = last-first;

				T *partial;
				cudaMalloc ((T**)&partial,number_of_elements*sizeof(T));

				T *answer_device;
				cudaMalloc ((T**)&answer_device,sizeof(T));

				reduce_kernel<<<numBlocks,numThreads,sharedSize>>> (first,partial,number_of_elements,dummy);

				reduce_kernel<<<1,numThreads,sharedSize>>> (partial,answer_device,numBlocks,dummy);

				T answer;

				cudaMemcpy (&answer,answer_device,sizeof(T),cudaMemcpyDeviceToHost);
				cudaFree (answer_device);
				cudaFree (partial);

				return answer;

			}

			template <typename InputIterator>
			typename thrust::iterator_traits<InputIterator>::value_type reduce (InputIterator first,InputIterator last)
			{
				typedef typename thrust::iterator_value<InputIterator>::type InputType;

				return thrust::hybrid::reduce (first,last,InputType(0));
			}

	} // End Of Hybrid Namespace

} // End Of Thrust Namespace
