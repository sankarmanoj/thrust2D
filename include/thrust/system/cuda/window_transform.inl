#pragma once
#include <thrust/system/cuda/window_2d.h>
void mAssert(int x, const char * message)
{
  if(!x)
  {
    perror(message);
    exit(-1);
  }
}
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
    int numberOfOperations = begin1.dim_x * begin1.dim_y;
    // printf("Number Of Operations = %d\n", numberOfOperations);
    assert(kernel->dim_x==kernel->dim_y);
    assert(kernel->dim_x%2);
    int kernelDim = kernel->dim_x;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int blockSize, minGridSize;
    cudaOccupancyMaxPotentialBlockSize( &minGridSize, &blockSize,convolveKernel<T>, 0, 0);
    // printf("Occupancy blockSize = %d, minGridSize = %d ",blockSize,minGridSize);
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
      xblocks = blocks;
    }
    // printf(" Blocks = %d,%d \n",xblocks,yblocks);
    // printf("Shared Memory Allocated = %d \n",(kernel->dim_y*kernel->dim_x+ operations*kernelDim)*sizeof(T));
    // printf("Actual Block Size = %d, Grid Size = %d ",operations*kernelDim,xblocks*yblocks);
    convolveKernel<<<dim3(xblocks,yblocks),operations*kernelDim,(kernel->dim_y*kernel->dim_x+ operations*kernelDim)*sizeof(T)>>>(*(input->device_pointer),*(kernel->device_pointer),operations,numberOfOperations);
    cudaCheckError();
  }

  template<typename T, class Func>
  __global__ void forEachKernel (window_iterator<T> *input, int operationsPerBlock,int totalOperations, int shared_block_dim_x , int shared_block_dim_y ,Func f)
  {
    extern __shared__ T sharedMemory [];
    int absolutePosition = (blockIdx.y*gridDim.x + blockIdx.x)*operationsPerBlock + threadIdx.x;
    // int windowSize = input->window_dim_x*(input->window_dim_y);
    if(absolutePosition>=totalOperations||threadIdx.x >=operationsPerBlock)
      return;
    window_2D<T> currentWindow = (*input)[absolutePosition];
    int independantWindowSize = min(input->stride_y,input->window_dim_y)*min(input->stride_x,input->window_dim_x);
    int start_x = (threadIdx.x%input->windows_along_x)*input->window_dim_x;
    int start_y = (threadIdx.x/input->windows_along_x)*input->window_dim_y;

    window_2D<T> mWindow(sharedMemory,start_x,start_y,input->window_dim_x,input->window_dim_y,shared_block_dim_x,shared_block_dim_y);
    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        mWindow[j][i]=currentWindow[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",currentWindow[j][i],i,j,currentWindow.start_x,currentWindow.start_y);
      }
    }

    f(mWindow);

    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        currentWindow[j][i]=mWindow[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",currentWindow[j][i],i,j,currentWindow.start_x,currentWindow.start_y);
      }
    }
  }

  template <class Iterator, class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f)
  {
    typedef typename Iterator::base_value_type T;
    int numberOfOperations = end1-begin1;
    int numberOfWindows = end1 - begin1;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int sharedMemorySize = properties.sharedMemPerBlock;
    int sizeofSingleWindowRow;
    if(begin1.stride_x<=begin1.window_dim_x)
    {
      sizeofSingleWindowRow = sizeof(T)*begin1.block_dim_x*begin1.window_dim_y;
    }
    else
    {
      sizeofSingleWindowRow = sizeof(T)*begin1.windows_along_x*begin1.window_dim_x*begin1.window_dim_y;
    }
    int rowsPerBlockByMemory;
    int operationsPerBlockByMemory;
    int rowsPerBlock,dataRowsPerBlock ;
    int operationsPerBlock;
    rowsPerBlockByMemory = sharedMemorySize/sizeofSingleWindowRow;

    if(begin1.stride_y<=begin1.window_dim_y)
    {
      operationsPerBlockByMemory = (rowsPerBlockByMemory) * begin1.windows_along_x;
      rowsPerBlock = min(rowsPerBlockByMemory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
      dataRowsPerBlock = (rowsPerBlock-begin1.window_dim_y+1);
      operationsPerBlock = min(operationsPerBlockByMemory,properties.maxThreadsPerBlock);
    }
    else
    {
        operationsPerBlockByMemory = rowsPerBlockByMemory*begin1.windows_along_x;
        rowsPerBlock = min(rowsPerBlockByMemory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
        dataRowsPerBlock = (rowsPerBlock-1)*begin1.stride_y + begin1.window_dim_y;
        operationsPerBlock = min(operationsPerBlockByMemory,properties.maxThreadsPerBlock);
    }

    int blocks = ceil(((float)numberOfOperations)/operationsPerBlock);
    int xblocks = 1, yblocks =1 ;
    if(blocks>65535)
    {
      xblocks = 65535;
      yblocks = ceil(blocks/xblocks);
    }
    else
    {
      xblocks = blocks;
    }
    #ifdef DEBUG
    printf("Number Of Total Windows Created = %d \n",numberOfWindows );
    printf("Size of T = %d, Size of A Single Row of Windows = %d\n",sizeof(T),sizeofSingleWindowRow);
    printf("Windows Along X,Y = %d,%d \n",begin1.windows_along_x,begin1.windows_along_y);
    printf("Blocks = %d , Xblocks = %d , Yblocks = %d  Rows Per Block =%d RPB By Memory= %d \n",blocks,xblocks,yblocks,rowsPerBlock,rowsPerBlockByMemory);
    printf("Total Operations = %d,Operations Per Block = %d, OPB By Memory = %d\n",numberOfOperations,operationsPerBlock,operationsPerBlockByMemory);
    printf("\n Config = (%d,%d)x%d SharedMem=%d",xblocks,yblocks,operationsPerBlock,sharedMemorySize);
    #endif
    assert((sizeofSingleWindowRow)<sharedMemorySize);
    assert(rowsPerBlockByMemory);
    Iterator * deviceBegin1;
    cudaMalloc((void **)&deviceBegin1, sizeof(Iterator));
    cudaMemcpy(deviceBegin1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    forEachKernel<<<dim3(xblocks,yblocks),operationsPerBlock,sharedMemorySize>>>(deviceBegin1,operationsPerBlock,numberOfOperations,begin1.block_dim_x,dataRowsPerBlock,f);

    cudaCheckError();
  }
  template<typename T, class Func>
  __global__ void transformKernel (window_iterator<T> *input, window_iterator<T> * output, int operationsPerBlock,int totalOperations, int shared_block_dim_x , int shared_block_dim_y ,Func f)
  {
    extern __shared__ T sharedMemory [];
    int absolutePosition = (blockIdx.y*gridDim.x + blockIdx.x)*operationsPerBlock + threadIdx.x;
    if(absolutePosition>=totalOperations||threadIdx.x >=operationsPerBlock)
      return;
    window_2D<T> inputWindow = (*input)[absolutePosition];
    window_2D<T> outputWindow =(*output) [absolutePosition];
    int start_x = (threadIdx.x%input->windows_along_x)*input->window_dim_x;
    int start_y = (threadIdx.x/input->windows_along_x)*input->window_dim_y;

    window_2D<T> mInputWindow(sharedMemory,start_x,start_y,input->window_dim_x,input->window_dim_y,2*shared_block_dim_x,shared_block_dim_y);
    window_2D<T> mOutputWindow(sharedMemory,start_x+shared_block_dim_x,start_y,input->window_dim_x,input->window_dim_y,2*shared_block_dim_x,shared_block_dim_y);
    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        mInputWindow[j][i]=inputWindow[j][i];
        mOutputWindow[j][i]=outputWindow[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",currentWindow[j][i],i,j,currentWindow.start_x,currentWindow.start_y);
      }
    }

    f(mInputWindow,mOutputWindow);

    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        inputWindow[j][i]=mInputWindow[j][i];
        outputWindow[j][i]=mOutputWindow[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",currentWindow[j][i],i,j,currentWindow.start_x,currentWindow.start_y);
      }
    }
  }
  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f)
  {
    typedef typename Iterator::value_type T;

    assert(begin1.block_dim_x == begin2.block_dim_x);
    assert(begin1.block_dim_y == begin2.block_dim_y);
    assert(begin1.window_dim_x == begin2.window_dim_x);
    assert(begin1.window_dim_y == begin2.window_dim_y);
    assert(begin1.stride_x == begin2.stride_x);
    assert(begin1.stride_y == begin2.stride_y);
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int sharedMemorySize = properties.sharedMemPerBlock;
    int sizeofSingleWindowRow;
    int numberOfOperations = end1-begin1;
    int numberOfWindows = end1 - begin1;

    if(begin1.stride_x<=begin1.window_dim_x)
    {
      sizeofSingleWindowRow = 2*sizeof(T)*begin1.block_dim_x*begin1.window_dim_y;
    }
    else
    {
      sizeofSingleWindowRow = 2*sizeof(T)*begin1.windows_along_x*begin1.window_dim_x*begin1.window_dim_y;
    }
    int rowsPerBlockByMemory;
    int operationsPerBlockByMemory;
    int rowsPerBlock,dataRowsPerBlock ;
    int operationsPerBlock;
    rowsPerBlockByMemory = sharedMemorySize/sizeofSingleWindowRow;

    if(begin1.stride_y<=begin1.window_dim_y)
    {
      operationsPerBlockByMemory = (rowsPerBlockByMemory) * begin1.windows_along_x;
      rowsPerBlock = min(rowsPerBlockByMemory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
      dataRowsPerBlock = (rowsPerBlock-begin1.window_dim_y+1);
      operationsPerBlock = min(operationsPerBlockByMemory,properties.maxThreadsPerBlock);
    }
    else
    {
        operationsPerBlockByMemory = rowsPerBlockByMemory*begin1.windows_along_x;
        rowsPerBlock = min(rowsPerBlockByMemory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
        dataRowsPerBlock = (rowsPerBlock-1)*begin1.stride_y + begin1.window_dim_y;
        operationsPerBlock = min(operationsPerBlockByMemory,properties.maxThreadsPerBlock);
    }

    int blocks = ceil(((float)numberOfOperations)/operationsPerBlock);
    int xblocks = 1, yblocks =1 ;
    if(blocks>65535)
    {
      xblocks = 65535;
      yblocks = ceil(blocks/xblocks);
    }
    else
    {
      xblocks = blocks;
    }
    #ifdef DEBUG
    printf("Number Of Total Windows Created = %d \n",numberOfWindows );
    printf("Size of T = %d, Size of A Single Row of Windows = %d\n",sizeof(T),sizeofSingleWindowRow);
    printf("Windows Along X,Y = %d,%d \n",begin1.windows_along_x,begin1.windows_along_y);
    printf("Blocks = %d , Xblocks = %d , Yblocks = %d  Rows Per Block =%d RPB By Memory= %d \n",blocks,xblocks,yblocks,rowsPerBlock,rowsPerBlockByMemory);
    printf("Total Operations = %d,Operations Per Block = %d, OPB By Memory = %d\n",numberOfOperations,operationsPerBlock,operationsPerBlockByMemory);
    printf("\n Config = (%d,%d)x%d SharedMem=%d",xblocks,yblocks,operationsPerBlock,sharedMemorySize);
    #endif
    assert((sizeofSingleWindowRow)<sharedMemorySize);
    assert(rowsPerBlockByMemory);
    Iterator * deviceBegin1 , *deviceBegin2;
    cudaMalloc((void **)&deviceBegin2,sizeof(Iterator));
    cudaMalloc((void **)&deviceBegin1, sizeof(Iterator));
    cudaMemcpy(deviceBegin2,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    cudaMemcpy(deviceBegin1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    transformKernel<<<dim3(xblocks,yblocks),operationsPerBlock,sharedMemorySize>>>(deviceBegin1,deviceBegin2,operationsPerBlock,numberOfOperations,begin1.block_dim_x,dataRowsPerBlock,f);

    cudaCheckError();
  }
  template<typename T, class Func>
  __global__ void transformKernel (Block_2D<T> &input1, Block_2D<T> &input2,Block_2D<T> &output1, int operationsPerBlock,int totalOperations,Func f)
  {

  }
  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f)
  {
    typedef typename Iterator::value_type T;
    Block_2D<T> *input1  = begin1.parentBlockHost;
    Block_2D<T> *input2  = begin1.parentBlockHost;
    Block_2D<T> *output  = begin2.parentBlockHost;
    int numberOfOperations = begin1.block_dim_x * begin1.block_dim_y;
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
      xblocks = blocks;
    }
    transformKernel<<<dim3(xblocks,yblocks),operations>>>(*(input1->device_pointer),*(input2->device_pointer),*(output->device_pointer),operations,numberOfOperations,f);
    cudaCheckError();
  }

  template <class T>
  __global__ void MatrixMul(Block_2D<T> *a, Block_2D<T> *b, Block_2D<T> *c)
  {
    unsigned int col = MATRIX_TILE_WIDTH*blockIdx.x + threadIdx.x;
    unsigned int row = MATRIX_TILE_WIDTH*blockIdx.y + threadIdx.y;
    (*c)[row][col] = 0;
    for (int k = 0 ; k<a->dim_x ; k++ )
    {
      (*c)[row][col] = (*c)[row][col] + (*a)[row][k] * (*b)[k][col];
    }
  }

  template <class T>
  Block_2D<T> matrix_multiply(Block_2D<T> *a, Block_2D<T> *b)
  {
      assert(a->dim_x == b->dim_y);
      Block_2D<T> c(b->dim_x,a->dim_y);
      T *temp = (T*) std::malloc(sizeof(T)*a->dim_y*b->dim_x);
      dim3 dimGrid (a->dim_y/MATRIX_TILE_WIDTH, b->dim_x/MATRIX_TILE_WIDTH, 1);
      dim3 dimBlock(MATRIX_TILE_WIDTH, MATRIX_TILE_WIDTH, 1);
      MatrixMul<<<dimGrid,dimBlock>>>(a->device_pointer,b->device_pointer,c.device_pointer);
      cudaMemcpy(temp,thrust::raw_pointer_cast(c.data()),sizeof(T)*a->dim_y*b->dim_x,cudaMemcpyDeviceToHost);
      c.assign(temp, temp + (a->dim_y*b->dim_x));
      return c;
  }

  template <class T>
  __global__ void MatrixTranspose(Block_2D<T> *a, Block_2D<T> *temp)
  {
    unsigned int col = MATRIX_TILE_WIDTH*blockIdx.x + threadIdx.x;
    unsigned int row = MATRIX_TILE_WIDTH*blockIdx.y + threadIdx.y;
    (*temp)[row][col] = (*a)[col][row];
  }
  template <class T>
  void transpose(Block_2D<T> *a)
  {
    Block_2D<T> temp(a->dim_y,a->dim_x);
    T *temp1 = (T*) malloc(sizeof(T)*a->dim_y*a->dim_x);
    dim3 dimGrid (a->dim_y/MATRIX_TILE_WIDTH, a->dim_x/MATRIX_TILE_WIDTH, 1);
    dim3 dimBlock(MATRIX_TILE_WIDTH, MATRIX_TILE_WIDTH, 1);
    MatrixTranspose<<<dimGrid,dimBlock>>>(a->device_pointer,temp.device_pointer);
    cudaMemcpy(temp1,thrust::raw_pointer_cast(temp.data()),sizeof(T)*a->dim_y*a->dim_x,cudaMemcpyDeviceToHost);
    a->assign(temp1, temp1 + (a->dim_y*a->dim_x));
  }
}
