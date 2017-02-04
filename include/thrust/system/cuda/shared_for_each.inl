namespace thrust
{
  template <class T,class Func>
  __global__ void for_each_kernel(long number_of_elements,T * data, Func f)
  {
    extern __shared__ char  byte_shared_memory[];
    T *shared_memory = (T*)byte_shared_memory;
    long index = blockIdx.x*blockDim.x + threadIdx.x;
    if (index>=number_of_elements)
      return;
    shared_memory[threadIdx.x] = data[index];
    f(shared_memory[threadIdx.x]);
    data[index]=shared_memory[threadIdx.x];

  }
  template <class Iterator,class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f)
  {
    long number_of_elements = end1 - begin1;
    typedef typename Iterator::value_type T;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    T * data_pointer = raw_pointer_cast(&begin1[0]);
    long number_of_blocks = iDivUp(number_of_elements,properties.maxThreadsPerBlock);
    for_each_kernel<<<number_of_blocks,properties.maxThreadsPerBlock,sizeof(T)*properties.maxThreadsPerBlock>>>(number_of_elements,data_pointer,f);
  }


template <class T>
__global__ void conv_Kernel(const T * __restrict__ A, const T * __restrict__ B, T *C, const int N, const int P)
  {
      int idx = threadIdx.x+blockDim.x*blockIdx.x;
      int radius = (P-1)/2;
      if ((idx < (N-radius)) && (idx >= radius))
      {
        T my_sum = 0;
        for (int j = -radius; j <= radius; j++)
          my_sum += A[idx+j]*B[j+radius];
        C[idx] = my_sum;
        // printf("%d %f %f\n",idx,A[idx],C[idx]);
      }
  }

  template <class T>
  void convolve(device_vector<T> a, device_vector<T> b, device_vector<T> *c)
  {
    int N = a.size();
    int P = b.size();
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    conv_Kernel<<<(N+properties.maxThreadsPerBlock-1)/properties.maxThreadsPerBlock,properties.maxThreadsPerBlock>>>(a.data().get(), b.data().get(), c->data().get(), N, P);
  }

  template <class T>
  __global__ void conv_shared_Kernel(const T * __restrict__ A, const T * __restrict__ B, T *C, const int N, const int P)
  {
      extern __shared__ char byte_sA[];//[nTPB+FSIZE];
      // extern __shared__ T sB[];//[FSIZE];
      T *sA = (T*)byte_sA;
      int idx = threadIdx.x+blockDim.x*blockIdx.x;
      int radius = (P-1)/2;
      int lidx = threadIdx.x + radius;
      if (threadIdx.x < P) sA[blockDim.x + P + threadIdx.x] = B[threadIdx.x];
      if (idx < N)
      {
        sA[lidx] = A[idx];
        if (threadIdx.x < radius)
        {
          if (idx >= radius)   sA[threadIdx.x] = A[idx - radius];
          if ((idx + blockDim.x)< N) sA[blockDim.x + lidx] = A[idx + blockDim.x];
        }
      }
      __syncthreads();
      if ((idx < (N-radius)) && (idx >= radius))
      {
        T my_sum = 0;
        for (int j = -radius; j <= radius; j++)
          my_sum += sA[lidx+j] * sA[blockDim.x + P + j+radius];
        C[idx] = my_sum;
      }
  }

  template <class T>
  void convolve(cuda::shared_policy,device_vector<T> a, device_vector<T> b, device_vector<T> *c)
  {
    int N = a.size();
    int P = b.size();
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    conv_shared_Kernel<<<(N+properties.maxThreadsPerBlock-1)/properties.maxThreadsPerBlock,properties.maxThreadsPerBlock,(properties.maxThreadsPerBlock + 2*P)*sizeof(T)>>>(a.data().get(), b.data().get(), c->data().get(), N, P);
  }


  template <class T1,class T2,class Func>
  __global__ void unary_transform_kernel(long number_of_elements,T1 * input_data,T2 * output_data, Func f)
  {
    extern __shared__ char byte_shared_memory[];
    T1 *shared_memory = (T1*)byte_shared_memory;
    long index = blockIdx.x*blockDim.x + threadIdx.x;
    if (index>=number_of_elements)
      return;
    shared_memory[threadIdx.x] = input_data[index];
    output_data[index]=f(shared_memory[threadIdx.x]);
  }
  template <class Iterator1,class Iterator2, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Func f)
  {
    long number_of_elements = end1 - begin1;
    typedef typename Iterator1::value_type T1;
    typedef typename Iterator2::value_type T2;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    T1 * input_data_pointer = raw_pointer_cast(&begin1[0]);
    T2 * output_data_pointer = raw_pointer_cast(&begin2[0]);
    long number_of_blocks = iDivUp(number_of_elements,properties.maxThreadsPerBlock);
    unary_transform_kernel<<<number_of_blocks,properties.maxThreadsPerBlock,sizeof(T1)*properties.maxThreadsPerBlock>>>(number_of_elements,input_data_pointer,output_data_pointer,f);
  }
  template  <class T1,class T2,class T3,class Func>
  __global__ void binary_transform_kernel(long number_of_elements,T1 * input_data1,T2 *input_data2,T3 * output_data, Func f)
  {
    extern __shared__ char byte_shared_memory[];
    T1 * shared_memory_1 = (T1*)byte_shared_memory;
    T2 * shared_memory_2 = (T2*)(byte_shared_memory+sizeof(T1)*blockDim.x);
    long index = blockIdx.x*blockDim.x + threadIdx.x;
    if (index>=number_of_elements)
      return;
    shared_memory_1[threadIdx.x] = input_data1[index];
    shared_memory_2[threadIdx.x] = input_data2[index];
    output_data[index]=f(shared_memory_1[threadIdx.x],shared_memory_2[threadIdx.x]);
  }
  template <class Iterator1,class Iterator2,class Iterator3, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Iterator3 begin3,Func f)
  {
    long number_of_elements = end1 - begin1;
    typedef typename Iterator1::value_type T1;
    typedef typename Iterator2::value_type T2;
    typedef typename Iterator3::value_type T3;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    T1 * input_data_pointer1 = raw_pointer_cast(&begin1[0]);
    T2 * input_data_pointer2 = raw_pointer_cast(&begin2[0]);
    T3 * output_data_pointer = raw_pointer_cast(&begin3[0]);
    long number_of_blocks = iDivUp(number_of_elements,properties.maxThreadsPerBlock);
    binary_transform_kernel<<<number_of_blocks,properties.maxThreadsPerBlock,(sizeof(T1)+ sizeof(T2))*properties.maxThreadsPerBlock >>>(number_of_elements,input_data_pointer1,input_data_pointer2,output_data_pointer,f);
  }
}
