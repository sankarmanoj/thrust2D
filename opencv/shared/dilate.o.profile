==4890== NVPROF is profiling process 4890, command: ./dilate.o
==4890== Profiling application: ./dilate.o
==4890== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.11%  178.44us         1  178.44us  178.44us  178.44us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, dilateFunctor)
 24.20%  84.487us         6  14.081us     577ns  79.653us  [CUDA memcpy HtoD]
 21.45%  74.885us         1  74.885us  74.885us  74.885us  [CUDA memcpy DtoH]
  2.55%  8.8970us         2  4.4480us  3.9360us  4.9610us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.70%  2.4320us         1  2.4320us  2.4320us  2.4320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4890== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.59%  623.74ms         8  77.967ms  6.1920us  622.38ms  cudaMalloc
  1.73%  11.167ms        90  124.07us     122ns  4.0290ms  cuDeviceGetAttribute
  1.30%  8.3837ms         1  8.3837ms  8.3837ms  8.3837ms  cudaGetDeviceProperties
  0.10%  626.04us         1  626.04us  626.04us  626.04us  cuDeviceTotalMem
  0.09%  550.10us         4  137.52us  7.8480us  509.57us  cudaLaunch
  0.07%  471.73us         6  78.622us  6.2550us  350.26us  cudaMemcpy
  0.06%  405.16us         1  405.16us  405.16us  405.16us  cuDeviceGetName
  0.04%  233.54us         3  77.845us  41.058us  115.34us  cudaFree
  0.02%  134.81us         1  134.81us  134.81us  134.81us  cudaMemcpyAsync
  0.00%  31.655us        12  2.6370us  2.2440us  4.3110us  cudaFuncGetAttributes
  0.00%  5.1930us        11     472ns     341ns  1.1020us  cudaDeviceGetAttribute
  0.00%  5.1640us         9     573ns     321ns  1.4540us  cudaGetDevice
  0.00%  4.9150us         7     702ns     172ns  3.0240us  cudaSetupArgument
  0.00%  4.3050us         3  1.4350us     984ns  1.9750us  cudaEventCreateWithFlags
  0.00%  3.6710us         3  1.2230us     887ns  1.5970us  cudaEventRecord
  0.00%  3.2260us         4     806ns     281ns  1.6790us  cudaConfigureCall
  0.00%  2.8710us         3     957ns     715ns  1.2190us  cudaEventDestroy
  0.00%  1.8450us         2     922ns     252ns  1.5930us  cuDeviceGetCount
  0.00%  1.2840us         1  1.2840us  1.2840us  1.2840us  cudaGetLastError
  0.00%     791ns         2     395ns     182ns     609ns  cuDeviceGet
