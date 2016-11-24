==29346== NVPROF is profiling process 29346, command: ./sobel_filter.o
==29346== Profiling application: ./sobel_filter.o
==29346== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 27.77%  225.99us         1  225.99us  225.99us  225.99us  [CUDA memcpy DtoH]
 18.48%  150.37us         7  21.481us     704ns  144.87us  [CUDA memcpy HtoD]
 17.76%  144.55us         4  36.136us  14.560us  54.721us  [CUDA memcpy DtoA]
 10.02%  81.505us         1  81.505us  81.505us  81.505us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.44%  68.672us         2  34.336us  32.384us  36.288us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.03%  65.312us         4  16.328us  13.568us  22.688us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.84%  39.392us         2  19.696us  19.648us  19.744us  void thrust::convolutionColumnsKernel<float>(float*, int, int, unsigned __int64)
  4.67%  37.984us         2  18.992us  15.872us  22.112us  void thrust::convolutionRowsKernel<float>(float*, int, int, unsigned __int64)

==29346== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.91%  819.23ms        10  81.923ms  8.2900us  815.86ms  cudaMalloc
  0.80%  6.6599ms         2  3.3300ms  1.4466ms  5.2133ms  cudaMallocArray
  0.49%  4.0752ms         4  1.0188ms  35.322us  3.4490ms  cudaFree
  0.43%  3.5822ms        91  39.364us     154ns  3.0221ms  cuDeviceGetAttribute
  0.19%  1.5617ms         5  312.35us  16.303us  663.95us  cudaMemcpy
  0.04%  323.40us         1  323.40us  323.40us  323.40us  cuDeviceGetName
  0.03%  259.68us         1  259.68us  259.68us  259.68us  cudaMemcpyAsync
  0.03%  253.93us         1  253.93us  253.93us  253.93us  cuDeviceTotalMem
  0.03%  224.81us        11  20.437us  7.3820us  58.568us  cudaLaunch
  0.03%  210.62us         4  52.655us  13.641us  110.54us  cudaMemcpyToArray
  0.02%  127.19us         2  63.596us  50.817us  76.375us  cudaMemcpyToSymbol
  0.01%  59.817us        28  2.1360us  1.4140us  5.6280us  cudaFuncGetAttributes
  0.00%  34.833us         4  8.7080us  3.5310us  15.477us  cudaCreateTextureObject
  0.00%  13.376us         7  1.9100us     911ns  3.1270us  cudaEventCreateWithFlags
  0.00%  12.638us        23     549ns     115ns  4.0970us  cudaSetupArgument
  0.00%  12.125us        21     577ns     204ns  2.7210us  cudaGetDevice
  0.00%  11.067us         7  1.5810us     530ns  3.2360us  cudaEventRecord
  0.00%  8.8500us         7  1.2640us     432ns  2.4840us  cudaEventDestroy
  0.00%  8.6800us        11     789ns     215ns  1.8230us  cudaConfigureCall
  0.00%  4.4560us        11     405ns     209ns  1.3260us  cudaDeviceGetAttribute
  0.00%  3.4770us         3  1.1590us     262ns  2.8490us  cuDeviceGet
  0.00%  3.3840us         3  1.1280us     235ns  1.6510us  cuDeviceGetCount
  0.00%     496ns         2     248ns     140ns     356ns  cudaCreateChannelDesc
