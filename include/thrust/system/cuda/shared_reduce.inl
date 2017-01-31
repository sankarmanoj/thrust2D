namespace thrust
{
  template <class T>
  __global__ void reduce_kernel (T *start,T* output,int N) // TODO: Implement better tree based reduce function.
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

  template <class Iterator>
  typename thrust::iterator_traits<Iterator>::value_type reduce (cuda::shared_policy,Iterator first,Iterator last)
  {
    // TODO: To be replaced by cuda Occupancy calculator or cuda properties.
    const int numBlocks = 26;
    const int numThreads = 1024;
    typedef typename Iterator::value_type T;
    const int sharedSize = numThreads*sizeof (T);
    int number_of_elements = last-first;
    T *partial,*first_pointer;
    first_pointer = raw_pointer_cast(&(first[0]));
    cudaMalloc ((T**)&partial,number_of_elements*sizeof(T));
    T *answer_device;
    cudaMalloc ((T**)&answer_device,sizeof(T));
    reduce_kernel<<<numBlocks,numThreads,sharedSize>>> (first_pointer,partial,number_of_elements);
    reduce_kernel<<<1,numThreads,sharedSize>>> (partial,answer_device,numBlocks);
    T answer;
    cudaMemcpy (&answer,answer_device,sizeof(T),cudaMemcpyDeviceToHost);
    cudaFree (answer_device);
    cudaFree (partial);
    return answer;
  }
  template <class T>
  __global__ void fixup(T *input, T *aux, int len)
  {
    unsigned int t = threadIdx.x, start = 2 * blockIdx.x * blockDim.x;
    if (blockIdx.x)
    {
      if (start + t < len)
        input[start + t] += aux[blockIdx.x - 1];
      if (start + blockDim.x + t < len)
        input[start + blockDim.x + t] += aux[blockIdx.x - 1];
    }
  }
  template <class T>
  __global__ void scan(T * input, T * output, T *aux, int len)
  {
    // Load a segment of the input vector into shared memory
    extern __shared__ T scan_array[];
    unsigned int t = threadIdx.x, start = 2 * blockIdx.x * blockDim.x;
    if (start + t < len)
      scan_array[t] = input[start + t];
    else
      scan_array[t] = 0;
    if (start + blockDim.x + t < len)
      scan_array[blockDim.x + t] = input[start + blockDim.x + t];
    else
      scan_array[blockDim.x + t] = 0;
    __syncthreads();

    // Reduction
    int stride;
    for (stride = 1; stride <= blockDim.x; stride <<= 1)
    {
      int index = (t + 1) * stride * 2 - 1;
      if (index < 2 * blockDim.x)
        scan_array[index] += scan_array[index - stride];
      __syncthreads();
    }

    // Post reduction
    for (stride = blockDim.x >> 1; stride; stride >>= 1)
    {
      int index = (t + 1) * stride * 2 - 1;
      if (index + stride < 2 * blockDim.x)
        scan_array[index + stride] += scan_array[index];
      __syncthreads();
    }

    if (start + t < len)
      output[start + t] = scan_array[t];
    if (start + blockDim.x + t < len)
      output[start + blockDim.x + t] = scan_array[blockDim.x + t];

    if (aux && t == 0)
      aux[blockIdx.x] = scan_array[2 * blockDim.x - 1];
  }

  template <class Iterator>
  void exclusive_scan (cuda::shared_policy,Iterator first,Iterator last,Iterator output)
  {
    int BLOCK_SIZE = 256; // TODO: Update with better values
    typedef typename Iterator::value_type T;
    T *deviceInput = raw_pointer_cast(&(first[0]));
    T *deviceOutput = raw_pointer_cast(&(output[0]));
    T *deviceAuxArray, *deviceAuxScannedArray;
    int number_of_elements = last - first;
    cudaMalloc(&deviceAuxArray, (BLOCK_SIZE << 1) * sizeof(T));
    cudaMalloc(&deviceAuxScannedArray, (BLOCK_SIZE << 1) * sizeof(T));
    // cudaMemset(deviceOutput, 0, number_of_elements*sizeof(T));
    int numBlocks = ceil((T)number_of_elements/(BLOCK_SIZE<<1));
    dim3 dimGrid(numBlocks, 1, 1);
    dim3 dimBlock(BLOCK_SIZE, 1, 1);
    scan<<<dimGrid, dimBlock, BLOCK_SIZE*2*sizeof(T)>>>(deviceInput, deviceOutput, deviceAuxArray, number_of_elements);
    cudaDeviceSynchronize();
    scan<<<dim3(1,1,1), dimBlock,BLOCK_SIZE*2*sizeof(T)>>>(deviceAuxArray, deviceAuxScannedArray, (T*)nullptr, BLOCK_SIZE << 1);
    cudaDeviceSynchronize();
    fixup<<<dimGrid, dimBlock>>>(deviceOutput, deviceAuxScannedArray, number_of_elements);
    cudaDeviceSynchronize();
    cudaFree(deviceAuxArray);
    cudaFree(deviceAuxScannedArray);
  }
};
