==16750== NVPROF is profiling process 16750, command: ./harris.o
==16750== Profiling application: ./harris.o
==16750== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.96%  138.84us        19  7.3070us     288ns  130.30us  [CUDA memcpy DtoH]
 35.42%  126.23us        24  5.2590us     512ns  113.75us  [CUDA memcpy HtoD]
 20.45%  72.892us         1  72.892us  72.892us  72.892us  void thrust::transform_texture_kernel<float, HarrisIntensityFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HarrisIntensityFunctor)
  2.83%  10.079us         3  3.3590us  1.3110us  4.5760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.33%  8.3190us         1  8.3190us  8.3190us  8.3190us  [CUDA memcpy DtoD]

==16750== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.20%  1.06350s         8  132.94ms  4.5030us  1.05888s  cudaMalloc
  1.20%  13.099ms        91  143.94us     140ns  9.1331ms  cuDeviceGetAttribute
  0.47%  5.1765ms         1  5.1765ms  5.1765ms  5.1765ms  cudaMallocPitch
  0.45%  4.9706ms         1  4.9706ms  4.9706ms  4.9706ms  cudaGetDeviceProperties
  0.35%  3.7775ms         3  1.2592ms  40.668us  3.3721ms  cudaFree
  0.17%  1.8592ms        37  50.249us  1.8140us  713.81us  cudaMemcpyAsync
  0.07%  751.44us         6  125.24us  3.4120us  623.52us  cudaMemcpy
  0.05%  502.06us         1  502.06us  502.06us  502.06us  cuDeviceTotalMem
  0.02%  204.14us         1  204.14us  204.14us  204.14us  cuDeviceGetName
  0.01%  139.11us         4  34.778us  20.153us  50.819us  cudaLaunch
  0.01%  61.943us         1  61.943us  61.943us  61.943us  cudaMemcpy2D
  0.00%  42.290us        12  3.5240us  1.3860us  14.237us  cudaFuncGetAttributes
  0.00%  16.599us         1  16.599us  16.599us  16.599us  cudaCreateTextureObject
  0.00%  14.749us        11  1.3400us     258ns  9.3570us  cudaDeviceGetAttribute
  0.00%  11.147us         9  1.2380us     223ns  4.0100us  cudaGetDevice
  0.00%  6.9500us         7     992ns     113ns  4.1400us  cudaSetupArgument
  0.00%  6.4690us         3  2.1560us  1.5960us  2.8220us  cudaEventCreateWithFlags
  0.00%  5.5490us         3  1.8490us  1.4400us  2.1870us  cudaEventRecord
  0.00%  4.6930us         4  1.1730us     848ns  1.4050us  cudaConfigureCall
  0.00%  3.9080us         3  1.3020us  1.1910us  1.5050us  cudaEventDestroy
  0.00%  3.3420us         3  1.1140us     197ns  1.9510us  cuDeviceGetCount
  0.00%  1.4050us         3     468ns     327ns     601ns  cuDeviceGet
  0.00%     187ns         1     187ns     187ns     187ns  cudaCreateChannelDesc
