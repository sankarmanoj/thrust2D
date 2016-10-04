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
  __global__ void convolve_kernel (block_2d<T> &block, block_2d<T> &kernel, int operations_per_block,int total_operations)
  {
    extern __shared__ T shared_memory []  ;
    T * shared_kernel = shared_memory;
    int kernel_size = kernel.dim_x*kernel.dim_x;
    T * shared_reduce_space = (shared_memory+kernel_size);
    int kernel_width = kernel.dim_x;
    int kernel_half_width = (kernel.dim_x-1)/2;
    T element;
    int i = threadIdx.x;
    int operation_within_block = threadIdx.x/kernel_width;
    if(threadIdx.x<kernel_size)
    {
      shared_kernel[i] = kernel[kernel.index_to_int2(i)];
    }
    int position =  (blockIdx.y*gridDim.x+ blockIdx.x)*operations_per_block + operation_within_block;
    if(threadIdx.x/kernel_width>operations_per_block)
    {
      return;
    }
    int2 block_coordinates = block.index_to_int2(position);
    int abs_row_offset = threadIdx.x % kernel_width;
    int row_offset = abs_row_offset-kernel_half_width;
    shared_reduce_space[threadIdx.x]=0;
    for(int i = 0; i< kernel_width; i++)
    {
      element = block[make_int2(block_coordinates.x-kernel_half_width + i,block_coordinates.y+row_offset)];
      shared_reduce_space[threadIdx.x]+=element*shared_kernel[abs_row_offset*kernel_width + i];
    }
    __syncthreads();
    //TODO:Optimze Reduction
    if(threadIdx.x %kernel_width==0)
    {
      for(int i = threadIdx.x+1; i<threadIdx.x + kernel_width; i++)
      {
        shared_reduce_space[threadIdx.x]+=shared_reduce_space[i];
      }
      block[block_coordinates.y][block_coordinates.x]=shared_reduce_space[threadIdx.x];
      if(block[block_coordinates.y][block_coordinates.x]>255)
      {
        block[block_coordinates.y][block_coordinates.x] =255;
      }
      else if(block[block_coordinates.y][block_coordinates.x]<0)
      {
        block[block_coordinates.y][block_coordinates.x]=0;
      }
    }

    return;
  }
  template<class Iterator>
  void convolve(Iterator begin1, Iterator end1, Iterator begin2)
  {
    typedef typename Iterator::value_type T;
    block_2d<T> *input  = begin1.parent_block_host;
    block_2d<T> *kernel = begin2.parent_block_host;
    int num_of_operations = begin1.dim_x * begin1.dim_y;
    // printf("Number Of Operations = %d\n", num_of_operations);
    assert(kernel->dim_x==kernel->dim_y);
    assert(kernel->dim_x%2);
    int kernel_dim = kernel->dim_x;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int block_size, min_grid_size;
    cudaOccupancyMaxPotentialBlockSize( &min_grid_size, &block_size,convolve_kernel<T>, 0, 0);
    // printf("Occupancy block_size = %d, min_grid_size = %d ",block_size,min_grid_size);
    // printf("Device Number: %d\n", 0);
    // printf("  Device name: %s\n", properties.name);
    // printf("  Memory Clock Rate (KHz): %d\n",           properties.memoryClockRate);
    // printf("  Memory Bus Width (bits): %d\n",           properties.memoryBusWidth);
    // printf("  Shared Memory Available: %d\n",           properties.sharedMemPerBlock);
    // printf("  Threads Per Block Available: %d\n",       properties.maxThreadsPerBlock);
    // int shared_memory = properties.sharedMemPerBlock;
    // int maxOperationsInShared = ((shared_memory/(2*sizeof(T)))-(kernel_dim*kernel_dim))/kernel_dim;
    int max_operations_by_thread = properties.maxThreadsPerBlock/kernel_dim;
    int operations = max_operations_by_thread;
    printf("  Max Operations = %d, Operations = %d\n", max_operations_by_thread,operations);
    // int operations = min(max_operations_by_thread,maxOperationsInShared);

    int blocks = ceil(((float)num_of_operations)/operations);
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
    printf(" Blocks = %d,%d \n",xblocks,yblocks);
    printf("Shared Memory Allocated = %d \n",(kernel->dim_y*kernel->dim_x+ operations*kernel_dim)*sizeof(T));
    printf("Actual Block Size = %d, Grid Size = %d \n",operations*kernel_dim,xblocks*yblocks);
    convolve_kernel<<<dim3(xblocks,yblocks),operations*kernel_dim,(kernel->dim_y*kernel->dim_x+operations*kernel_dim)*sizeof(T)>>>(*(input->device_pointer),*(kernel->device_pointer),operations,num_of_operations);
    cudaCheckError();
  }

  template<typename T, class Func>
  __global__ void for_each_kernel (window_iterator<T> *input, int operations_per_block,int total_operations, int shared_block_dim_x , int shared_block_dim_y ,Func f)
  {
    extern __shared__ T shared_memory [];
    int abs_position = (blockIdx.y*gridDim.x + blockIdx.x)*operations_per_block + threadIdx.x;
    // int windowSize = input->window_dim_x*(input->window_dim_y);
    if(abs_position>=total_operations||threadIdx.x >=operations_per_block)
    return;
    window_2d<T> current_window = (*input)[abs_position];
    int ind_window_size = min(input->stride_y,input->window_dim_y)*min(input->stride_x,input->window_dim_x);
    int start_x = (threadIdx.x%input->windows_along_x)*input->window_dim_x;
    int start_y = (threadIdx.x/input->windows_along_x)*input->window_dim_y;

    window_2d<T> shared_window(shared_memory,start_x,start_y,input->window_dim_x,input->window_dim_y,shared_block_dim_x,shared_block_dim_y);
    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        shared_window[j][i]=current_window[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",current_window[j][i],i,j,current_window.start_x,current_window.start_y);
      }
    }

    f(shared_window);

    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        current_window[j][i]=shared_window[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",current_window[j][i],i,j,current_window.start_x,current_window.start_y);
      }
    }
  }

  template <class Iterator, class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f)
  {
    typedef typename Iterator::base_value_type T;
    int num_of_operations = end1-begin1;
    int num_windows = end1 - begin1;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int shared_memory_size = properties.sharedMemPerBlock;
    int size_single_win_row;
    int shared_block_dim_x =0;
    if(begin1.stride_x<=begin1.window_dim_x)
    {
      size_single_win_row = sizeof(T)*begin1.block_dim_x*begin1.window_dim_y;
      shared_block_dim_x = begin1.block_dim_x;
    }
    else
    {
      shared_block_dim_x = begin1.windows_along_x*begin1.window_dim_x;
      size_single_win_row = sizeof(T)*begin1.windows_along_x*begin1.window_dim_x*begin1.window_dim_y;
    }
    int rows_per_block_by_memory;
    int operations_per_block_by_memory;
    int rows_per_block,data_rows_per_block;
    int operations_per_block;
    rows_per_block_by_memory = shared_memory_size/size_single_win_row;
    operations_per_block_by_memory = (rows_per_block_by_memory) * begin1.windows_along_x;
    rows_per_block = min(rows_per_block_by_memory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
    Iterator * device_begin_1;
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    if(rows_per_block)
    {
      if(begin1.stride_y<=begin1.window_dim_y)
      {
        data_rows_per_block = (rows_per_block-begin1.window_dim_y+1);
        operations_per_block = min(operations_per_block_by_memory,properties.maxThreadsPerBlock);
      }
      else
      {
        data_rows_per_block = (rows_per_block-1)*begin1.stride_y + begin1.window_dim_y;
        operations_per_block = min(operations_per_block_by_memory,properties.maxThreadsPerBlock);
      }
    int blocks = ceil(((float)num_of_operations)/operations_per_block);
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
    printf("First route\n");
    printf("Number Of Total Windows Created = %d \n",num_windows );
    printf("Size of T = %d, Size of A Single Row of Windows = %d\n",sizeof(T),size_single_win_row);
    printf("Windows Along X,Y = %d,%d \n",begin1.windows_along_x,begin1.windows_along_y);
    printf("Total Operations = %d,Operations Per Block = %d, OPB By Memory = %d\n",num_of_operations,operations_per_block,operations_per_block_by_memory);
    printf("\n Config = (%d,%d)x%d SharedMem=%d",xblocks,yblocks,operations_per_block,shared_memory_size);
    #endif
    assert((size_single_win_row)<shared_memory_size);
    assert(rows_per_block_by_memory);

    for_each_kernel<<<dim3(xblocks,yblocks),operations_per_block,shared_memory_size>>>(device_begin_1,operations_per_block,num_of_operations,shared_block_dim_x,data_rows_per_block,f);
    }
    else{
      int blocks_per_row = max(ceil((float)size_single_win_row/shared_memory_size),ceil(((float)begin1.windows_along_x)/properties.maxThreadsPerBlock));
      operations_per_block = ceil(((float)begin1.windows_along_x)/blocks_per_row);
      shared_block_dim_x = ceil(((float)operations_per_block)/shared_block_dim_x);
      int blocks = ceil(((float)num_of_operations)/operations_per_block);
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
      printf("Second Route\n");
      printf("Number Of Total Windows Created = %d \n",num_windows );
      printf("Size of T = %d, Size of A Single Row of Windows = %d\n",sizeof(T),size_single_win_row);
      printf("Windows Along X,Y = %d,%d Shared Block Dim X = %d\n",begin1.windows_along_x,begin1.windows_along_y, shared_block_dim_x);
      printf("Blocks = %d , Xblocks = %d , Yblocks = %d  Blocks Per Row =%d\n",blocks,xblocks,yblocks,blocks_per_row);
      printf("Total Operations = %d,Operations Per Block = %d, OPB By Memory = %d\n",num_of_operations,operations_per_block,operations_per_block_by_memory);
      printf("\n Config = (%d,%d)x%d SharedMem=%d",xblocks,yblocks,operations_per_block,shared_memory_size);
      #endif
      for_each_kernel<<<dim3(xblocks,yblocks),operations_per_block,shared_memory_size>>>(device_begin_1,operations_per_block,num_of_operations,shared_block_dim_x,begin1.window_dim_y,f);


    }
    cudaCheckError();
  }
  template<typename T, class Func>
  __global__ void transform_kernel (window_iterator<T> *input, window_iterator<T> * output, int operations_per_block,int total_operations, int shared_block_dim_x , int shared_block_dim_y ,Func f)
  {
    extern __shared__ T shared_memory [];
    int abs_position = (blockIdx.y*gridDim.x + blockIdx.x)*operations_per_block + threadIdx.x;
    if(abs_position>=total_operations||threadIdx.x >=operations_per_block)
    return;
    window_2d<T> input_window = (*input)[abs_position];
    window_2d<T> output_window =(*output) [abs_position];
    int start_x = (threadIdx.x%input->windows_along_x)*input->window_dim_x;
    int start_y = (threadIdx.x/input->windows_along_x)*input->window_dim_y;

    window_2d<T> shared_input_window(shared_memory,start_x,start_y,input->window_dim_x,input->window_dim_y,2*shared_block_dim_x,shared_block_dim_y);
    window_2d<T> shared_output_window(shared_memory,start_x+shared_block_dim_x,start_y,input->window_dim_x,input->window_dim_y,2*shared_block_dim_x,shared_block_dim_y);
    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        shared_input_window[j][i]=input_window[j][i];
        shared_output_window[j][i]=output_window[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",current_window[j][i],i,j,current_window.start_x,current_window.start_y);
      }
    }

    f(shared_input_window,shared_output_window);

    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        input_window[j][i]=shared_input_window[j][i];
        output_window[j][i]=shared_output_window[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",current_window[j][i],i,j,current_window.start_x,current_window.start_y);
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
    int shared_memory_size = properties.sharedMemPerBlock;
    int size_single_win_row;
    int num_of_operations = end1-begin1;
    int num_windows = end1 - begin1;

    if(begin1.stride_x<=begin1.window_dim_x)
    {
      size_single_win_row = 2*sizeof(T)*begin1.block_dim_x*begin1.window_dim_y;
    }
    else
    {
      size_single_win_row = 2*sizeof(T)*begin1.windows_along_x*begin1.window_dim_x*begin1.window_dim_y;
    }
    int rows_per_block_by_memory;
    int operations_per_block_by_memory;
    int rows_per_block,data_rows_per_block ;
    int operations_per_block;
    rows_per_block_by_memory = shared_memory_size/size_single_win_row;

    if(begin1.stride_y<=begin1.window_dim_y)
    {
      operations_per_block_by_memory = (rows_per_block_by_memory) * begin1.windows_along_x;
      rows_per_block = min(rows_per_block_by_memory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
      data_rows_per_block = (rows_per_block-begin1.window_dim_y+1);
      operations_per_block = min(operations_per_block_by_memory,properties.maxThreadsPerBlock);
    }
    else
    {
      operations_per_block_by_memory = rows_per_block_by_memory*begin1.windows_along_x;
      rows_per_block = min(rows_per_block_by_memory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
      data_rows_per_block = (rows_per_block-1)*begin1.stride_y + begin1.window_dim_y;
      operations_per_block = min(operations_per_block_by_memory,properties.maxThreadsPerBlock);
    }

    int blocks = ceil(((float)num_of_operations)/operations_per_block);
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
    printf("Number Of Total Windows Created = %d \n",num_windows );
    printf("Size of T = %d, Size of A Single Row of Windows = %d\n",sizeof(T),size_single_win_row);
    printf("Windows Along X,Y = %d,%d \n",begin1.windows_along_x,begin1.windows_along_y);
    printf("Blocks = %d , Xblocks = %d , Yblocks = %d  Rows Per Block =%d RPB By Memory= %d \n",blocks,xblocks,yblocks,rows_per_block,rows_per_block_by_memory);
    printf("Total Operations = %d,Operations Per Block = %d, OPB By Memory = %d\n",num_of_operations,operations_per_block,operations_per_block_by_memory);
    printf("\n Config = (%d,%d)x%d SharedMem=%d",xblocks,yblocks,operations_per_block,shared_memory_size);
    #endif
    assert((size_single_win_row)<shared_memory_size);
    assert(rows_per_block_by_memory);
    Iterator * device_begin_1 , *device_begin_2;
    cudaMalloc((void **)&device_begin_2,sizeof(Iterator));
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_2,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    transform_kernel<<<dim3(xblocks,yblocks),operations_per_block,shared_memory_size>>>(device_begin_1,device_begin_2,operations_per_block,num_of_operations,begin1.block_dim_x,data_rows_per_block,f);

    cudaCheckError();
  }
  template<typename T, class Func>
  __global__ void transform_kernel (window_iterator<T> *input,window_iterator<T> *input1, window_iterator<T> * output, int operations_per_block,int total_operations, int shared_block_dim_x , int shared_block_dim_y ,Func f)
  {
    extern __shared__ T shared_memory [];
    int abs_position = (blockIdx.y*gridDim.x + blockIdx.x)*operations_per_block + threadIdx.x;
    if(abs_position>=total_operations||threadIdx.x >=operations_per_block)
    return;
    window_2d<T> input_window = (*input)[abs_position];
    window_2d<T> input_window1 = (*input1)[abs_position];
    window_2d<T> output_window =(*output) [abs_position];
    int start_x = (threadIdx.x%input->windows_along_x)*input->window_dim_x;
    int start_y = (threadIdx.x/input->windows_along_x)*input->window_dim_y;

    window_2d<T> shared_input_window(shared_memory,start_x,start_y,input->window_dim_x,input->window_dim_y,3*shared_block_dim_x,shared_block_dim_y);
    window_2d<T> shared_input_window1(shared_memory,start_x+shared_block_dim_x,start_y,input->window_dim_x,input->window_dim_y,3*shared_block_dim_x,shared_block_dim_y);
    window_2d<T> shared_output_window(shared_memory,start_x+2*shared_block_dim_x,start_y,input->window_dim_x,input->window_dim_y,3*shared_block_dim_x,shared_block_dim_y);
    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        shared_input_window[j][i]=input_window[j][i];
        shared_input_window1[j][i]=input_window1[j][i];
        shared_output_window[j][i]=output_window[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",(float)input_window[j][i],i,j,input_window.start_x,input_window.start_y);
      }
    }

    f(shared_input_window,shared_input_window1,shared_output_window);

    for(int j = 0; j<min(input->stride_y,input->window_dim_y);j++)
    {
      for(int i = 0; i<min(input->stride_x,input->window_dim_x);i++)
      {
        input_window[j][i]=shared_input_window[j][i];
        input_window1[j][i]=shared_input_window1[j][i];
        output_window[j][i]=shared_output_window[j][i];
        // printf("Val = %f i = %d j = %d x = %d y = %d \n",current_window[j][i],i,j,current_window.start_x,current_window.start_y);
      }
    }
  }
  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f)
  {
    typedef typename Iterator::value_type T;

    assert(begin1.block_dim_x == begin2.block_dim_x && begin2.block_dim_x == begin3.block_dim_x);
    assert(begin1.block_dim_y == begin2.block_dim_y && begin2.block_dim_y == begin3.block_dim_y);
    assert(begin1.window_dim_x == begin2.window_dim_x && begin2.window_dim_x == begin3.window_dim_x);
    assert(begin1.window_dim_y == begin2.window_dim_y && begin2.window_dim_y == begin3.window_dim_y);
    assert(begin1.stride_x == begin2.stride_x && begin2.stride_x == begin3.stride_x);
    assert(begin1.stride_y == begin2.stride_y && begin2.stride_y == begin3.stride_y);
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int shared_memory_size = properties.sharedMemPerBlock;
    int size_single_win_row;
    int num_of_operations = end1 - begin1;
    int num_windows = end1 - begin1;

    if(begin1.stride_x<=begin1.window_dim_x)
    {
      size_single_win_row = 3*sizeof(T)*begin1.block_dim_x*begin1.window_dim_y;
    }
    else
    {
      size_single_win_row = 3*sizeof(T)*begin1.windows_along_x*begin1.window_dim_x*begin1.window_dim_y;
    }
    int rows_per_block_by_memory;
    int operations_per_block_by_memory;
    int rows_per_block,data_rows_per_block ;
    int operations_per_block;
    rows_per_block_by_memory = shared_memory_size/size_single_win_row;

    if(begin1.stride_y<=begin1.window_dim_y)
    {
      operations_per_block_by_memory = (rows_per_block_by_memory) * begin1.windows_along_x;
      rows_per_block = min(rows_per_block_by_memory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
      data_rows_per_block = (rows_per_block-begin1.window_dim_y+1);
      operations_per_block = min(operations_per_block_by_memory,properties.maxThreadsPerBlock);
    }
    else
    {
      operations_per_block_by_memory = rows_per_block_by_memory*begin1.windows_along_x;
      rows_per_block = min(rows_per_block_by_memory,(properties.maxThreadsPerBlock/begin1.windows_along_x));
      data_rows_per_block = (rows_per_block-1)*begin1.stride_y + begin1.window_dim_y;
      operations_per_block = min(operations_per_block_by_memory,properties.maxThreadsPerBlock);
    }

    int blocks = ceil(((float)num_of_operations)/operations_per_block);
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
    printf("Number Of Total Windows Created = %d \n",num_windows );
    printf("Size of T = %d, Size of A Single Row of Windows = %d\n",sizeof(T),size_single_win_row);
    printf("Windows Along X,Y = %d,%d \n",begin1.windows_along_x,begin1.windows_along_y);
    printf("Blocks = %d , Xblocks = %d , Yblocks = %d  Rows Per Block =%d RPB By Memory= %d \n",blocks,xblocks,yblocks,rows_per_block,rows_per_block_by_memory);
    printf("Total Operations = %d,Operations Per Block = %d, OPB By Memory = %d\n",num_of_operations,operations_per_block,operations_per_block_by_memory);
    printf("\n Config = (%d,%d)x%d SharedMem=%d",xblocks,yblocks,operations_per_block,shared_memory_size);
    #endif
    assert((size_single_win_row)<shared_memory_size);
    assert(rows_per_block_by_memory);
    Iterator * device_begin_1 , *device_begin_2, *device_begin_3;
    cudaMalloc((void **)&device_begin_3,sizeof(Iterator));
    cudaMalloc((void **)&device_begin_2,sizeof(Iterator));
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_3,&begin3,sizeof(Iterator),cudaMemcpyHostToDevice);  //cudaMemcpy(device_begin_3,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    cudaMemcpy(device_begin_2,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    transform_kernel<<<dim3(xblocks,yblocks),operations_per_block,shared_memory_size>>>(device_begin_1,device_begin_2,device_begin_3,operations_per_block,num_of_operations,begin1.block_dim_x,data_rows_per_block,f);
    cudaCheckError();
  }

  template <class T>
  __global__ void MatrixMul(block_2d<T> *a, block_2d<T> *b, block_2d<T> *c)
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
  block_2d<T> matrix_multiply(block_2d<T> *a, block_2d<T> *b)
  {
    assert(a->dim_x == b->dim_y);
    block_2d<T> c(b->dim_x,a->dim_y);
    T *temp = (T*) std::malloc(sizeof(T)*a->dim_y*b->dim_x);
    dim3 dimGrid (a->dim_y/MATRIX_TILE_WIDTH, b->dim_x/MATRIX_TILE_WIDTH, 1);
    dim3 dimBlock(MATRIX_TILE_WIDTH, MATRIX_TILE_WIDTH, 1);
    MatrixMul<<<dimGrid,dimBlock>>>(a->device_pointer,b->device_pointer,c.device_pointer);
    cudaMemcpy(temp,thrust::raw_pointer_cast(c.data()),sizeof(T)*a->dim_y*b->dim_x,cudaMemcpyDeviceToHost);
    c.assign(temp, temp + (a->dim_y*b->dim_x));
    return c;
  }

  template <class T>
  __global__ void MatrixTranspose(block_2d<T> *a, block_2d<T> *temp)
  {
    unsigned int col = MATRIX_TILE_WIDTH*blockIdx.x + threadIdx.x;
    unsigned int row = MATRIX_TILE_WIDTH*blockIdx.y + threadIdx.y;
    (*temp)[row][col] = (*a)[col][row];
  }
  template <class T>
  void transpose(block_2d<T> *a)
  {
    block_2d<T> temp(a->dim_y,a->dim_x);
    T *temp1 = (T*) std::malloc(sizeof(T)*a->dim_y*a->dim_x);
    dim3 dimGrid (a->dim_y/MATRIX_TILE_WIDTH, a->dim_x/MATRIX_TILE_WIDTH, 1);
    dim3 dimBlock(MATRIX_TILE_WIDTH, MATRIX_TILE_WIDTH, 1);
    MatrixTranspose<<<dimGrid,dimBlock>>>(a->device_pointer,temp.device_pointer);
    cudaMemcpy(temp1,thrust::raw_pointer_cast(temp.data()),sizeof(T)*a->dim_y*a->dim_x,cudaMemcpyDeviceToHost);
    // a->assign(temp1, temp1 + (a->dim_y*a->dim_x));
    (*a) = temp;
  }
}
