#pragma once
#include <thrust/system/cuda/window_2d.h>
#include <stdlib.h>
#include <stdio.h>

namespace thrust
{
  template<typename T>
  __global__ void convolveKernel (Block_2D<T> &block, Block_2D<T> &kernel, int operationsPerBlock,int totalOperations)
  {
    extern __shared__ T sharedMemory []  ;
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
  template<class Iterator>
  void convolve(Iterator begin1, Iterator end1, Iterator begin2)
  {
    typedef typename Iterator::value_type T;
    Block_2D<T> *input  = begin1.parentBlockHost;
    Block_2D<T> *kernel = begin2.parentBlockHost;
    int numberOfOperations = begin1.dim_x * begin1*dim_y;
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
    // int sharedMemory = properties.sharedMemPerBlock;
    // int maxOperationsInShared = ((sharedMemory/(2*sizeof(T)))-(kernelDim*kernelDim))/kernelDim;
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

  template<typename T, class Func>
  __global__ void forEachKernel (Block_2D<T> &input, int operationsPerBlock,int totalOperations,Func f)
  {

  }
  template <class Iterator, class Func>
  void window_for_each(Iterator begin1, Iterator end1, Func f)
  {
    typedef typename Iterator::value_type T;
    Block_2D<T> *input  = begin1.parentBlockHost;
    int numberOfOperations = begin1.dim_x * begin1*dim_y;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int maxOperationsByThread = properties.maxThreadsPerBlock;
    int operations = maxOperationsByThread;
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
    forEachKernel<<<dim3(xblocks,yblocks),operations>>>(*(input->device_pointer),operations,numberOfOperations,f);
    cudaCheckError();
  }
  template<typename T, class Func>
  __global__ void transformKernel (Block_2D<T> &input, Block_2D<T> &output, int operationsPerBlock,int totalOperations,Func f)
  {

  }
  template <class Iterator, class Func>
  void window_transform(Iterator begin1, Iterator end1, Iterator begin2, Func f)
  {
    typedef typename Iterator::value_type T;
    Block_2D<T> *input  = begin1.parentBlockHost;
    Block_2D<T> *output  = begin2.parentBlockHost;
    int numberOfOperations = begin1.dim_x * begin1*dim_y;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int maxOperationsByThread = properties.maxThreadsPerBlock;
    int operations = maxOperationsByThread;
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
    transformKernel<<<dim3(xblocks,yblocks),operations>>>(*(input->device_pointer),*(output->device_pointer),operations,numberOfOperations,f);
    cudaCheckError();
  }
  template<typename T, class Func>
  __global__ void transformKernel (Block_2D<T> &input1, Block_2D<T> &input2,Block_2D<T> &output1, int operationsPerBlock,int totalOperations,Func f)
  {

  }
  template <class Iterator, class Func>
  void window_transform(Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f)
  {
    typedef typename Iterator::value_type T;
    Block_2D<T> *input1  = begin1.parentBlockHost;
    Block_2D<T> *input2  = begin1.parentBlockHost;
    Block_2D<T> *output  = begin2.parentBlockHost;
    int numberOfOperations = begin1.dim_x * begin1*dim_y;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int maxOperationsByThread = properties.maxThreadsPerBlock;
    int operations = maxOperationsByThread;
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
    transformKernel<<<dim3(xblocks,yblocks),operations>>>(*(input1->device_pointer),*(input2->device_pointer),*(output->device_pointer),operations,numberOfOperations,f);
    cudaCheckError();
  }
}
