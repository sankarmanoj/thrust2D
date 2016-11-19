==16723== NVPROF is profiling process 16723, command: ./gaussian_filter.o
==16723== Profiling application: ./gaussian_filter.o
==16723== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.11%  285.84us        25  11.433us     512ns  270.51us  [CUDA memcpy HtoD]
 30.57%  235.44us         1  235.44us  235.44us  235.44us  void thrust::transform_texture_kernel<float, convolutionFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 29.71%  228.82us        19  12.042us     288ns  220.24us  [CUDA memcpy DtoH]
  1.15%  8.8640us         3  2.9540us  1.2480us  4.0640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.10%  8.4480us         1  8.4480us  8.4480us  8.4480us  [CUDA memcpy DtoD]
  0.37%  2.8480us         1  2.8480us  2.8480us  2.8480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16723== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.07%  933.30ms        10  93.330ms  8.0600us  924.27ms  cudaMalloc
  1.69%  16.576ms         1  16.576ms  16.576ms  16.576ms  cudaGetDeviceProperties
  1.20%  11.796ms        91  129.62us     133ns  3.7945ms  cuDeviceGetAttribute
  0.88%  8.6035ms         1  8.6035ms  8.6035ms  8.6035ms  cudaMallocPitch
  0.78%  7.6756ms         4  1.9189ms  45.637us  4.1294ms  cudaFree
  0.15%  1.4768ms         7  210.98us  8.6120us  1.2536ms  cudaMemcpy
  0.07%  667.84us        37  18.049us  2.0470us  454.26us  cudaMemcpyAsync
  0.06%  564.33us         1  564.33us  564.33us  564.33us  cudaMemcpy2D
  0.04%  430.83us         1  430.83us  430.83us  430.83us  cuDeviceTotalMem
  0.02%  202.29us         5  40.458us  14.543us  57.540us  cudaLaunch
  0.02%  176.64us         1  176.64us  176.64us  176.64us  cuDeviceGetName
  0.01%  71.542us        16  4.4710us  2.2310us  21.352us  cudaFuncGetAttributes
  0.00%  35.404us         1  35.404us  35.404us  35.404us  cudaCreateTextureObject
  0.00%  14.266us        12  1.1880us     375ns  3.4490us  cudaGetDevice
  0.00%  11.048us         4  2.7620us  1.5120us  3.6530us  cudaEventCreateWithFlags
  0.00%  8.4560us         8  1.0570us     117ns  4.9810us  cudaSetupArgument
  0.00%  8.2380us         4  2.0590us  1.2130us  2.5270us  cudaEventRecord
  0.00%  6.7720us         3  2.2570us     209ns  4.6540us  cuDeviceGetCount
  0.00%  6.6050us         5  1.3210us     377ns  2.0150us  cudaConfigureCall
  0.00%  6.2310us         3  2.0770us     860ns  4.4830us  cuDeviceGet
  0.00%  5.8340us        11     530ns     305ns  1.6910us  cudaDeviceGetAttribute
  0.00%  5.8160us         4  1.4540us  1.0220us  1.7870us  cudaEventDestroy
  0.00%     360ns         1     360ns     360ns     360ns  cudaCreateChannelDesc
