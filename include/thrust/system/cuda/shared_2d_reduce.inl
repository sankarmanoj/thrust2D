namespace thrust
{
  template <class T, unsigned int block_size, class BinaryFunc>
  __global__ void shared_2d_row_reduce_kernel (block_iterator<T> *g_idata, detail::normal_iterator<device_ptr<T> > *g_odata, unsigned int num_cols, BinaryFunc b)
  {
    extern volatile __shared__ T sdata[];
    unsigned int index=threadIdx.x,tid=threadIdx.x;
    unsigned int i = blockIdx.x;
    unsigned int grid_size = block_size*2;
    sdata[tid]=0;
    T sum = 0;
    while(index<num_cols)
    {
      sdata[tid] = sum = b(sum, (*g_idata)[index + i*num_cols]);
      if(index+block_size<num_cols)
      sdata[tid] = sum = b(sum, (*g_idata)[index + i*num_cols + block_size]);
      index+=grid_size;
    }
    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 512]);
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 256]);
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 128]);
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 64]);
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
      sdata[tid] = sum = b(sum, (T) sdata[tid + 32]);
      if (block_size >= 32)
      sdata[tid] = sum = b(sum, __shfl_down(sum,16));
      if (block_size >= 16)
      sdata[tid] = sum = b(sum, __shfl_down(sum,8));
      if (block_size >= 8)
      sdata[tid] = sum = b(sum, __shfl_down(sum,4));
      if (block_size >= 4)
      sdata[tid] = sum = b(sum, __shfl_down(sum,2));
      if (block_size >= 2)
      sdata[tid] = sum = b(sum, __shfl_down(sum,1));
    }
    __syncthreads();
    if(tid == 0)
    {
      (*g_odata)[i] = sum;
    }
  }

  template <class T,class BinaryFunc>
  void row_reduce (cuda::shared_policy,block_iterator<T> first, block_iterator<T> last, detail::normal_iterator<device_ptr<T> > output, BinaryFunc b)
  {
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);
    unsigned int numBlocks;
    unsigned int numThreads = properties.maxThreadsPerBlock;
    const int sharedSize = numThreads*sizeof (T);
    numThreads = min(numThreads, previous_power_of_two(first.dim_x/2));
    numBlocks = first.dim_y;
    printf("Num Threads = %d Num Blocks = %d\n",numThreads,numBlocks);
    static block_iterator<T> *dev_block_iterator;
    if(dev_block_iterator == 0)
      cudaMalloc((void **)&dev_block_iterator, sizeof(block_iterator<T>));
    cudaMemcpy(dev_block_iterator,&first,sizeof(block_iterator<T>),cudaMemcpyHostToDevice);
    static detail::normal_iterator<device_ptr<T> > *dev_output;
    if(dev_output == 0)
      cudaMalloc((void **)&dev_output, sizeof(detail::normal_iterator<device_ptr<T> >));
    cudaMemcpy(dev_output,&output,sizeof(detail::normal_iterator<device_ptr<T> >),cudaMemcpyHostToDevice);
    switch(numThreads)
    {
      case 1024:
        shared_2d_row_reduce_kernel<T,1024,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 512:
        shared_2d_row_reduce_kernel<T,512,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 256:
        shared_2d_row_reduce_kernel<T,256,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 128:
        shared_2d_row_reduce_kernel<T,128,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 64:
        shared_2d_row_reduce_kernel<T,64,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 32:
        shared_2d_row_reduce_kernel<T,32,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 16:
        shared_2d_row_reduce_kernel<T,16,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 8:
        shared_2d_row_reduce_kernel<T,8,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 4:
        shared_2d_row_reduce_kernel<T,4,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 2:
        shared_2d_row_reduce_kernel<T,2,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
      case 1:
        shared_2d_row_reduce_kernel<T,1,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_x,b);
        break;
    }
  }

  template <class T, unsigned int block_size, class BinaryFunc>
  __global__ void shared_2d_col_reduce_kernel (block_iterator<T> *g_idata, detail::normal_iterator<device_ptr<T> > *g_odata, unsigned int num_rows, BinaryFunc b)
  {
    extern volatile __shared__ T sdata[];
    unsigned int index=threadIdx.x,tid=threadIdx.x;
    unsigned int i = blockIdx.x;
    unsigned int grid_size = block_size*2;
    sdata[tid]=0;
    T sum = 0;
    unsigned int num_cols = g_idata->dim_x;
    while(index<num_rows)
    {
      sdata[tid] = sum = b(sum, (*g_idata)[index*num_cols + i]);
      if(index+block_size<num_rows)
      sdata[tid] = sum = b(sum, (*g_idata)[(index + block_size)*num_cols + i]);
      index+=grid_size;
    }
    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 512]);
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 256]);
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 128]);
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] = sum = b(sum, (T) sdata[tid + 64]);
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
      sdata[tid] = sum = b(sum, (T) sdata[tid + 32]);
      if (block_size >= 32)
      sdata[tid] = sum = b(sum, __shfl_down(sum,16));
      if (block_size >= 16)
      sdata[tid] = sum = b(sum, __shfl_down(sum,8));
      if (block_size >= 8)
      sdata[tid] = sum = b(sum, __shfl_down(sum,4));
      if (block_size >= 4)
      sdata[tid] = sum = b(sum, __shfl_down(sum,2));
      if (block_size >= 2)
      sdata[tid] = sum = b(sum, __shfl_down(sum,1));
    }
    __syncthreads();
    if(tid == 0)
    {
      (*g_odata)[i] = sum;
    }
  }

  template <class T,class BinaryFunc>
  void col_reduce (cuda::shared_policy,block_iterator<T> first, block_iterator<T> last, detail::normal_iterator<device_ptr<T> > output, BinaryFunc b)
  {
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);
    unsigned int numBlocks;
    unsigned int numThreads = properties.maxThreadsPerBlock;
    const int sharedSize = numThreads*sizeof (T);
    numThreads = min(numThreads, previous_power_of_two(first.dim_y/2));
    numBlocks = first.dim_x;
    printf("Num Threads = %d Num Blocks = %d\n",numThreads,numBlocks);
    static block_iterator<T> *dev_block_iterator;
    if(dev_block_iterator == 0)
      cudaMalloc((void **)&dev_block_iterator, sizeof(block_iterator<T>));
    cudaMemcpy(dev_block_iterator,&first,sizeof(block_iterator<T>),cudaMemcpyHostToDevice);
    static detail::normal_iterator<device_ptr<T> > *dev_output;
    if(dev_output == 0)
      cudaMalloc((void **)&dev_output, sizeof(detail::normal_iterator<device_ptr<T> >));
    cudaMemcpy(dev_output,&output,sizeof(detail::normal_iterator<device_ptr<T> >),cudaMemcpyHostToDevice);
    switch(numThreads)
    {
      case 1024:
        shared_2d_col_reduce_kernel<T,1024,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 512:
        shared_2d_col_reduce_kernel<T,512,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 256:
        shared_2d_col_reduce_kernel<T,256,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 128:
        shared_2d_col_reduce_kernel<T,128,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 64:
        shared_2d_col_reduce_kernel<T,64,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 32:
        shared_2d_col_reduce_kernel<T,32,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 16:
        shared_2d_col_reduce_kernel<T,16,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 8:
        shared_2d_col_reduce_kernel<T,8,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 4:
        shared_2d_col_reduce_kernel<T,4,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 2:
        shared_2d_col_reduce_kernel<T,2,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
      case 1:
        shared_2d_col_reduce_kernel<T,1,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(dev_block_iterator,dev_output,first.dim_y,b);
        break;
    }
  }
}
