namespace thrust
{
  int iDivUp(int a, int b)
  {
      return (a % b != 0) ? (a / b + 1) : (a / b);
  }
  template <class T,class Func>
  __global__ void for_each_kernel(long number_of_elements,T * data, Func f)
  {
    extern __shared__ T shared_memory[];
    long index = blockIdx.x*blockDim.x + threadIdx.x;
    if (index>=number_of_elements)
      return;
    shared_memory[threadIdx.x] = data[index];
    f(shared_memory[threadIdx.x]);
    data[index]=shared_memory[threadIdx.x];

  }
  template <class T,class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f)
  {
    long number_of_elements = end1 - begin1;
    // typedef typename Iterator::base_value_type T;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    T * data_pointer = raw_pointer_cast(&begin1[0]);
    long number_of_blocks = iDivUp(number_of_elements,properties.maxThreadsPerBlock);
    for_each_kernel<<<number_of_blocks,properties.maxThreadsPerBlock,sizeof(T)*properties.maxThreadsPerBlock>>>(number_of_elements,data_pointer,f);
  }

  template <class T,class Func>
  __global__ void unary_transform_kernel(long number_of_elements,T * input_data,T * output_data, Func f)
  {
    extern __shared__ T shared_memory[];
    long index = blockIdx.x*blockDim.x + threadIdx.x;
    if (index>=number_of_elements)
      return;
    shared_memory[threadIdx.x] = input_data[index];
    output_data[index]=f(shared_memory[threadIdx.x]);
  }
  template <class T,class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2,Func f)
  {
    long number_of_elements = end1 - begin1;
    // typedef typename Iterator::base_value_type T;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    T * input_data_pointer = raw_pointer_cast(&begin1[0]);
    T * output_data_pointer = raw_pointer_cast(&begin2[0]);
    long number_of_blocks = iDivUp(number_of_elements,properties.maxThreadsPerBlock);
    unary_transform_kernel<<<number_of_blocks,properties.maxThreadsPerBlock,sizeof(T)*properties.maxThreadsPerBlock>>>(number_of_elements,input_data_pointer,output_data_pointer,f);
  }
  template <class T,class Func>
  __global__ void binary_transform_kernel(long number_of_elements,T * input_data1,T*input_data2,T * output_data, Func f)
  {
    extern __shared__ T shared_memory[];
    long index = blockIdx.x*blockDim.x + threadIdx.x;
    if (index>=number_of_elements)
      return;
    shared_memory[threadIdx.x] = input_data1[index];
    shared_memory[threadIdx.x + blockDim.x] = input_data2[index];
    output_data[index]=f(shared_memory[threadIdx.x],shared_memory[threadIdx.x + blockDim.x]);
  }
  template <class T,class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2,Iterator begin3,Func f)
  {
    long number_of_elements = end1 - begin1;
    // typedef typename Iterator::base_value_type T;
    cudaDeviceProp properties;
    cudaGetDeviceProperties(&properties,0);
    T * input_data_pointer1 = raw_pointer_cast(&begin1[0]);
    T * input_data_pointer2 = raw_pointer_cast(&begin2[0]);
    T * output_data_pointer = raw_pointer_cast(&begin3[0]);
    long number_of_blocks = iDivUp(number_of_elements,properties.maxThreadsPerBlock);
    binary_transform_kernel<<<number_of_blocks,properties.maxThreadsPerBlock,sizeof(T)*properties.maxThreadsPerBlock*2>>>(number_of_elements,input_data_pointer1,input_data_pointer2,output_data_pointer,f);
  }
}
