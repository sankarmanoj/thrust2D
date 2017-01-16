#pragma once
#include <thrust/system/cuda/window_transform.h>
namespace thrust
{
  int iDivUp(int a, int b)
  {
      return (a % b != 0) ? (a / b + 1) : (a / b);
  }

  //Binary Shared Transform
  template<typename T, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void binary_transform_kernel (window_iterator<T> *input1,window_iterator<T> * input2, window_iterator<T> * output, warp_launcher_config mConfiguration, Func f)
  {
    extern __shared__ T shared_memory [];

    shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x]=(*(input1->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
    shared_memory[mConfiguration.shared_total_size + threadIdx.y*mConfiguration.shared_size_x+threadIdx.x]=(*(input2->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
    if(threadIdx.y>=mConfiguration.warp_size-mConfiguration.padding)
    {
      shared_memory[(threadIdx.y+mConfiguration.padding)*mConfiguration.shared_size_x+threadIdx.x]=(*(input1->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + (threadIdx.y+mConfiguration.padding))];
      shared_memory[mConfiguration.shared_total_size + (threadIdx.y+mConfiguration.padding)*mConfiguration.shared_size_x+threadIdx.x]=(*(input2->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + (threadIdx.y+mConfiguration.padding))];

    }
    if(threadIdx.x>=mConfiguration.warp_size-mConfiguration.padding)
    {
      shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x+mConfiguration.padding]=(*(input1->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.padding,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
      shared_memory[mConfiguration.shared_total_size + threadIdx.y*mConfiguration.shared_size_x+threadIdx.x+mConfiguration.padding]=(*(input2->b))[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.padding,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];

    }

    if((threadIdx.x%mConfiguration.stride_x)||(threadIdx.y%mConfiguration.stride_y))
      return;
    if(mConfiguration.block_dim_x<=(mConfiguration.stride_x/2)+mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x))
      return;
    __syncthreads();
    window_2d<T> shared_window1(input1->b,shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,input1->window_dim_x,input1->window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding,input1->pitch);
    window_2d<T> shared_window2(input2->b,mConfiguration.shared_total_size + shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,input2->window_dim_x,input2->window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding,input2->pitch);
    window_2d<T> output_window(output->b,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,output->window_dim_x,output->window_dim_y);
    f(shared_window1,shared_window2,output_window);
  }

  template <class Iterator, class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f)
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
    mConfiguration.block_dim_x = begin1.block_dim_x;
    mConfiguration.block_dim_y = begin1.block_dim_y;
    mConfiguration.window_dim_x = begin1.window_dim_x;
    mConfiguration.window_dim_y = begin1.window_dim_y;
    mConfiguration.padding = begin1.window_dim_x - begin1.stride_x;
    mConfiguration.shared_size_x = mConfiguration.warp_size+mConfiguration.padding;
    mConfiguration.shared_total_size = mConfiguration.shared_size_x*mConfiguration.shared_size_x ;
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
    Iterator * device_begin_3;
    cudaMalloc((void **)&device_begin_3, sizeof(Iterator));
    cudaMemcpy(device_begin_3,&begin3,sizeof(Iterator),cudaMemcpyHostToDevice);
    binary_transform_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1),2*mConfiguration.shared_total_size*sizeof(T)>>>(device_begin_1,device_begin_2,device_begin_3,mConfiguration,f);
  }

