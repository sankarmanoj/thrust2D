==11608== NVPROF is profiling process 11608, command: ./hotspot_foreach.out 1024 2 2 temp_1024 power_1024 result_foreach.out
==11608== Profiling application: ./hotspot_foreach.out 1024 2 2 temp_1024 power_1024 result_foreach.out
==11608== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.94%  44.340ms         1  44.340ms  44.340ms  44.340ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<HotspotFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.95%  889.75us         6  148.29us  1.2150us  456.12us  [CUDA memcpy HtoD]
  1.12%  511.99us         1  511.99us  511.99us  511.99us  [CUDA memcpy DtoH]

==11608== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.49%  823.19ms         2  411.59ms  347.00us  822.84ms  cudaMallocPitch
  5.09%  44.346ms         1  44.346ms  44.346ms  44.346ms  cudaDeviceSynchronize
  0.19%  1.6912ms         3  563.75us  483.46us  673.22us  cudaMemcpy2D
  0.08%  680.99us         1  680.99us  680.99us  680.99us  cudaLaunch
  0.05%  451.52us        90  5.0160us     165ns  176.70us  cuDeviceGetAttribute
  0.04%  368.24us         4  92.060us  4.7150us  349.82us  cudaMalloc
  0.03%  282.99us         1  282.99us  282.99us  282.99us  cuDeviceTotalMem
  0.01%  86.669us         4  21.667us  4.7390us  65.356us  cudaMemcpy
  0.00%  40.157us         1  40.157us  40.157us  40.157us  cuDeviceGetName
  0.00%  7.0530us         4  1.7630us  1.4220us  2.6880us  cudaFuncGetAttributes
  0.00%  3.1120us        11     282ns     210ns     759ns  cudaDeviceGetAttribute
  0.00%  2.8010us         1  2.8010us  2.8010us  2.8010us  cudaEventCreateWithFlags
  0.00%  2.2390us         1  2.2390us  2.2390us  2.2390us  cudaEventRecord
  0.00%  1.5070us         2     753ns     208ns  1.2990us  cuDeviceGetCount
  0.00%  1.4470us         3     482ns     211ns     975ns  cudaGetDevice
  0.00%  1.1180us         1  1.1180us  1.1180us  1.1180us  cudaEventDestroy
  0.00%     716ns         1     716ns     716ns     716ns  cudaConfigureCall
  0.00%     606ns         2     303ns     178ns     428ns  cuDeviceGet
  0.00%     320ns         1     320ns     320ns     320ns  cudaSetupArgument
