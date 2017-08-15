#pragma once
#include <thrust/system/cuda/window_transform.h>
namespace thrust
{



  //Binary Shared Transform
  template<typename T1, typename T2, typename T3, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void binary_transform_kernel (block_2d<T1> input1,block_2d<T2>  input2, T3 * output, int pitch3,warp_launcher_config mConfiguration, Func f)
  {
    extern __shared__ T1 shared_memory [];
    T2* shared_memory_2 = (T2 * )&(shared_memory[mConfiguration.shared_total_size]);
    shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x]=input1[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
    shared_memory_2[ threadIdx.y*mConfiguration.shared_size_x+threadIdx.x]=input2[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
    if((blockIdx.x*mConfiguration.warp_size + threadIdx.x)%mConfiguration.stride_x||(blockIdx.y*mConfiguration.warp_size + threadIdx.y)%mConfiguration.stride_y)
      return;
    if(threadIdx.x>=mConfiguration.warp_size||threadIdx.y>=mConfiguration.warp_size)
      return;
    if((mConfiguration.block_dim_x<blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.window_dim_x)||(mConfiguration.block_dim_y<blockIdx.y*mConfiguration.warp_size + threadIdx.y+mConfiguration.window_dim_y))
      return;
    __syncthreads();
    window_2d<T1> shared_window1(shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,mConfiguration.window_dim_x,mConfiguration.window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding,input1.pitch);
    window_2d<T2> shared_window2(shared_memory_2,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,mConfiguration.window_dim_x,mConfiguration.window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding,input2.pitch);
    window_2d<T3> output_window(output,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,mConfiguration.window_dim_x,mConfiguration.window_dim_y,pitch3);
    f(shared_window1,shared_window2,output_window);
  }

  template <class Iterator1, class Iterator2, class Iterator3 , class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1, Iterator2 begin2, Iterator3 begin3, Func f)
  {
    typedef typename Iterator1::base_value_type T1;
    typedef typename Iterator2::base_value_type T2;
    static cudaDeviceProp properties;
    if (properties.maxThreadsPerBlock == 0)
      cudaGetDeviceProperties(&properties,0);
    warp_launcher_config mConfiguration;
    int size_along_x = (properties.warpSize-1)*begin1.stride_x + begin1.window_dim_x;
    int size_along_y = (properties.warpSize-1)*begin1.stride_y + begin1.window_dim_y;
    mConfiguration.size_along_x = size_along_x;
    mConfiguration.size_along_y = size_along_y;
    mConfiguration.stride_x = begin1.stride_x;
    mConfiguration.stride_y = begin1.stride_y;
    mConfiguration.block_dim_x = begin1.block_dim_x;
    mConfiguration.block_dim_y = begin1.block_dim_y;
    mConfiguration.window_dim_x = begin1.window_dim_x;
    mConfiguration.window_dim_y = begin1.window_dim_y;
    mConfiguration.padding = begin1.window_dim_x - begin1.stride_x;
    mConfiguration.warp_size = properties.warpSize-mConfiguration.padding;
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
    assert(size_along_y*size_along_x*(sizeof(T1)+sizeof(T2))<properties.sharedMemPerBlock);
    binary_transform_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1),mConfiguration.shared_total_size*(sizeof(T1)+sizeof(T2))>>>(*begin1.h_b,*begin2.h_b,begin3.data_pointer,begin3.pitch,mConfiguration,f);
  }

  //Unary Shared Transform
  template<typename T1, typename T2 , class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_kernel (block_2d<T1> input,int pitch1, T2* output,int pitch2, warp_launcher_config mConfiguration, Func f)
  {
    extern __shared__ T1 shared_memory [];
    shared_memory[threadIdx.y*mConfiguration.shared_size_x+threadIdx.x]=(input)[make_int2(blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y)];
    if((blockIdx.x*mConfiguration.warp_size + threadIdx.x)%mConfiguration.stride_x||(blockIdx.y*mConfiguration.warp_size + threadIdx.y)%mConfiguration.stride_y)
      return;
    if(threadIdx.x>=mConfiguration.warp_size||threadIdx.y>=mConfiguration.warp_size)
      return;
    if((mConfiguration.block_dim_x<blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.window_dim_x)||(mConfiguration.block_dim_y<blockIdx.y*mConfiguration.warp_size + threadIdx.y+mConfiguration.window_dim_y))
      return;
    __syncthreads();
    window_2d<T1> shared_window(shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,mConfiguration.window_dim_x,mConfiguration.window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding,pitch1);
    window_2d<T2> output_window(output,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,mConfiguration.window_dim_x,mConfiguration.window_dim_y,pitch2);
    f(shared_window,output_window);
  }

  template <class Iterator1, class Iterator2, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1, Iterator2 begin2, Func f)
  {
    typedef typename Iterator1::base_value_type T1;
    typedef typename Iterator2::base_value_type T2;
    static cudaDeviceProp properties;
    if (properties.maxThreadsPerBlock == 0)
      cudaGetDeviceProperties(&properties,0);
    warp_launcher_config mConfiguration;
    int size_along_x = (properties.warpSize-1)*begin1.stride_x + begin1.window_dim_x;
    int size_along_y = (properties.warpSize-1)*begin1.stride_y + begin1.window_dim_y;
    mConfiguration.size_along_x = size_along_x;
    mConfiguration.size_along_y = size_along_y;
    mConfiguration.stride_x = begin1.stride_x;
    mConfiguration.stride_y = begin1.stride_y;
    mConfiguration.block_dim_x = begin1.block_dim_x;
    mConfiguration.block_dim_y = begin1.block_dim_y;
    mConfiguration.window_dim_x = begin1.window_dim_x;
    mConfiguration.window_dim_y = begin1.window_dim_y;
    mConfiguration.padding = begin1.window_dim_x - begin1.stride_x;
    mConfiguration.warp_size = properties.warpSize-mConfiguration.padding;
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
    assert(size_along_y*size_along_x*sizeof(T1)<properties.sharedMemPerBlock);


    transform_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size+mConfiguration.padding,mConfiguration.warp_size+mConfiguration.padding,1),(size_along_y+mConfiguration.padding)*(mConfiguration.padding+size_along_x)*sizeof(T1)>>>(*(begin1.h_b),begin1.pitch,begin2.data_pointer,begin2.pitch,mConfiguration,f);
  }
  //Binary Texture Transform
  template<typename T, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_texture_kernel (cudaTextureObject_t texref1,cudaTextureObject_t texref2, T* output,int pitch3, warp_launcher_config mConfiguration, Func f)
  {
    if((mConfiguration.block_dim_x<blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.window_dim_x)||(mConfiguration.block_dim_y<blockIdx.y*mConfiguration.warp_size + threadIdx.y+mConfiguration.window_dim_y))
      return;
    window_2d<T> shared_window1(texref1,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),mConfiguration.stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),mConfiguration.window_dim_x,mConfiguration.window_dim_y);
    window_2d<T> shared_window2(texref2,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),mConfiguration.stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),mConfiguration.window_dim_x,mConfiguration.window_dim_y);
    window_2d<T> output_window(output,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),mConfiguration.stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),mConfiguration.window_dim_x,mConfiguration.window_dim_y,pitch3);
    f(shared_window1,shared_window2,output_window);
  }


  template <class Iterator, class Func>
  void transform(cuda::texture_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f)
  {
    typedef typename Iterator::base_value_type T;
    static cudaDeviceProp properties;
    if (properties.maxThreadsPerBlock == 0)
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
    transform_texture_kernel<<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1)>>>(texref1,texref2,begin3.data_pointer,begin3.pitch,mConfiguration,f);
  }

  //Unary Texture Transform
  template<typename T1, typename T2, class Func>
  __global__
  // __launch_bounds__(maxThreadsPerBlock1, minBlocksPerMultiprocessor)
  void transform_texture_kernel (cudaTextureObject_t texref,T2 *output , int pitch2 ,warp_launcher_config mConfiguration, Func f)
  {
    extern __shared__ T2 shared_memory [];
    if((mConfiguration.block_dim_x<blockIdx.x*mConfiguration.warp_size + threadIdx.x+mConfiguration.window_dim_x)||(mConfiguration.block_dim_y<blockIdx.y*mConfiguration.warp_size + threadIdx.y+mConfiguration.window_dim_y))
      return;
    window_2d<T1> shared_window(texref,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),mConfiguration.stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),mConfiguration.window_dim_x,mConfiguration.window_dim_y);
    window_2d<T2> output_window(output,mConfiguration.stride_x*(blockIdx.x*blockDim.x+ threadIdx.x),mConfiguration.stride_y*(blockIdx.y*blockDim.y+ threadIdx.y),mConfiguration.window_dim_x,mConfiguration.window_dim_y,pitch2);
    f(shared_window,output_window);
    __syncthreads();


  }


  template <class Iterator1, class Iterator2, class Func>
  void transform(cuda::texture_policy,Iterator1 begin1, Iterator1 end1, Iterator2 begin2, Func f)
  {
    typedef typename Iterator1::base_value_type T1;
    typedef typename Iterator2::base_value_type T2;

    static cudaDeviceProp properties;
    if (properties.maxThreadsPerBlock == 0)
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
    mConfiguration.padding = 0;
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

    //Create Resource Descriptor
    cudaResourceDesc resDesc;
    memset(&resDesc, 0, sizeof(resDesc));
    resDesc.resType = cudaResourceTypePitch2D;
    resDesc.res.pitch2D.desc = cudaCreateChannelDesc<T1>();
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
    transform_texture_kernel<T1,T2><<<dim3(iDivUp(begin1.block_dim_x,mConfiguration.warp_size),iDivUp(begin1.block_dim_y,mConfiguration.warp_size),1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1),(size_along_y+mConfiguration.padding)*(mConfiguration.padding+size_along_x)*sizeof(T2)>>>(texref,begin2.data_pointer,begin2.pitch,mConfiguration,f);
  }

}
