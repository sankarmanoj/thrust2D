==12760== NVPROF is profiling process 12760, command: ./dilate.o
==12760== Profiling application: ./dilate.o
==12760== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.37%  4.1673ms         2  2.0837ms  2.0725ms  2.0949ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 34.60%  3.4850ms         1  3.4850ms  3.4850ms  3.4850ms  void thrust::transform_texture_kernel<float, dilateFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, dilateFunctor)
 20.58%  2.0735ms         1  2.0735ms  2.0735ms  2.0735ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.71%  171.93us         1  171.93us  171.93us  171.93us  [CUDA memcpy DtoH]
  1.66%  167.29us         6  27.881us     704ns  163.16us  [CUDA memcpy HtoD]
  0.08%  8.2560us         1  8.2560us  8.2560us  8.2560us  [CUDA memcpy DtoD]

==12760== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.31%  1.78476s         8  223.09ms  4.4710us  1.78393s  cudaMalloc
  0.35%  6.2505ms         3  2.0835ms  2.0759ms  2.0980ms  cudaDeviceSynchronize
  0.22%  4.0223ms         6  670.39us  3.1250us  3.9851ms  cudaMemcpy
  0.03%  552.06us         4  138.01us  9.1280us  516.42us  cudaLaunch
  0.02%  384.77us         2  192.38us  159.78us  224.99us  cudaGetDeviceProperties
  0.02%  345.76us         1  345.76us  345.76us  345.76us  cudaMallocPitch
  0.01%  261.52us         3  87.174us  16.058us  147.32us  cudaFree
  0.01%  186.05us        91  2.0440us      94ns  72.221us  cuDeviceGetAttribute
  0.01%  155.89us         1  155.89us  155.89us  155.89us  cuDeviceTotalMem
  0.01%  132.17us         1  132.17us  132.17us  132.17us  cudaMemcpyAsync
  0.00%  22.638us        12  1.8860us  1.3580us  3.8720us  cudaFuncGetAttributes
  0.00%  20.077us         1  20.077us  20.077us  20.077us  cuDeviceGetName
  0.00%  16.041us         1  16.041us  16.041us  16.041us  cudaMemcpy2D
  0.00%  8.4180us         1  8.4180us  8.4180us  8.4180us  cudaCreateTextureObject
  0.00%  4.5980us         9     510ns     201ns  1.4460us  cudaGetDevice
  0.00%  4.4990us         3  1.4990us     996ns  1.8270us  cudaEventCreateWithFlags
  0.00%  3.5120us        11     319ns     199ns     859ns  cudaDeviceGetAttribute
  0.00%  3.3410us         3  1.1130us     765ns  1.6830us  cudaEventRecord
  0.00%  2.6620us         3     887ns     690ns  1.1520us  cudaEventDestroy
  0.00%  1.9810us         4     495ns     348ns     814ns  cudaConfigureCall
  0.00%  1.5740us         7     224ns     111ns     473ns  cudaSetupArgument
  0.00%  1.3720us         3     457ns     138ns  1.0500us  cuDeviceGetCount
  0.00%     669ns         3     223ns      95ns     341ns  cuDeviceGet
  0.00%     163ns         1     163ns     163ns     163ns  cudaCreateChannelDesc
