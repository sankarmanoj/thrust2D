#pragma once
#include <thrust/system/cuda/window_2d.h>
#include <stdlib.h>
#include <stdio.h>
namespace thrust
{
  template <class T>
  __host__ __device__ window_2D<T>::window_2D()
  {

  }

  template <class T>
  __host__ __device__ window_2D<T>::window_2D(Block_2D<T> *b,int start_x, int start_y, int window_dim_x, int window_dim_y)
  {
    // TODO: Better Boundary checks.
    this->start_x = start_x;
    this->window_dim_x = window_dim_x;
    //printf("start x = %d , window_dim_x = %d , parent_dim = %d\n", start_x,window_dim_x,b->dim_x);
    // NOTE: Strictly less or less than equal to? Should a window comprising of entire block be allowed?
		// assert(start_x + window_dim_x <= b->dim_x);
		this->start_y = start_y;
    this->window_dim_y = window_dim_y;
		// assert(start_y + window_dim_y <= b->dim_y);
		this->b = b;
    this->block_dim_x = b->dim_x;
    this->block_dim_y = b->dim_y;
  }
  template <class T>
  __host__ __device__ window_2D<T>::window_2D (const window_2D<T> &obj)
  {
    this->start_x = obj.start_x;
    this->start_y = obj.start_y;
    this->window_dim_x = obj.window_dim_x;
    this->window_dim_y = obj.window_dim_y;
    this->b = obj.b;
    this->block_dim_y = obj.block_dim_y;
    this->block_dim_x = obj.block_dim_x;
  }

  template <class T>
  __host__ __device__ detail::normal_iterator<device_ptr<T> > window_2D<T>::operator[] (long index)
  {
    // TODO: Check Indexing of Window of a SubBlock.
    // printf("%d\n",b->dim_x);
    return (*b)[start_y + index] + start_x;
  }

  template <class T>
  __host__ __device__ const detail::normal_iterator<device_ptr<T> > window_2D<T>::operator[] (long index) const
  {
    // TODO: Check Indexing of Window of a SubBlock.
    // printf("%d\n",b->dim_x);
    return (*b)[start_y + index] + start_x;
  }

  // template <class T>
  //   __host__ __device__ window_2D<T>::operator device_reference<window_2D<T> >() const
  //   {
  //     return *this;
  //   }

  template <class T>
  __host__ window_iterator<T>::window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {

      this->b = b->device_pointer;
      this->block_dim_x = b->dim_x;
      this->block_dim_y = b->dim_y;
      // printf("Reached Here");
      this->window_dim_x = window_dim_x;
      this->window_dim_y = window_dim_y;
      this->stride_x = stride_x;
      this->stride_y = stride_y;
      this->position =0;
      this->windows_along_x= int((this->block_dim_x-window_dim_x)/stride_x) +1;
      this->windows_along_y = int((this->block_dim_y-window_dim_y)/stride_y)+1;

  }

  template <class T>
  __host__ window_iterator<T>::window_iterator(Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int position)
  {

      this->b = b->device_pointer;
      this->block_dim_x = b->dim_x;
      this->block_dim_y = b->dim_y;
      // printf("Reached Here");
      this->window_dim_x = window_dim_x;
      this->window_dim_y = window_dim_y;
      this->stride_x = stride_x;
      this->stride_y = stride_y;
      this->position =position;
      this->windows_along_x= int((this->block_dim_x-window_dim_x)/stride_x) +1;
      this->windows_along_y = int((this->block_dim_y-window_dim_y)/stride_y)+1;

  }
  template <class T>
  __host__ __device__ window_2D<T> window_iterator<T>::operator[] (long index)
  {
    // printf("Reached Here 1");
    int i = index/windows_along_y;
    int j = index%windows_along_y;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
    window_2D<T> temp(b, start_x,start_y,this->window_dim_x, this->window_dim_y);

    return temp;
  }

  template <class T>
  __host__ __device__ const window_2D<T> window_iterator<T>::operator[] (long index) const
  {
    // printf("Reached Here 2");
    int i = index/windows_along_y;
    int j = index%windows_along_y;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
        // printf("Reached Here 3");
    window_2D<T> temp(b, start_x,start_y,this->window_dim_x, this->window_dim_y);

    return temp;
  }

