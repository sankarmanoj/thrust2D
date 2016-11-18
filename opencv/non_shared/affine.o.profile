==8680== NVPROF is profiling process 8680, command: ./affine.o
==8680== Profiling application: ./affine.o
==8680== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.39%  85.471us        10  8.5470us  1.1840us  74.527us  [CUDA memcpy HtoD]
 33.32%  74.174us         1  74.174us  74.174us  74.174us  [CUDA memcpy DtoH]
 24.78%  55.167us         1  55.167us  55.167us  55.167us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.51%  7.8080us         3  2.6020us  1.1200us  3.5840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8680== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.58%  575.32ms         6  95.887ms  8.2440us  574.79ms  cudaMalloc
  1.17%  6.8481ms        90  76.090us     143ns  3.4818ms  cuDeviceGetAttribute
  0.08%  442.89us         1  442.89us  442.89us  442.89us  cuDeviceTotalMem
  0.04%  258.40us         4  64.600us  9.1760us  210.85us  cudaMemcpy
  0.03%  178.98us         1  178.98us  178.98us  178.98us  cuDeviceGetName
  0.03%  165.87us         3  55.289us  10.338us  129.45us  cudaFree
  0.03%  152.39us         7  21.769us  3.2020us  127.49us  cudaMemcpyAsync
  0.02%  100.71us         4  25.177us  11.668us  42.201us  cudaLaunch
  0.01%  57.355us         1  57.355us  57.355us  57.355us  cudaDeviceSynchronize
  0.01%  44.840us        16  2.8020us  1.9530us  5.8270us  cudaFuncGetAttributes
  0.00%  7.8950us        12     657ns     322ns  1.7880us  cudaGetDevice
  0.00%  7.3950us         4  1.8480us  1.0760us  2.4850us  cudaEventCreateWithFlags
  0.00%  7.3810us         4  1.8450us     291ns  6.1690us  cudaSetupArgument
  0.00%  5.9830us         4  1.4950us     962ns  1.9780us  cudaEventRecord
  0.00%  5.0310us        11     457ns     294ns  1.3320us  cudaDeviceGetAttribute
  0.00%  4.7180us         4  1.1790us     794ns  1.5970us  cudaEventDestroy
  0.00%  3.2620us         4     815ns     376ns  1.2620us  cudaConfigureCall
  0.00%  2.8730us         2  1.4360us     774ns  2.0990us  cuDeviceGetCount
  0.00%     749ns         2     374ns     296ns     453ns  cuDeviceGet
