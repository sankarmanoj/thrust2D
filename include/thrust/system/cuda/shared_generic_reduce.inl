namespace thrust
{
  template <class T,unsigned int block_size, class BinaryFunc>
  __global__ void generic_reduce_kernel (T *g_idata, T *g_odata, unsigned int n, BinaryFunc b)
  {
    extern __shared__ T sdata[];
    unsigned int tid=threadIdx.x;
    unsigned int i=blockIdx.x*block_size*2 + tid;
    unsigned int grid_size = block_size*2*gridDim.x;
    sdata[tid]=0;
    while (i<n)
    {

      sdata[tid] = b(sdata[tid], g_idata[i]);
      if(i+block_size<n)
        sdata[tid] = b(sdata[tid], g_idata[i+block_size]);
      i+=grid_size;
    }
    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 512]);
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 256]);
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 128]);
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 64]);
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
        sdata[tid] = b(sdata[tid],sdata[tid + 32]);
      if (block_size >= 32)
        sdata[tid] = b(sdata[tid],sdata[tid + 16]);
      if (block_size >= 16)
        sdata[tid] = b(sdata[tid],sdata[tid + 8]);
      if (block_size >= 8)
        sdata[tid] = b(sdata[tid],sdata[tid + 4]);
      if (block_size >= 4)
        sdata[tid] = b(sdata[tid],sdata[tid + 2]);
      if (block_size >= 2)
        sdata[tid] = b(sdata[tid],sdata[tid + 1]);
    }
    __syncthreads();
    if(tid == 0)
    {
      g_odata[blockIdx.x] = sdata[0];
    }
  }
  template <class Iterator, class BinaryFunc, class OutputType>
  OutputType reduce (cuda::shared_policy,Iterator first,Iterator last, OutputType init, BinaryFunc b)
  {
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);
    unsigned int numBlocks = (properties.multiProcessorCount)*2;
    unsigned int numThreads = properties.maxThreadsPerBlock;
    typedef typename Iterator::value_type T;
    const int sharedSize = numThreads*sizeof (T);
    unsigned int number_of_elements = last-first;
    numThreads = min(numThreads, previous_power_of_two(number_of_elements/2));
    numBlocks = min(numBlocks, ((number_of_elements%(2*numThreads))?((number_of_elements/(2*numThreads))+1):(number_of_elements/(2*numThreads))));
    printf("Num Threads = %d Num Blocks = %d\n",numThreads,numBlocks);
    static T *partial = 0 , *h_partial=0;
    T *first_pointer;
    first_pointer = raw_pointer_cast(&(first[0]));
    if(partial==0)
      cudaMalloc (&partial,numBlocks*sizeof(T));
    if (h_partial==0)
      h_partial = (T*) std::malloc(numBlocks*sizeof(T));
    switch(numThreads)
    {
      case 1024:
        generic_reduce_kernel<T,1024,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 512:
        generic_reduce_kernel<T,512,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 256:
        generic_reduce_kernel<T,256,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 128:
        generic_reduce_kernel<T,128,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 64:
        generic_reduce_kernel<T,64,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 32:
        generic_reduce_kernel<T,32,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 16:
        generic_reduce_kernel<T,16,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 8:
        generic_reduce_kernel<T,8,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 4:
        generic_reduce_kernel<T,4,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 2:
        generic_reduce_kernel<T,2,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
      case 1:
        generic_reduce_kernel<T,1,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,b);
        break;
    }
    T answer = 0;
    cudaMemcpy (h_partial,partial,numBlocks*sizeof(T),cudaMemcpyDeviceToHost);
    for (int i = 0; i < numBlocks; i++)
    {
      answer = b(answer,h_partial[i]);
    }
    return (OutputType) init + answer;
  }
  template <class T,class Func,unsigned int block_size,class BinaryFunc>
  __global__ void unary_generic_reduce_kernel (T *g_idata, T *g_odata, unsigned int n, Func f,BinaryFunc b)
  {
    extern __shared__ T sdata[];
    unsigned int tid=threadIdx.x;
    unsigned int i=blockIdx.x*block_size*2 + tid;
    unsigned int grid_size = block_size*2*gridDim.x;
    sdata[tid]=0;
    while (i<n)
    {

      sdata[tid] = b(sdata[tid], f(g_idata[i]));
      if(i+block_size<n)
        sdata[tid] = b(sdata[tid], f(g_idata[i+block_size]));
      i+=grid_size;
    }
    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 512]);
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 256]);
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 128]);
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 64]);
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
        sdata[tid] = b(sdata[tid],sdata[tid + 32]);
      if (block_size >= 32)
        sdata[tid] = b(sdata[tid],sdata[tid + 16]);
      if (block_size >= 16)
        sdata[tid] = b(sdata[tid],sdata[tid + 8]);
      if (block_size >= 8)
        sdata[tid] = b(sdata[tid],sdata[tid + 4]);
      if (block_size >= 4)
        sdata[tid] = b(sdata[tid],sdata[tid + 2]);
      if (block_size >= 2)
        sdata[tid] = b(sdata[tid],sdata[tid + 1]);
    }
    __syncthreads();
    if(tid == 0)
    {
      g_odata[blockIdx.x] = sdata[0];
    }
  }

  template <class Iterator, class Func, class OutputType, class BinaryFunc>
  OutputType transform_reduce(cuda::shared_policy,Iterator begin, Iterator end, Func f, OutputType init, BinaryFunc b)
  {
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);
    unsigned int numBlocks = (properties.multiProcessorCount)*2;
    unsigned int numThreads = properties.maxThreadsPerBlock;
    typedef typename Iterator::value_type T;
    const int sharedSize = numThreads*sizeof (T);
    unsigned int number_of_elements = end-begin;
    numThreads = min(numThreads, previous_power_of_two(number_of_elements/2));
    numBlocks = min(numBlocks, ((number_of_elements%(2*numThreads))?((number_of_elements/(2*numThreads))+1):(number_of_elements/(2*numThreads))));
    static T *partial = 0 , *h_partial=0;
    T *first_pointer;
    first_pointer = raw_pointer_cast(&(begin[0]));
    if(partial==0)
      cudaMalloc (&partial,numBlocks*sizeof(T));
    if (h_partial==0)
      h_partial = (T*) std::malloc(numBlocks*sizeof(T));
    switch(numThreads)
    {
      case 1024:
        unary_generic_reduce_kernel<T,Func,1024,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 512:
        unary_generic_reduce_kernel<T,Func,512,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 256:
        unary_generic_reduce_kernel<T,Func,256,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 128:
        unary_generic_reduce_kernel<T,Func,128,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 64:
        unary_generic_reduce_kernel<T,Func,64,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 32:
        unary_generic_reduce_kernel<T,Func,32,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 16:
        unary_generic_reduce_kernel<T,Func,16,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 8:
        unary_generic_reduce_kernel<T,Func,8,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 4:
        unary_generic_reduce_kernel<T,Func,4,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 2:
        unary_generic_reduce_kernel<T,Func,2,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
      case 1:
        unary_generic_reduce_kernel<T,Func,1,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f,b);
        break;
    }
    T answer = 0;
    cudaMemcpy (h_partial,partial,numBlocks*sizeof(T),cudaMemcpyDeviceToHost);
    for (int i = 0; i < numBlocks; i++)
    {
      answer = b(answer,h_partial[i]);
    }

    return (OutputType) init + answer;
  }

  template <class T,class Func,unsigned int block_size, class BinaryFunc>
  __global__ void binary_generic_reduce_kernel (T *g_idata1, T *g_idata2, T *g_odata, unsigned int n, Func f, BinaryFunc b)
  {
    extern __shared__ T sdata[];
    unsigned int tid=threadIdx.x;
    unsigned int i=blockIdx.x*block_size*2 + tid;
    unsigned int grid_size = block_size*2*gridDim.x;
    sdata[tid]=0;
    while (i<n)
    {

      sdata[tid] = b(sdata[tid], f(g_idata1[i],g_idata2[i]));
      if(i+block_size<n)
        sdata[tid] = b(sdata[tid], f(g_idata1[i+block_size],g_idata2[i+block_size]));
      i+=grid_size;
    }

    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 512]);
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 256]);
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 128]);
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] = b(sdata[tid],sdata[tid + 64]);
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
        sdata[tid] = b(sdata[tid],sdata[tid + 32]);
      if (block_size >= 32)
        sdata[tid] = b(sdata[tid],sdata[tid + 16]);
      if (block_size >= 16)
        sdata[tid] = b(sdata[tid],sdata[tid + 8]);
      if (block_size >= 8)
        sdata[tid] = b(sdata[tid],sdata[tid + 4]);
      if (block_size >= 4)
        sdata[tid] = b(sdata[tid],sdata[tid + 2]);
      if (block_size >= 2)
        sdata[tid] = b(sdata[tid],sdata[tid + 1]);
    }
    __syncthreads();
    if(tid == 0)
    {
      g_odata[blockIdx.x] = sdata[0];
    }
  }

  template <class Iterator1,class Iterator2, class Func, class OutputType, class BinaryFunc>
  OutputType transform_reduce(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2,Func f, OutputType init, BinaryFunc b)
  {
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);
    unsigned int numBlocks = (properties.multiProcessorCount)*2;
    unsigned int numThreads = properties.maxThreadsPerBlock;
    typedef typename Iterator1::value_type T;
    const int sharedSize = numThreads*sizeof (T);
    unsigned int number_of_elements = end1-begin1;
    numThreads = min(numThreads, previous_power_of_two(number_of_elements/2));
    numBlocks = min(numBlocks, ((number_of_elements%(2*numThreads))?((number_of_elements/(2*numThreads))+1):(number_of_elements/(2*numThreads))));
    static T *partial = 0 , *h_partial=0;

    if(partial==0)
      cudaMalloc (&partial,numBlocks*sizeof(T));
    if (h_partial==0)
      h_partial = (T*) std::malloc(numBlocks*sizeof(T));

    T *first_pointer;
    first_pointer = raw_pointer_cast(&(begin1[0]));
    T  *second_pointer;
    second_pointer = raw_pointer_cast(&(begin2[0]));
    switch(numThreads)
    {
      case 1024:
        binary_generic_reduce_kernel<T,Func,1024,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 512:
        binary_generic_reduce_kernel<T,Func,512,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 256:
        binary_generic_reduce_kernel<T,Func,256,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 128:
        binary_generic_reduce_kernel<T,Func,128,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 64:
        binary_generic_reduce_kernel<T,Func,64,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 32:
        binary_generic_reduce_kernel<T,Func,32,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 16:
        binary_generic_reduce_kernel<T,Func,16,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 8:
        binary_generic_reduce_kernel<T,Func,8,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 4:
        binary_generic_reduce_kernel<T,Func,4,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 2:
        binary_generic_reduce_kernel<T,Func,2,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
      case 1:
        binary_generic_reduce_kernel<T,Func,1,BinaryFunc><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f,b);
        break;
    }
    T answer = 0;
    cudaMemcpy (h_partial,partial,numBlocks*sizeof(T),cudaMemcpyDeviceToHost);
    for (int i = 0; i < numBlocks; i++)
    {
      answer = b(answer,h_partial[i]);
    }

    return (OutputType) init + answer;
  }
};