  //Unary Shared Transform
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
    if(mConfiguration.block_dim_x<=(mConfiguration.stride_x/2)+mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x))
      return;
    __syncthreads();
    window_2d<T> shared_window(input->b,shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,input->window_dim_x,input->window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding,input->pitch);
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
    mConfiguration.block_dim_x = begin1.block_dim_x;
    mConfiguration.block_dim_y = begin1.block_dim_y;
    mConfiguration.window_dim_x = begin1.window_dim_x;
    mConfiguration.window_dim_y = begin1.window_dim_y;
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
    transform_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1),(size_along_y+mConfiguration.padding)*(mConfiguration.padding+size_along_x)*sizeof(T)>>>(device_begin_1,device_begin_2,mConfiguration,f);
  }
  //Binary Texture Transform
  template<typename T, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_texture_kernel (cudaTextureObject_t texref1,cudaTextureObject_t texref2, window_iterator<T> * output, warp_launcher_config mConfiguration, Func f)
  {
    if(mConfiguration.block_dim_x<=(mConfiguration.stride_x/2)+mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x))
      return;
    window_2d<T> shared_window1(texref1,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),output->stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),output->window_dim_x,output->window_dim_y);
    window_2d<T> shared_window2(texref2,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),output->stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),output->window_dim_x,output->window_dim_y);
    window_2d<T> output_window(output->b,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),output->stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),output->window_dim_x,output->window_dim_y);
    f(shared_window1,shared_window2,output_window);
  }


  template <class Iterator, class Func>
  void transform(cuda::texture_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f)
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
    mConfiguration.block_dim_x = begin1.block_dim_x;
    mConfiguration.block_dim_y = begin1.block_dim_y;
    mConfiguration.window_dim_x = begin1.window_dim_x;
    mConfiguration.window_dim_y = begin1.window_dim_y;
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

    assert(begin1.block_dim_x == begin3.block_dim_x);
    assert(begin1.block_dim_y == begin3.block_dim_y);
    assert(begin1.window_dim_x == begin3.window_dim_x);
    assert(begin1.window_dim_y == begin3.window_dim_y);
    assert(begin1.stride_x == begin3.stride_x);
    assert(begin1.stride_y == begin3.stride_y);

    assert(size_along_y*size_along_x*sizeof(T)<properties.sharedMemPerBlock);

    //Create Resource Descriptor
    cudaResourceDesc resDesc1,resDesc2;

    memset(&resDesc1, 0, sizeof(resDesc1));
    resDesc1.resType = cudaResourceTypePitch2D;
    resDesc1.res.pitch2D.desc = cudaCreateChannelDesc<T>();
    resDesc1.res.pitch2D.pitchInBytes=begin1.pitch;
    resDesc1.res.pitch2D.height = begin1.block_dim_y;
    resDesc1.res.pitch2D.width=begin1.block_dim_x;
    resDesc1.res.pitch2D.devPtr = begin1.data_pointer;


    memset(&resDesc2, 0, sizeof(resDesc2));
    resDesc2.resType = cudaResourceTypePitch2D;
    resDesc2.res.pitch2D.desc = cudaCreateChannelDesc<T>();
    resDesc2.res.pitch2D.pitchInBytes=begin2.pitch;
    resDesc2.res.pitch2D.height = begin2.block_dim_y;
    resDesc2.res.pitch2D.width=begin2.block_dim_x;
    resDesc2.res.pitch2D.devPtr = begin2.data_pointer;

    cudaTextureDesc texDesc1;
    memset(&texDesc1, 0, sizeof(texDesc1));
    cudaTextureDesc texDesc2;
    memset(&texDesc2, 0, sizeof(texDesc2));
    //Texture Object Creation
    cudaTextureObject_t texref1,texref2;
    cudaCreateTextureObject(&texref1, &resDesc1, &texDesc1, NULL);
    cudaCreateTextureObject(&texref2, &resDesc2, &texDesc2, NULL);

    Iterator * device_begin_3;
    cudaMalloc((void **)&device_begin_3, sizeof(Iterator));
    cudaMemcpy(device_begin_3,&begin3,sizeof(Iterator),cudaMemcpyHostToDevice);
    transform_texture_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1)>>>(texref1,texref2,device_begin_3,mConfiguration,f);
  }
  //Unary Texture Transform
  template<typename T, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_texture_kernel (cudaTextureObject_t texref, window_iterator<T> * output, warp_launcher_config mConfiguration, Func f)
  {

    if(mConfiguration.block_dim_x<=(mConfiguration.stride_x/2)+mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x))
      return;
    window_2d<T> shared_window(texref,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),output->stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),output->window_dim_x,output->window_dim_y);
    window_2d<T> output_window(output->b,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),output->stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),output->window_dim_x,output->window_dim_y);
    f(shared_window,output_window);

  }


  template <class Iterator, class Func>
  void transform(cuda::texture_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f)
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
    mConfiguration.block_dim_x = begin1.block_dim_x;
    mConfiguration.block_dim_y = begin1.block_dim_y;
    mConfiguration.window_dim_x = begin1.window_dim_x;
    mConfiguration.window_dim_y = begin1.window_dim_y;
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

    //Create Resource Descriptor
    cudaResourceDesc resDesc;
    memset(&resDesc, 0, sizeof(resDesc));
    resDesc.resType = cudaResourceTypePitch2D;
    resDesc.res.pitch2D.desc = cudaCreateChannelDesc<T>();
    resDesc.res.pitch2D.pitchInBytes=begin1.pitch;
    resDesc.res.pitch2D.height = begin1.block_dim_y;
    resDesc.res.pitch2D.width=begin1.block_dim_x;
    resDesc.res.pitch2D.devPtr = begin1.data_pointer;
    //Create Texture Descriptor
    cudaTextureDesc texDesc;
    memset(&texDesc, 0, sizeof(texDesc));
    //Texture Object Creation
    cudaTextureObject_t texref;
    cudaCreateTextureObject(&texref, &resDesc, &texDesc, NULL);
    Iterator * device_begin_2;
    cudaMalloc((void **)&device_begin_2, sizeof(Iterator));
    cudaMemcpy(device_begin_2,&begin2,sizeof(Iterator),cudaMemcpyHostToDevice);
    transform_texture_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1)>>>(texref,device_begin_2,mConfiguration,f);
  }

}
