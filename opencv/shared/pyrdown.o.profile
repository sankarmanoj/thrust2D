==12186== NVPROF is profiling process 12186, command: ./pyrdown.o
==12186== Profiling application: ./pyrdown.o
==12186== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.98%  2.0655ms         2  1.0327ms  256.57us  1.8089ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 39.69%  1.5186ms         1  1.5186ms  1.5186ms  1.5186ms  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
  4.91%  187.68us        22  8.5300us     704ns  172.74us  [CUDA memcpy HtoD]
  1.43%  54.528us        19  2.8690us     320ns  43.392us  [CUDA memcpy DtoH]

==12186== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.88%  5.33509s         5  1.06702s  9.7120us  5.33449s  cudaMalloc
  0.04%  2.2331ms         2  1.1166ms  258.06us  1.9751ms  cudaDeviceSynchronize
  0.03%  1.6971ms         4  424.27us  11.151us  1.6480ms  cudaMemcpy
  0.01%  658.16us         3  219.39us  31.517us  586.94us  cudaLaunch
  0.01%  506.78us         2  253.39us  219.48us  287.30us  cudaGetDeviceProperties
  0.01%  303.05us         1  303.05us  303.05us  303.05us  cudaMemcpy2D
  0.01%  291.79us        36  8.1050us  3.4500us  20.449us  cudaMemcpyAsync
  0.00%  256.69us        91  2.8200us     142ns  96.418us  cuDeviceGetAttribute
  0.00%  181.30us         1  181.30us  181.30us  181.30us  cuDeviceTotalMem
  0.00%  85.481us         2  42.740us  14.021us  71.460us  cudaFree
  0.00%  37.916us         1  37.916us  37.916us  37.916us  cuDeviceGetName
  0.00%  35.316us         1  35.316us  35.316us  35.316us  cudaCreateTextureObject
  0.00%  29.345us         1  29.345us  29.345us  29.345us  cudaMallocPitch
  0.00%  27.095us         8  3.3860us  2.1860us  5.8510us  cudaFuncGetAttributes
  0.00%  7.5140us         2  3.7570us  2.1500us  5.3640us  cudaEventCreateWithFlags
  0.00%  6.4140us         6  1.0690us     346ns  2.6300us  cudaGetDevice
  0.00%  6.3080us        11     573ns     423ns  1.4140us  cudaDeviceGetAttribute
  0.00%  5.6070us         2  2.8030us  2.3350us  3.2720us  cudaEventRecord
  0.00%  4.0790us         2  2.0390us  1.6210us  2.4580us  cudaEventDestroy
  0.00%  3.8660us         3  1.2880us     197ns  2.9940us  cuDeviceGetCount
  0.00%  3.1820us         3  1.0600us     970ns  1.1730us  cudaConfigureCall
  0.00%  2.2510us         5     450ns     200ns     677ns  cudaSetupArgument
  0.00%  1.7110us         3     570ns     297ns  1.1030us  cuDeviceGet
  0.00%     476ns         1     476ns     476ns     476ns  cudaCreateChannelDesc
