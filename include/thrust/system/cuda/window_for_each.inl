namespace thrust
{
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
      window_2d<T> shared_window(input->b,shared_memory,blockIdx.x*mConfiguration.warp_size + threadIdx.x,blockIdx.y*mConfiguration.warp_size + threadIdx.y,threadIdx.x,threadIdx.y,input->window_dim_x,input->window_dim_y,mConfiguration.shared_size_x,mConfiguration.warp_size+mConfiguration.padding, input->pitch);
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
    // int blocks_along_x = begin1.windows_along_x/mConfiguration.warp_size;
    // int blocks_along_y = begin1.windows_along_y/mConfiguration.warp_size;
    assert(size_along_y*size_along_x*sizeof(T)<properties.sharedMemPerBlock);

    Iterator * device_begin_1;
    cudaMalloc((void **)&device_begin_1, sizeof(Iterator));
    cudaMemcpy(device_begin_1,&begin1,sizeof(Iterator),cudaMemcpyHostToDevice);
    for_each_kernel<<<dim3(begin1.block_dim_x/mConfiguration.warp_size,begin1.block_dim_y/mConfiguration.warp_size,1),dim3(mConfiguration.warp_size,mConfiguration.warp_size,1),(size_along_y+mConfiguration.padding)*(mConfiguration.padding+size_along_x)*sizeof(T)>>>(device_begin_1,mConfiguration,f);
  }
}
