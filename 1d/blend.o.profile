==14447== NVPROF is profiling process 14447, command: ./blend.o
==14447== Profiling application: ./blend.o
==14447== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 79.44%  205.99us         2  102.99us  40.224us  165.76us  [CUDA memcpy HtoD]
 15.28%  39.617us         1  39.617us  39.617us  39.617us  [CUDA memcpy DtoH]
  4.07%  10.560us         1  10.560us  10.560us  10.560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.21%  3.1360us         1  3.1360us  3.1360us  3.1360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==14447== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.73%  868.69ms         3  289.56ms  4.5620us  868.20ms  cudaMalloc
  0.07%  606.20us         1  606.20us  606.20us  606.20us  cudaGetDeviceProperties
  0.06%  564.96us         3  188.32us  84.449us  277.63us  cudaMemcpyAsync
  0.06%  549.95us        90  6.1100us     101ns  238.40us  cuDeviceGetAttribute
  0.04%  343.57us         3  114.52us  7.3510us  183.22us  cudaFree
  0.02%  183.66us         1  183.66us  183.66us  183.66us  cuDeviceTotalMem
  0.00%  36.395us         1  36.395us  36.395us  36.395us  cuDeviceGetName
  0.00%  19.216us         2  9.6080us  6.4860us  12.730us  cudaLaunch
  0.00%  12.838us         8  1.6040us  1.3990us  2.6250us  cudaFuncGetAttributes
  0.00%  3.0980us        11     281ns     209ns     734ns  cudaDeviceGetAttribute
  0.00%  2.0630us         2  1.0310us     719ns  1.3440us  cudaEventCreateWithFlags
  0.00%  2.0090us         6     334ns     207ns     712ns  cudaGetDevice
  0.00%  1.6320us         2     816ns     398ns  1.2340us  cuDeviceGetCount
  0.00%  1.6290us         2     814ns     558ns  1.0710us  cudaEventRecord
  0.00%  1.4190us         2     709ns     445ns     974ns  cudaEventDestroy
  0.00%  1.1180us         2     559ns     224ns     894ns  cudaConfigureCall
  0.00%     703ns         2     351ns     200ns     503ns  cudaSetupArgument
  0.00%     420ns         2     210ns     159ns     261ns  cuDeviceGet
