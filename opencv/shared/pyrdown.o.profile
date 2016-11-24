==8351== NVPROF is profiling process 8351, command: ./pyrdown.o
==8351== Profiling application: ./pyrdown.o
==8351== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.17%  22.720us         4  5.6800us  1.1840us  19.104us  [CUDA memcpy HtoD]
 23.24%  16.416us         2  8.2080us  7.9360us  8.4800us  [CUDA memcpy DtoA]
 11.19%  7.9040us         1  7.9040us  7.9040us  7.9040us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 10.51%  7.4240us         1  7.4240us  7.4240us  7.4240us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  8.11%  5.7280us         1  5.7280us  5.7280us  5.7280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.57%  5.3440us         2  2.6720us  1.4080us  3.9360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.20%  5.0880us         1  5.0880us  5.0880us  5.0880us  [CUDA memcpy DtoH]

==8351== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.83%  193.63ms         5  38.727ms  6.0150us  192.96ms  cudaMalloc
  0.44%  852.64us         1  852.64us  852.64us  852.64us  cuDeviceTotalMem
  0.37%  720.66us        90  8.0070us     510ns  281.03us  cuDeviceGetAttribute
  0.17%  333.22us         1  333.22us  333.22us  333.22us  cudaMallocArray
  0.05%  107.54us         2  53.770us  6.9700us  100.57us  cudaFree
  0.03%  66.130us         1  66.130us  66.130us  66.130us  cuDeviceGetName
  0.03%  52.000us         3  17.333us  5.9650us  35.948us  cudaMemcpy
  0.02%  43.063us         5  8.6120us  5.3080us  15.556us  cudaLaunch
  0.02%  38.046us         2  19.023us  8.6560us  29.390us  cudaMemcpyToArray
  0.01%  19.238us        12  1.6030us  1.3260us  3.1160us  cudaFuncGetAttributes
  0.01%  14.344us         1  14.344us  14.344us  14.344us  cudaMemcpyAsync
  0.01%  10.287us         2  5.1430us  2.3440us  7.9430us  cudaCreateTextureObject
  0.00%  6.6800us         1  6.6800us  6.6800us  6.6800us  cudaMemcpyToSymbol
  0.00%  4.5560us         2  2.2780us     837ns  3.7190us  cuDeviceGetCount
  0.00%  4.3950us        11     399ns     111ns  2.6950us  cudaSetupArgument
  0.00%  3.6970us         9     410ns     201ns  1.2320us  cudaGetDevice
  0.00%  3.1570us         3  1.0520us     865ns  1.4190us  cudaEventCreateWithFlags
  0.00%  2.8880us         3     962ns     751ns  1.3760us  cudaEventRecord
  0.00%  2.7750us        11     252ns     196ns     666ns  cudaDeviceGetAttribute
  0.00%  2.0930us         3     697ns     577ns     927ns  cudaEventDestroy
  0.00%  1.6550us         5     331ns     168ns     699ns  cudaConfigureCall
  0.00%  1.6530us         2     826ns     613ns  1.0400us  cuDeviceGet
  0.00%     193ns         1     193ns     193ns     193ns  cudaCreateChannelDesc
