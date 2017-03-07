namespace thrust
{
  template <class T>
  __global__ void reduce_kernel (T *start,T *output,int N) // TODO: Implement better tree based reduce function.
  {
    int idx = blockIdx.x*blockDim.x + threadIdx.x;
    int num_threads = gridDim.x * blockDim.x;
    extern __shared__ T partial_sum[]; // Dynamic Shared Memory
    T sum = 0; // For Generic Function, Replace By Idendity Element
    for (int i=idx;i<N;i+=num_threads)
      sum += start[i]; // For Generic Function, Replace By Functor
    partial_sum[threadIdx.x] = sum;
    __syncthreads ();
    // This Step Computes The Reduction Function In A Bottom's Up Manner
    for (int activeThreads = blockDim.x>>1;activeThreads != 0;activeThreads >>= 1)
    {
      if (threadIdx.x < activeThreads)
        partial_sum[threadIdx.x] += partial_sum[threadIdx.x+activeThreads]; // For Generic Function, Replace += with functor
      __syncthreads ();
    }
        // When You Reach The Root Of The Tree Store It In Output Vector
    if (threadIdx.x == 0)
      output[blockIdx.x] = partial_sum[0];
  }
  template <class T,unsigned int block_size>
  __global__ void better_reduce_kernel (T *g_idata, T *g_odata, unsigned int n)
  {
    extern volatile __shared__ T sdata[];
    unsigned int tid=threadIdx.x;
    unsigned int i=blockIdx.x*block_size*2 + tid;
    unsigned int grid_size = block_size*2*gridDim.x;
    sdata[tid]=0;
    while (i<n)
    {

      sdata[tid] += g_idata[i];
      if(i+block_size<n)
        sdata[tid] += g_idata[i+block_size];
      // printf("%d+=(%d+%d)\n", sdata[tid], g_idata[i],g_idata[i+block_size]);
      i+=grid_size;
    }
    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] += sdata[tid + 512];
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] += sdata[tid + 256];
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] += sdata[tid + 128];
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] += sdata[tid + 64];
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
        sdata[tid] += sdata[tid + 32];
      if (block_size >= 32)
        sdata[tid] += sdata[tid + 16];
      if (block_size >= 16)
        sdata[tid] += sdata[tid + 8];
      if (block_size >= 8)
        sdata[tid] += sdata[tid + 4];
      if (block_size >= 4)
        sdata[tid] += sdata[tid + 2];
      if (block_size >= 2)
        sdata[tid] += sdata[tid + 1];
    }
    __syncthreads();
    if(tid == 0)
    {
      g_odata[blockIdx.x] = sdata[0];
    }
  }
  template <class Iterator>
  typename thrust::iterator_traits<Iterator>::value_type reduce (cuda::shared_policy,Iterator first,Iterator last)
  {
    // TODO: To be replaced by cuda Occupancy calculator or cuda properties.
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
    // reduce_kernel<<<numBlocks,numThreads,sharedSize>>> (first_pointer,partial,number_of_elements);
    // reduce_kernel<<<1,numThreads,sharedSize>>> (partial,answer_device,numBlocks);
    switch(numThreads)
    {
      case 1024:
        better_reduce_kernel<T,1024><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 512:
        better_reduce_kernel<T,512><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 256:
        better_reduce_kernel<T,256><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 128:
        better_reduce_kernel<T,128><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 64:
        better_reduce_kernel<T,64><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 32:
        better_reduce_kernel<T,32><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 16:
        better_reduce_kernel<T,16><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 8:
        better_reduce_kernel<T,8><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 4:
        better_reduce_kernel<T,4><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 2:
        better_reduce_kernel<T,2><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
      case 1:
        better_reduce_kernel<T,1><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements);
        break;
    }
    T answer = 0;
    cudaMemcpy (h_partial,partial,numBlocks*sizeof(T),cudaMemcpyDeviceToHost);
    for (int i = 0; i < numBlocks; i++)
    {
      answer += h_partial[i];
    }

    return answer;
  }
  // template <class T>
  // __global__ void fixup(T *input, T *aux, int len)
  // {
  //   unsigned int t = threadIdx.x, start = 2 * blockIdx.x * blockDim.x;
  //   if (blockIdx.x)
  //   {
  //     if (start + t < len)
  //       input[start + t] += aux[blockIdx.x - 1];
  //     if (start + blockDim.x + t < len)
  //       input[start + blockDim.x + t] += aux[blockIdx.x - 1];
  //   }
  // }
  // template <class T>
  // __global__ void scan(T * input, T * output, T *aux, int len)
  // {
  //   // Load a segment of the input vector into shared memory
  //   extern volatile __shared__ T scan_array[];
  //   unsigned int t = threadIdx.x, start = 2 * blockIdx.x * blockDim.x;
  //   if (start + t < len)
  //     scan_array[t] = input[start + t];
  //   else
  //     scan_array[t] = 0;
  //   if (start + blockDim.x + t < len)
  //     scan_array[blockDim.x + t] = input[start + blockDim.x + t];
  //   else
  //     scan_array[blockDim.x + t] = 0;
  //   __syncthreads();
  //   // Reduction
  //   int stride;
  //   for (stride = 1; stride <= blockDim.x; stride <<= 1)
  //   {
  //     int index = (t + 1) * stride * 2 - 1;
  //     if (index < 2 * blockDim.x)
  //       scan_array[index] += scan_array[index - stride];
  //     __syncthreads();
  //   }
  //
  //   // Post reduction
  //   for (stride = blockDim.x >> 1; stride; stride >>= 1)
  //   {
  //     int index = (t + 1) * stride * 2 - 1;
  //     if (index + stride < 2 * blockDim.x)
  //       scan_array[index + stride] += scan_array[index];
  //     __syncthreads();
  //   }
  //
  //   if (start + t < len)
  //     output[start + t] = scan_array[t];
  //   if (start + blockDim.x + t < len)
  //     output[start + blockDim.x + t] = scan_array[blockDim.x + t];
  //
  //   if (aux && t == 0)
  //     aux[blockIdx.x] = scan_array[2 * blockDim.x - 1];
  // }
  //
  // template <class Iterator>
  // void inclusive_scan (cuda::shared_policy,Iterator first,Iterator last,Iterator output)
  // {
  //   int number_of_elements = last - first;
  //   int BLOCK_SIZE;
  //   if (number_of_elements>1024)
  //     BLOCK_SIZE = 512;
  //   else if (number_of_elements>512)
  //     BLOCK_SIZE = 256;
  //   else if (number_of_elements>128)
  //     BLOCK_SIZE = 64;
  //   else if (number_of_elements>64)
  //     BLOCK_SIZE = 32;
  //   else
  //     BLOCK_SIZE = pow(2, floor(log(number_of_elements)/log(2))-2);
  //   typedef typename Iterator::value_type T;
  //   T *deviceInput = raw_pointer_cast(&(first[0]));
  //   T *deviceAuxArray, *deviceAuxScannedArray, *deviceOutput;
  //   cudaMalloc(&deviceAuxArray, (BLOCK_SIZE << 1) * sizeof(T));
  //   cudaMalloc(&deviceAuxScannedArray, (BLOCK_SIZE << 1) * sizeof(T));
  //   cudaMalloc(&deviceOutput,number_of_elements*sizeof(T));
  //   cudaMemset(deviceOutput, 0, number_of_elements*sizeof(T));
  //   int numBlocks = ceil((T)number_of_elements/(BLOCK_SIZE<<1));
  //   dim3 dimGrid(numBlocks, 1, 1);
  //   dim3 dimBlock(BLOCK_SIZE, 1, 1);
  //   scan<<<dimGrid, dimBlock, BLOCK_SIZE*2*sizeof(T)>>>(deviceInput, deviceOutput, deviceAuxArray, number_of_elements);
  //   cudaDeviceSynchronize();
  //   scan<<<dim3(1,1,1), dimBlock,BLOCK_SIZE*2*sizeof(T)>>>(deviceAuxArray, deviceAuxScannedArray, (T*)nullptr, BLOCK_SIZE << 1);
  //   cudaDeviceSynchronize();
  //   fixup<<<dimGrid, dimBlock>>>(deviceOutput, deviceAuxScannedArray, number_of_elements);
  //   cudaDeviceSynchronize();
  //   cudaMemcpy(raw_pointer_cast(&(output[0])),deviceOutput,number_of_elements*sizeof(T),cudaMemcpyDeviceToDevice);
  //   cudaFree(deviceAuxArray);
  //   cudaFree(deviceAuxScannedArray);
  //   cudaFree(deviceOutput);
  // }
  template <class T,class Func,unsigned int block_size>
  __global__ void unary_reduce_kernel (T *g_idata, T *g_odata, unsigned int n, Func f)
  {
    extern volatile __shared__ T sdata[];
    unsigned int tid=threadIdx.x;
    unsigned int i=blockIdx.x*block_size*2 + tid;
    unsigned int grid_size = block_size*2*gridDim.x;
    sdata[tid]=0;
    while (i<n)
    {

      sdata[tid] += f(g_idata[i]);
      if(i+block_size<n)
        sdata[tid] += f(g_idata[i+block_size]);
      // printf("%d+=(%d+%d)\n", sdata[tid], g_idata[i],g_idata[i+block_size]);
      i+=grid_size;
    }

    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] += sdata[tid + 512];
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] += sdata[tid + 256];
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] += sdata[tid + 128];
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] += sdata[tid + 64];
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
        sdata[tid] += sdata[tid + 32];
      if (block_size >= 32)
        sdata[tid] += sdata[tid + 16];
      if (block_size >= 16)
        sdata[tid] += sdata[tid + 8];
      if (block_size >= 8)
        sdata[tid] += sdata[tid + 4];
      if (block_size >= 4)
        sdata[tid] += sdata[tid + 2];
      if (block_size >= 2)
        sdata[tid] += sdata[tid + 1];
    }
    __syncthreads();
    if(tid == 0)
    {
      g_odata[blockIdx.x] = sdata[0];
    }
  }

  template <class Iterator, class Func>
  typename thrust::iterator_traits<Iterator>::value_type transform_reduce(cuda::shared_policy,Iterator begin, Iterator end, Func f)
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
    // printf("%d %d\n",numThreads,numBlocks);
    static T *partial = 0 , *h_partial=0;
    T *first_pointer;
    first_pointer = raw_pointer_cast(&(begin[0]));
    if(partial==0)
      cudaMalloc (&partial,numBlocks*sizeof(T));
    if (h_partial==0)
      h_partial = (T*) std::malloc(numBlocks*sizeof(T));
    // reduce_kernel<<<numBlocks,numThreads,sharedSize>>> (first_pointer,partial,number_of_elements);
    // reduce_kernel<<<1,numThreads,sharedSize>>> (partial,answer_device,numBlocks);
    switch(numThreads)
    {
      case 1024:
        unary_reduce_kernel<T,Func,1024><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 512:
        unary_reduce_kernel<T,Func,512><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 256:
        unary_reduce_kernel<T,Func,256><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 128:
        unary_reduce_kernel<T,Func,128><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 64:
        unary_reduce_kernel<T,Func,64><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 32:
        unary_reduce_kernel<T,Func,32><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 16:
        unary_reduce_kernel<T,Func,16><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 8:
        unary_reduce_kernel<T,Func,8><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 4:
        unary_reduce_kernel<T,Func,4><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 2:
        unary_reduce_kernel<T,Func,2><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
      case 1:
        unary_reduce_kernel<T,Func,1><<<numBlocks,numThreads,sharedSize>>>(first_pointer,partial,number_of_elements,f);
        break;
    }
    T answer = 0;
    cudaMemcpy (h_partial,partial,numBlocks*sizeof(T),cudaMemcpyDeviceToHost);
    for (int i = 0; i < numBlocks; i++)
    {
      answer += h_partial[i];
    }

    return answer;
  }

  template <class T,class Func,unsigned int block_size>
  __global__ void binary_reduce_kernel (T *g_idata1, T *g_idata2, T *g_odata, unsigned int n, Func f)
  {
    extern volatile __shared__ T sdata[];
    unsigned int tid=threadIdx.x;
    unsigned int i=blockIdx.x*block_size*2 + tid;
    unsigned int grid_size = block_size*2*gridDim.x;
    sdata[tid]=0;
    while (i<n)
    {

      sdata[tid] += f(g_idata1[i],g_idata2[i]);
      if(i+block_size<n)
        sdata[tid] +=f(g_idata1[i+block_size],g_idata2[i+block_size]);
      // printf("%d+=(%d+%d)\n", sdata[tid], g_idata[i],g_idata[i+block_size]);
      i+=grid_size;
    }

    __syncthreads();

    if (block_size >= 1024)
    {
      if (tid < 512)
      {
        sdata[tid] += sdata[tid + 512];
      }
      __syncthreads();
    }
    if (block_size >= 512)
    {
      if (tid < 256)
      {
        sdata[tid] += sdata[tid + 256];
      }
      __syncthreads();
    }
    if (block_size >= 256)
    {
      if (tid < 128)
      {
        sdata[tid] += sdata[tid + 128];
      }
      __syncthreads();
    }
    if (block_size >= 128)
    {
      if (tid < 64)
      {
        sdata[tid] += sdata[tid + 64];
      }
      __syncthreads();
    }
    if (tid<32)
    {
      if (block_size >= 64)
        sdata[tid] += sdata[tid + 32];
      if (block_size >= 32)
        sdata[tid] += sdata[tid + 16];
      if (block_size >= 16)
        sdata[tid] += sdata[tid + 8];
      if (block_size >= 8)
        sdata[tid] += sdata[tid + 4];
      if (block_size >= 4)
        sdata[tid] += sdata[tid + 2];
      if (block_size >= 2)
        sdata[tid] += sdata[tid + 1];
    }
    __syncthreads();
    if(tid == 0)
    {
      g_odata[blockIdx.x] = sdata[0];
    }
  }

  template <class Iterator1,class Iterator2, class Func>
  typename thrust::iterator_traits<Iterator1>::value_type transform_reduce(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2,Func f)
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
    // printf("%d %d\n",numThreads,numBlocks);
    static T *partial = 0 , *h_partial=0;

    if(partial==0)
      cudaMalloc (&partial,numBlocks*sizeof(T));
    if (h_partial==0)
      h_partial = (T*) std::malloc(numBlocks*sizeof(T));

    T *first_pointer;
    first_pointer = raw_pointer_cast(&(begin1[0]));
    T  *second_pointer;
    second_pointer = raw_pointer_cast(&(begin2[0]));

    // reduce_kernel<<<numBlocks,numThreads,sharedSize>>> (first_pointer,partial,number_of_elements);
    // reduce_kernel<<<1,numThreads,sharedSize>>> (partial,answer_device,numBlocks);
    switch(numThreads)
    {
      case 1024:
        binary_reduce_kernel<T,Func,1024><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 512:
        binary_reduce_kernel<T,Func,512><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 256:
        binary_reduce_kernel<T,Func,256><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 128:
        binary_reduce_kernel<T,Func,128><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 64:
        binary_reduce_kernel<T,Func,64><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 32:
        binary_reduce_kernel<T,Func,32><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 16:
        binary_reduce_kernel<T,Func,16><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 8:
        binary_reduce_kernel<T,Func,8><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 4:
        binary_reduce_kernel<T,Func,4><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 2:
        binary_reduce_kernel<T,Func,2><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
      case 1:
        binary_reduce_kernel<T,Func,1><<<numBlocks,numThreads,sharedSize>>>(first_pointer,second_pointer,partial,number_of_elements,f);
        break;
    }
    T answer = 0;
    cudaMemcpy (h_partial,partial,numBlocks*sizeof(T),cudaMemcpyDeviceToHost);
    for (int i = 0; i < numBlocks; i++)
    {
      answer += h_partial[i];
    }

    return answer;
  }
};
