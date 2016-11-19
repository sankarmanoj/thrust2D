#pragma once
#include <thrust/system/cuda/window_transform.h>
namespace thrust
{
  int iDivUp(int a, int b)
  {
      return (a % b != 0) ? (a / b + 1) : (a / b);
  }
  template<typename T, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_kernel (window_iterator<T> *input, window_iterator<T> * output, warp_launcher_config mConfiguration, Func f)
  {
    extern __shared__ T shared_memory [];
    shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x]=(*(input->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
    if(threadIdx.y>=mConfiguration.warp_size-mConfiguration.padding)
    {
      shared_memory[(threadIdx.y+mConfiguration.padding)*mConfiguration.shared_size_x+threadIdx.x]=(*(input->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + (threadIdx.y+mConfiguration.padding))];

    }
    if(threadIdx.x>=mConfiguration.warp_size-mConfiguration.padding)
    {
      shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x+mConfiguration.padding]=(*(input->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.padding,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];

    }
    if((threadIdx.x%mConfiguration.stride_x)||(threadIdx.y%mConfiguration.stride_y))
      return;
    __syncthreads();
    window_2d<T> shared_window(input->b,shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,input->window_dim_x,input->window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding);
    window_2d<T> output_window(output->b,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,output->window_dim_x,output->window_dim_y);
    f(shared_window,output_window);
  }

  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f)
  {
    typedef typename Iterator::base_value_type T;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    warp_launcher_config mConfiguration;
    int size_along_x = (properties.warpSize-1)*begin1.stride_x + begin1.window_dim_x;
    int size_along_y = (properties.warpSize-1)*begin1.stride_y + begin1.window_dim_y;
    mConfiguration.size_along_x = size_along_x;
    mConfiguration.size_along_y = size_along_y;
    mConfiguration.stride_x = begin1.stride_x;
    mConfiguration.stride_y = begin1.stride_y;
    mConfiguration.warp_size = properties.warpSize;
    mConfiguration.padding = begin1.window_dim_x - begin1.stride_x;
    mConfiguration.shared_size_x = mConfiguration.warp_size+mConfiguration.padding;
    // assert(!(begin1.block_dim_y%mConfiguration.warp_size));
    // assert(!(begin1.block_dim_x%mConfiguration.warp_size));
    assert(begin1.window_dim_x>=begin1.stride_x);
    assert(begin1.window_dim_y>=begin1.stride_y);
    assert(begin1.block_dim_x == begin2.block_dim_x);
    assert(begin1.block_dim_y == begin2.block_dim_y);
    assert(begin1.window_dim_x == begin2.window_dim_x);
    assert(begin1.window_dim_y == begin2.window_dim_y);
    assert(begin1.stride_x == begin2.stride_x);
    assert(begin1.stride_y == begin2.stride_y);
    assert(size_along_y*size_along_x*sizeof(T)<properties.sharedMemPerBlock);

    Iterator * device_begin_1;
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    Iterator * device_begin_2;
    cudaMalloc((void **)&device_begin_2, sizeof(Iterator));
    cudaMemcpy(device_begin_2,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    transform_kernel<<<dim3(begin1.block_dim_x/mConfiguration.warp_size,begin1.block_dim_y/mConfiguration.warp_size,1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1),(size_along_y+mConfiguration.padding)*(mConfiguration.padding+size_along_x)*sizeof(T)>>>(device_begin_1,device_begin_2,mConfiguration,f);
  }
  template<typename T, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_texture_kernel (cudaTextureObject_t texref, window_iterator<T> * output, warp_launcher_config mConfiguration, Func f)
  {

    window_2d<T> shared_window(texref,output->stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),output->stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),output->window_dim_x,output->window_dim_y);
    window_2d<T> output_window(output->b,output->stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),output->stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),output->window_dim_x,output->window_dim_y);
    f(shared_window,output_window);
  }

  template <class Iterator, class Func>
  void transform_texture(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f)
  {
    typedef typename Iterator::base_value_type T;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    warp_launcher_config mConfiguration;
    int size_along_x = (properties.warpSize-1)*begin1.stride_x + begin1.window_dim_x;
    int size_along_y = (properties.warpSize-1)*begin1.stride_y + begin1.window_dim_y;
    mConfiguration.size_along_x = size_along_x;
    mConfiguration.size_along_y = size_along_y;
    mConfiguration.stride_x = begin1.stride_x;
    mConfiguration.stride_y = begin1.stride_y;
    mConfiguration.warp_size = properties.warpSize;
    mConfiguration.padding = begin1.window_dim_x - begin1.stride_x;
    mConfiguration.shared_size_x = mConfiguration.warp_size+mConfiguration.padding;
    // assert(!(begin1.block_dim_y%mConfiguration.warp_size));
    // assert(!(begin1.block_dim_x%mConfiguration.warp_size));
    assert(begin1.window_dim_x>=begin1.stride_x);
    assert(begin1.window_dim_y>=begin1.stride_y);
    assert(begin1.block_dim_x == begin2.block_dim_x);
    assert(begin1.block_dim_y == begin2.block_dim_y);
    assert(begin1.window_dim_x == begin2.window_dim_x);
    assert(begin1.window_dim_y == begin2.window_dim_y);
    assert(begin1.stride_x == begin2.stride_x);
    assert(begin1.stride_y == begin2.stride_y);
    assert(size_along_y*size_along_x*sizeof(T)<properties.sharedMemPerBlock);
    //allocate pitched 2d memory
    T * aligned_device_memory;
    size_t pitch;
    cudaMallocPitch(&aligned_device_memory,&pitch,begin1.block_dim_x*sizeof(T),begin1.block_dim_y);
    printf("Pitch = %d\n",pitch);
    cudaMemcpy2D(aligned_device_memory,pitch,begin1.data_pointer,begin1.block_dim_x*sizeof(T),begin1.block_dim_x*sizeof(T),begin1.block_dim_y,cudaMemcpyDeviceToDevice);

    //Create Resource Descriptor
    cudaResourceDesc resDesc;
    memset(&resDesc, 0, sizeof(resDesc));
    resDesc.resType = cudaResourceTypePitch2D;
    resDesc.res.pitch2D.desc = cudaCreateChannelDesc<T>();
    resDesc.res.pitch2D.pitchInBytes=pitch;
    resDesc.res.pitch2D.height = begin1.block_dim_y;
    resDesc.res.pitch2D.width=begin1.block_dim_x;
    resDesc.res.pitch2D.devPtr = aligned_device_memory;
    //Create Texture Descriptor
    cudaTextureDesc texDesc;
    memset(&texDesc, 0, sizeof(texDesc));
    //Texture Object Creation
    cudaTextureObject_t texref;
    cudaCreateTextureObject(&texref, &resDesc, &texDesc, NULL);
    Iterator * device_begin_1;
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    Iterator * device_begin_2;
    cudaMalloc((void **)&device_begin_2, sizeof(Iterator));
    cudaMemcpy(device_begin_2,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    transform_texture_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1)>>>(texref,device_begin_2,mConfiguration,f);
  }
  template<typename T, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void for_each_kernel (window_iterator<T> *input, warp_launcher_config mConfiguration, Func f)
  {
    extern __shared__ T shared_memory [];
    shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x]=(*(input->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
    if(threadIdx.y>=mConfiguration.warp_size-mConfiguration.padding)
    {
      shared_memory[(threadIdx.y+mConfiguration.padding)*mConfiguration.shared_size_x+threadIdx.x]=(*(input->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + (threadIdx.y+mConfiguration.padding))];

    }
    if(threadIdx.x>=mConfiguration.warp_size-mConfiguration.padding)
    {
      shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x+mConfiguration.padding]=(*(input->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.padding,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];

    }
    __syncthreads();
    if((threadIdx.x%mConfiguration.stride_x)||(threadIdx.y%mConfiguration.stride_y))
    {

    }
    else
    {
      window_2d<T> shared_window(input->b,shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,input->window_dim_x,input->window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding);
      f(shared_window);
    }
    __syncthreads();
    (*(input->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)]=shared_memory[threadIdx.y*mConfiguration.warp_size+threadIdx.x];
  }

  template <class Iterator, class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f)
  {
    typedef typename Iterator::base_value_type T;
    warp_launcher_config mConfiguration;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int size_along_x = (properties.warpSize-1)*begin1.stride_x + begin1.window_dim_x;
    int size_along_y = (properties.warpSize-1)*begin1.stride_y + begin1.window_dim_y;
    mConfiguration.stride_x = begin1.stride_x;
    mConfiguration.stride_y = begin1.stride_y;
    mConfiguration.size_along_x = size_along_x;
    mConfiguration.size_along_y = size_along_y;
    mConfiguration.warp_size = properties.warpSize;
    mConfiguration.padding = begin1.window_dim_x - begin1.stride_x;
    mConfiguration.shared_size_x = mConfiguration.warp_size+mConfiguration.padding;
    // assert(!(begin1.block_dim_y%mConfiguration.warp_size));
    // assert(!(begin1.block_dim_x%mConfiguration.warp_size));
    assert(begin1.window_dim_x>=begin1.stride_x);
    assert(begin1.window_dim_y>=begin1.stride_y);
    // int blocks_along_x = begin1.windows_along_x/mConfiguration.warp_size;
    // int blocks_along_y = begin1.windows_along_y/mConfiguration.warp_size;
    assert(size_along_y*size_along_x*sizeof(T)<properties.sharedMemPerBlock);

    Iterator * device_begin_1;
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    for_each_kernel<<<dim3(begin1.block_dim_x/mConfiguration.warp_size,begin1.block_dim_y/mConfiguration.warp_size,1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1),(size_along_y+mConfiguration.padding)*(mConfiguration.padding+size_along_x)*sizeof(T)>>>(device_begin_1,mConfiguration,f);
  }
}