  template <class T>
  __host__ __device__ window_2D<T> window_iterator<T>::operator* ()
  {
    // printf("Reached Here 3");
    int i = position/windows_along_y;
    int j = position%windows_along_y;
    int start_x = stride_x*i;
    int start_y = stride_y*j;

    window_2D<T> temp(b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    return temp;
  }

  template <class T>
  __host__ __device__ const window_2D<T> window_iterator<T>::operator* () const
  {
    // printf("Reached Here 4");
    int i = position/windows_along_y;
    int j = position%windows_along_y;
    int start_x = stride_x*i;
    int start_y = stride_y*j;
    window_2D<T> temp(b, start_x,start_y,this->window_dim_x, this->window_dim_y);
    return temp;
  }

  template <class T>
  __host__ __device__ long window_iterator<T>::operator- (window_iterator& it)
  {
    // printf("operator-\n");
    return this->position - it.position;
  }

  template <class T>
  __host__ __device__ long window_iterator<T>::operator- (const window_iterator& it)
  {
    // printf("operator-\n");
    return this->position - it.position;
  }

  template <class T>
  __host__ __device__ long window_iterator<T>::operator- (const window_iterator& it) const
  {
    // printf("operator-\n");
    return this->position - it.position;
  }

  template <class T>
  __host__ __device__ long window_iterator<T>::operator- ( window_iterator& it) const
  {
    // printf("operator-\n");
    return this->position - it.position;
  }
  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator+ (long N)
  {
    this->position = this->position+N;
    if(this->position>=(this->windows_along_x*this->windows_along_y-1))
    this->position=(this->windows_along_x*this->windows_along_y-1);
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator++ ()
  {
    this->position++;
    if(this->position>=(this->windows_along_x*this->windows_along_y-1))
    this->position=(this->windows_along_x*this->windows_along_y-1);
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T> window_iterator<T>::operator- (long N)
  {
    this->position = this->position - N;
    if(this->position<0)
    this->position = 0;
    return *this;
  }

  template <class T>
  __host__ __device__ window_iterator<T>::window_iterator<T> (const window_iterator<T>& other)
  {
    // printf("Reached Here copy\n");
    this->b = other.b;
    this->window_dim_x = other.window_dim_x;
    this->window_dim_y = other.window_dim_y;
    this->stride_x = other.stride_x;
    this->stride_y = other.stride_y;
    this->block_dim_x = other.block_dim_x;
    this->block_dim_y = other.block_dim_y;
    this->position = other.position;
    this->windows_along_x = other.windows_along_x;
    this->windows_along_y = other.windows_along_y;
    // this->device_it = other.device_it;
  }

  template <class T>
  __host__ __device__ window_iterator<T>& window_iterator<T>::operator= (window_iterator<T>& it)
  {
    // printf("Reached Here 2\n");
    this->b = it.b;
    this->window_dim_x = it.window_dim_x;
    this->window_dim_y = it.window_dim_y;
    this->stride_x = it.stride_x;
    this->stride_y = it.stride_y;
    this->block_dim_x = it.block_dim_x;
    this->block_dim_y = it.block_dim_y;
    this->position = it.position;
    this->windows_along_x = it.windows_along_x;
    this->windows_along_y = it.windows_along_y;
    // this->device_it = it.device_it;
    return this;
  }

  template <class T>
  __host__ __device__ __forceinline__ window_iterator<T> window_iterator<T>::operator+= (long N)
  {
    this->position+=N;
    // printf("Reached Here += %d %d \n",current_x,current_y);
    if(this->position>=(this->windows_along_x*this->windows_along_y-1))
    this->position=(this->windows_along_x*this->windows_along_y-1);
    return *this;
  }

  template <class T>
  __host__ __device__ __forceinline__ const window_iterator<T> window_iterator<T>::operator+= (long N) const
  {
    this->position+=N;
    if(this->position>=(this->windows_along_x*this->windows_along_y-1))
    this->position=(this->windows_along_x*this->windows_along_y-1);
    return *this;
  }

  template <class T>
  __host__ __device__ bool window_iterator<T>::operator!= (const window_iterator<T>& it) const
  {
    return this->position!=it.position;
  }

  template <class T>
  __host__ __device__ bool window_iterator<T>::operator== (const window_iterator<T>& it) const
  {
    // printf("==\n");
    return this->position==it.position;
  }

  template <class T>
  __host__ __device__ bool window_iterator<T>::operator> (const window_iterator<T>& it) const
  {
    return this->position>it.position;
  }

  template <class T>
  __host__ __device__ bool window_iterator<T>::operator>= (const window_iterator<T>& it) const
  {
    return this->position>=it.position;
  }

  template <class T>
  __host__ __device__ bool window_iterator<T>::operator< (const window_iterator<T>& it) const
  {
    return this->position<it.position;
  }
  template <class T>
  __host__ __device__ bool window_iterator<T>::operator<= (const window_iterator<T>& it) const
  {
    return this->position<=it.position;
  }

  template <class T>
  window_vector<T>::window_vector (Block_2D<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y)
  {
    this->b = b;
    // this->b->initalize_device_memory();
    this->window_dim_x = window_dim_x;
    this->window_dim_y = window_dim_y;
    this->stride_x = stride_x;
    this->stride_y = stride_y;
  }
  template <class T>
  window_iterator<T> window_vector<T>::begin()
  {
    return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y);
  }
  template <class T>
  window_iterator<T> window_vector<T>::end()
  {

    int windowsX = int((b->dim_x-window_dim_x)/stride_x) +1;
    int windowsY = int((b->dim_y-window_dim_y)/stride_y)+1;
    return window_iterator<T>(b,window_dim_x,window_dim_y,stride_x,stride_y,windowsX*windowsY);
  }
  #define cudaCheckError() {                                          \
   cudaError_t e=cudaGetLastError();                                 \
   if(e!=cudaSuccess) {                                              \
     printf("Cuda failure %s:%d: '%s'\n",__FILE__,__LINE__,cudaGetErrorString(e));           \
     exit(0); \
   }                                                                 \
  }
  template<typename T>
  __global__ void convolveKernel (Block_2D<T> &block, Block_2D<T> &kernel, int operationsPerBlock,int totalOperations)
  {  extern __shared__ T sharedMemory []  ;
    T * sharedKernel = sharedMemory;
    int kernelSize = kernel.dim_x*kernel.dim_x;
    T * sharedReduceSpace = (sharedMemory+kernelSize);
    int kernelWidth = kernel.dim_x;
    int kernelHalfWidth = (kernel.dim_x-1)/2;
    T element;
    int i = threadIdx.x;
    int operationWithinBlock = threadIdx.x/kernelWidth;
    if(threadIdx.x<kernelSize)
    {
      sharedKernel[i] = kernel[kernel.convert2D(i)];
    }
    int position =  (blockIdx.y*gridDim.x+ blockIdx.x)*operationsPerBlock + operationWithinBlock;
    if(threadIdx.x*kernelWidth>operationsPerBlock)
    {
      return;
    }
    int2 blockCoordinates = block.convert2D(position);

    int absoluteRowOffset = threadIdx.x % kernelWidth;
    int rowOffset = absoluteRowOffset-kernelHalfWidth;
    sharedReduceSpace[threadIdx.x]=0;
    for(int i = 0; i< kernelWidth; i++)
    {
      element = block[make_int2(blockCoordinates.x-kernelHalfWidth + i,blockCoordinates.y+rowOffset)];
      sharedReduceSpace[threadIdx.x]+=element*sharedKernel[absoluteRowOffset*kernelWidth + i];
    }
    __syncthreads();
    //TODO:Optimze Reduction
    if(threadIdx.x %kernelWidth==0)
    {
      for(int i = threadIdx.x+1; i<threadIdx.x + kernelWidth; i++)
      {
        sharedReduceSpace[threadIdx.x]+=sharedReduceSpace[i];
      }
      block[blockCoordinates.y][blockCoordinates.x]=sharedReduceSpace[threadIdx.x];
    }

    return;
  }
  template<typename T>
  void convolve(Block_2D<T> *input, Block_2D<T> *kernel)
  {
    int numberOfOperations = input->end() - input->begin();
    // printf("Number Of Operations = %d\n", numberOfOperations);
    assert(kernel->dim_x==kernel->dim_y);
    assert(kernel->dim_x%2);
    int kernelDim = kernel->dim_x;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    // printf("Device Number: %d\n", 0);
    // printf("  Device name: %s\n", properties.name);
    // printf("  Memory Clock Rate (KHz): %d\n",           properties.memoryClockRate);
    // printf("  Memory Bus Width (bits): %d\n",           properties.memoryBusWidth);
    // printf("  Shared Memory Available: %d\n",           properties.sharedMemPerBlock);
    // printf("  Threads Per Block Available: %d\n",       properties.maxThreadsPerBlock);
    int sharedMemory = properties.sharedMemPerBlock;
    int maxOperationsInShared = ((sharedMemory/(2*sizeof(T)))-(kernelDim*kernelDim))/kernelDim;
    int maxOperationsByThread = properties.maxThreadsPerBlock/kernelDim;
    int operations = maxOperationsByThread;
    // printf("  Max Operations = %d, Operations = %d\n", min(maxOperationsByThread,maxOperationsInShared),operations);
    // int operations = min(maxOperationsByThread,maxOperationsInShared);

    int blocks = ceil(((float)numberOfOperations)/operations);
    int xblocks = 1, yblocks =1 ;
    if(blocks>65535)
    {
      xblocks = 65535;
      yblocks = ceil(blocks/xblocks);
    }
    else
    {
      xblocks = yblocks;
    }
    // printf(" Blocks = %d,%d \n",xblocks,yblocks);
    // printf("Shared Memory Allocated = %d \n",(kernel->dim_y*kernel->dim_x+ operations*kernelDim)*sizeof(T));
    convolveKernel<<<dim3(xblocks,yblocks),operations*kernelDim,(kernel->dim_y*kernel->dim_x+ operations*kernelDim)*sizeof(T)>>>(*(input->device_pointer),*(kernel->device_pointer),operations,numberOfOperations);
    cudaCheckError();
  }
}
