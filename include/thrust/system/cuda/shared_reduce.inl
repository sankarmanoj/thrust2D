namespace thrust
{
  template <class T>
  __global__ void reduce_kernel (T *start,T* output,int N)
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
};
