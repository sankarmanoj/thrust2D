namespace thrust
{
  template <class Iterator,class Func>
  __global__ void for_each_kernel(long number_of_elements,Iterator data, Func f)
  {
    extern __shared__ char  byte_shared_memory[];
    typedef typename Iterator::value_type T;
    T *shared_memory = (T*) byte_shared_memory;
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
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);

    int min_grid_size,block_size,grid_size;
    cudaOccupancyMaxPotentialBlockSize(&min_grid_size,&block_size,for_each_kernel<Iterator,Func>,sizeof(T)*properties.maxThreadsPerBlock);
    grid_size = (number_of_elements + block_size - 1) / block_size;
    for_each_kernel<<<grid_size,block_size,sizeof(T)*properties.maxThreadsPerBlock>>>(number_of_elements,begin1,f);
  }

  template <class Iterator1,class Iterator2, class Func>
  __global__ void unary_transform_kernel(long number_of_elements,Iterator1 input_data,Iterator2 output_data, Func f)
  {
    extern __shared__ char byte_shared_memory[];
    typedef typename Iterator1::value_type T1;
    T1 *shared_memory = (T1*) byte_shared_memory;
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
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);

    int min_grid_size,block_size,grid_size;
    cudaOccupancyMaxPotentialBlockSize(&min_grid_size,&block_size,unary_transform_kernel<Iterator1,Iterator2,Func>,sizeof(T1)*properties.maxThreadsPerBlock);
    grid_size = (number_of_elements + block_size - 1) / block_size;
    unary_transform_kernel<<<grid_size,block_size,sizeof(T1)*properties.maxThreadsPerBlock>>>(number_of_elements,begin1,begin2,f);
  }
  template  <class Iterator1,class Iterator2,class Iterator3, class Func>
  __global__ void binary_transform_kernel(long number_of_elements,Iterator1 input_data1,Iterator2 input_data2,Iterator3 output_data, Func f)
  {
    extern __shared__ char byte_shared_memory[];
    typedef typename Iterator1::value_type T1;
    typedef typename Iterator2::value_type T2;
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
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);

    int min_grid_size,block_size,grid_size;
    cudaOccupancyMaxPotentialBlockSize(&min_grid_size,&block_size,binary_transform_kernel<Iterator1,Iterator2,Iterator3,Func>,(sizeof(T1)+ sizeof(T2))*properties.maxThreadsPerBlock);
    grid_size = (number_of_elements + block_size - 1) / block_size;
    binary_transform_kernel<<<grid_size,block_size,(sizeof(T1)+ sizeof(T2))*properties.maxThreadsPerBlock>>>(number_of_elements,begin1,begin2,begin3,f);
  }

  template  <class Iterator1,class Iterator2,class Iterator3, class Func>
  __global__ void first_transform_kernel(long number_of_elements,Iterator1 input_data1,Iterator2 input_data2,Iterator3 output_data, Func f)
  {
    extern __shared__ char byte_shared_memory[];
    typedef typename Iterator1::value_type T1;
    typedef typename Iterator2::value_type T2;
    T1 * shared_memory_1 = (T1*)byte_shared_memory;
    long index = blockIdx.x*blockDim.x + threadIdx.x;
    if (index>=number_of_elements)
      return;
    shared_memory_1[threadIdx.x] = input_data1[index];
    output_data[index]=f(shared_memory_1[threadIdx.x],*((&input_data2[index]).get()));
  }

  template <class Iterator1,class Iterator2,class Iterator3, class Func>
  void transform(cuda::shared_first_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Iterator3 begin3,Func f)
  {
    long number_of_elements = end1 - begin1;
    typedef typename Iterator1::value_type T1;
    typedef typename Iterator2::value_type T2;
    typedef typename Iterator3::value_type T3;
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);
    int min_grid_size,block_size,grid_size;
    cudaOccupancyMaxPotentialBlockSize(&min_grid_size,&block_size,binary_transform_kernel<Iterator1,Iterator2,Iterator3,Func>,(sizeof(T1))*properties.maxThreadsPerBlock);
    grid_size = (number_of_elements + block_size - 1) / block_size;
    first_transform_kernel<<<grid_size,block_size,(sizeof(T1))*properties.maxThreadsPerBlock>>>(number_of_elements,begin1,begin2,begin3,f);
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
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);

    conv_Kernel<<<(N+properties.maxThreadsPerBlock-1)/properties.maxThreadsPerBlock,properties.maxThreadsPerBlock>>>(a.data().get(), b.data().get(), c->data().get(), N, P);
  }

  template <class T>
  __global__ void conv_shared_Kernel(const T * __restrict__ A, constant_vector<T> B, T *C, const int N, const int P)
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
        if (idx >= radius)
          sA[threadIdx.x] = A[idx - radius];
        if ((idx + blockDim.x)< N)
          sA[blockDim.x + lidx] = A[idx + blockDim.x];
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
    static cudaDeviceProp properties;
    if(properties.maxThreadsPerBlock==0)
      cudaGetDeviceProperties(&properties,0);

    conv_shared_Kernel<<<(N+256-1)/256,256,(256 + 2*P)*sizeof(T)>>>(a.data().get(),constant_vector<T>(b.begin(),b.end()), c->data().get(), N, P);
  }
}
