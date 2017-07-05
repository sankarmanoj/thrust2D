namespace thrust
{
  template <class T,unsigned int block_size, class BinaryFunc>
  __global__ void generic_reduce_kernel (T  *g_idata, T *g_odata, unsigned int n, BinaryFunc b)
  {
    extern volatile __shared__ T sdata[];
    unsigned int tid=threadIdx.x;
    unsigned int i=blockIdx.x*block_size*2 + tid;
    unsigned int grid_size = block_size*2*gridDim.x;
    sdata[tid]=0;
    T sum = (T) 0;
    while (i<n)
    {
      sdata[tid] = sum =  b(sum, g_idata[i]);
      if(i+block_size<n)
        sdata[tid] = sum = b(sum, g_idata[i+block_size]);
      i+=grid_size;
    }
    __syncthreads();
    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] = sum = b(sum,(T)sdata[tid + 512]);
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] = sum = b(sum,(T)sdata[tid + 256]);
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] = sum = b(sum,(T)sdata[tid + 128]);
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] = sum = b(sum,(T)sdata[tid + 64]);
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
        sdata[tid] = sum = b(sum,(T)sdata[tid + 32]);
      if (block_size >= 32)
        sum = b(sum,__shfl_down(sum,16));
      if (block_size >= 16)
        sum = b(sum,__shfl_down(sum,8));
      if (block_size >= 8)
        sum = b(sum,__shfl_down(sum,4));
      if (block_size >= 4)
        sum = b(sum,__shfl_down(sum,2));
      if (block_size >= 2)
        sum = b(sum,__shfl_down(sum,1));
    }
    __syncthreads();
    if(tid == 0)
    {
      g_odata[blockIdx.x] = sum;
    }
  }
  template <class Tp, class BinaryFunc, class OutputType>
  OutputType reduce (cuda::multi_policy,detail::normal_iterator<Tp> first,detail::normal_iterator<Tp> last, OutputType init, BinaryFunc b)
  {
    int nDevices = 0;
    cudaGetDeviceCount(&nDevices);
    printf("There are %d devices\n",nDevices);
    if(nDevices==1)
      return reduce(thrust::cuda::shared,first,last,init,b);

    typedef typename detail::normal_iterator<Tp>::value_type T;
    unsigned int number_of_elements = last-first;
    int elements_per_device[10];
    static cudaDeviceProp properties[10];
    static cudaStream_t streams[10];
    int sum = 0;
    static T *partial[10] , *h_partial[10];
    for(int i = 0; i<nDevices;i++)
    {
      if(properties[i].maxThreadsPerBlock==0)
      {
        cudaGetDeviceProperties(&(properties[i]),i);
        cudaMallocHost((void**)&h_partial[i],properties[i].multiProcessorCount*2*sizeof(T));
      }

      if(i==nDevices-1)
      {
       elements_per_device[i]=number_of_elements-sum;
      }
      else
        elements_per_device[i]=number_of_elements/nDevices;
      sum+=elements_per_device[i];
    }
    static T *input[10] ;
    static int d_mem_size[10];
    #pragma omp parallel for
    for(int i = 0; i<nDevices;i++)
    {
      cudaSetDevice(i);
      if(streams[i]==0)
      {
        cudaStreamCreate(&streams[i]);
      }
      if(partial[i]==0)
      {
        cudaMalloc((void **)&partial[i],properties[i].multiProcessorCount*2*sizeof(T));
      }
      if(input[i]==0||d_mem_size[i]<sizeof(T)*elements_per_device[i])
      {
        cudaMalloc((void **)&(input[i]),sizeof(T)*elements_per_device[i]);
        d_mem_size[i]=sizeof(T)*elements_per_device[i];
      }
    }

    // T *data_pointer =
    T *start_position =(&(first[0]));
    for(int i = 0; i<nDevices;i++)
    {
      cudaSetDevice(i);
      printf("H=%p D=%p\n",start_position,input[i]);
      cudaMemcpyAsync(input[i],start_position,elements_per_device[i]*sizeof(T),cudaMemcpyHostToDevice,streams[i]);
      start_position+=elements_per_device[i];
    }

    #pragma omp parallel for
    for(int i = 0; i<nDevices;i++)
    {
      cudaSetDevice(i);
      unsigned int numBlocks = (properties[i].multiProcessorCount)*2;
      unsigned int numThreads = properties[i].maxThreadsPerBlock;
      const int sharedSize = numThreads*sizeof (T);
      numThreads = min(numThreads, previous_power_of_two(number_of_elements/2));
      numBlocks = min(numBlocks, ((number_of_elements%(2*numThreads))?((number_of_elements/(2*numThreads))+1):(number_of_elements/(2*numThreads))));
      switch(numThreads)
      {
        case 1024:
          generic_reduce_kernel<T,1024,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 512:
          generic_reduce_kernel<T,512,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 256:
          generic_reduce_kernel<T,256,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 128:
          generic_reduce_kernel<T,128,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 64:
          generic_reduce_kernel<T,64,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 32:
          generic_reduce_kernel<T,32,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 16:
          generic_reduce_kernel<T,16,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 8:
          generic_reduce_kernel<T,8,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 4:
          generic_reduce_kernel<T,4,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 2:
          generic_reduce_kernel<T,2,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
        case 1:
          generic_reduce_kernel<T,1,BinaryFunc><<<numBlocks,numThreads,sharedSize,streams[i]>>>(input[i],partial[i],elements_per_device[i],b);
          break;
      }
      cudaMemcpyAsync(h_partial[i],partial[i],numBlocks*sizeof(T),cudaMemcpyDeviceToHost,streams[i]);

      // cudaMemcpyAsync(h_partial[i],input[i],numBlocks *sizeof(T),cudaMemcpyDeviceToHost,streams[i]);

    }
    T answer = 0;
    for(int i = 0; i<nDevices;i++)
    {
      unsigned int numBlocks = (properties[1].multiProcessorCount)*2;
      cudaStreamSynchronize(streams[i]);
      for (int j = 0; j < numBlocks; j++)
      {
        printf("%d-", h_partial[i][j]);
        answer +=h_partial[i][j];
      }
      printf("\n\n");
    }
    return  answer;
  }
}
