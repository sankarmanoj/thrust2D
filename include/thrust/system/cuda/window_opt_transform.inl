#pragma once
#include <thrust/system/cuda/window_transform.h>
namespace thrust
{
  template<typename T, class Func>
  __global__
  __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_kernel (window_iterator<T> *input, window_iterator<T> * output, warp_launcher_config mConfiguration, Func f)
  {
    extern __shared__ T shared_memory [];
    shared_memory[threadIdx.y*32+threadIdx.x]=(*(input->b))[make_int2(blockIdx.x*32 + threadIdx.x,blockIdx.y*32 + threadIdx.y)];
    if(threadIdx.x%input->stride_x&&threadIdx.y%input->stride_y)
    {
        window_2d<T> shared_window(shared_memory,threadIdx.x,threadIdx.y,input->window_dim_x,input->window_dim_y,32,32);
        window_2d<T> output_window(output->b,blockIdx.x*32 + threadIdx.x,blockIdx.y*32 + threadIdx.y,output->window_dim_x,output->window_dim_y);
        f(shared_window,output_window);
    }
  }

  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f)
  {
    typedef typename Iterator::base_value_type T;
    printf("%d x %d ",begin1.block_dim_x,begin1.block_dim_y);
    assert(!(begin1.block_dim_y%32));
    assert(!(begin1.block_dim_x%32));
    assert(begin1.window_dim_x>=begin1.stride_x);
    assert(begin1.window_dim_y>=begin1.stride_y);
    int blocks_along_x = begin1.windows_along_x/32;
    int blocks_along_y = begin1.windows_along_y/32;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    int size_along_x = 31*begin1.stride_x + begin1.window_dim_x;
    int size_along_y = 31*begin1.stride_y + begin1.window_dim_y;
    assert(size_along_y*size_along_x*sizeof(T)<properties.sharedMemPerBlock);
    warp_launcher_config mConfiguration;
    mConfiguration.size_along_x = size_along_x;
    mConfiguration.size_along_y = size_along_y;
    Iterator * device_begin_1;
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    Iterator * device_begin_2;
    cudaMalloc((void **)&device_begin_2, sizeof(Iterator));
    cudaMemcpy(device_begin_2,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    transform_kernel<<<dim3(begin1.block_dim_x/32,begin1.block_dim_y/32,1),dim3(32,32,1),size_along_y*size_along_x*sizeof(T)>>>(device_begin_1,device_begin_2,mConfiguration,f);
  }
}
