==29474== NVPROF is profiling process 29474, command: ./scharr_filter.o
==29474== Profiling application: ./scharr_filter.o
==29474== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 23.62%  178.37us         1  178.37us  178.37us  178.37us  [CUDA memcpy DtoH]
 19.35%  146.15us         7  20.878us     704ns  140.99us  [CUDA memcpy HtoD]
 18.00%  135.91us         4  33.976us  12.225us  55.936us  [CUDA memcpy DtoA]
 10.64%  80.385us         1  80.385us  80.385us  80.385us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.55%  64.576us         2  32.288us  29.024us  35.552us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.38%  63.267us         4  15.816us  10.817us  23.744us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.76%  43.488us         2  21.744us  20.320us  23.168us  void thrust::convolutionRowsKernel<float>(float*, int, int, unsigned __int64)
  5.70%  43.041us         2  21.520us  21.184us  21.857us  void thrust::convolutionColumnsKernel<float>(float*, int, int, unsigned __int64)

==29474== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.31%  348.76ms        10  34.876ms  4.5850us  347.87ms  cudaMalloc
  0.23%  823.68us         5  164.74us  8.7160us  768.61us  cudaMemcpy
  0.17%  582.32us         2  291.16us  286.72us  295.60us  cudaMallocArray
  0.07%  242.32us        91  2.6620us     137ns  89.793us  cuDeviceGetAttribute
  0.05%  189.70us         4  47.425us  7.5690us  93.785us  cudaFree
  0.05%  176.56us         1  176.56us  176.56us  176.56us  cuDeviceTotalMem
  0.03%  99.314us         1  99.314us  99.314us  99.314us  cudaMemcpyAsync
  0.02%  86.044us        11  7.8220us  4.4440us  17.469us  cudaLaunch
  0.02%  69.421us         4  17.355us  8.1010us  36.506us  cudaMemcpyToArray
  0.01%  43.987us        28  1.5700us  1.3550us  3.6300us  cudaFuncGetAttributes
  0.01%  28.656us         1  28.656us  28.656us  28.656us  cuDeviceGetName
  0.00%  17.411us         2  8.7050us  7.6350us  9.7760us  cudaMemcpyToSymbol
  0.00%  13.724us         4  3.4310us  2.2150us  6.3500us  cudaCreateTextureObject
  0.00%  7.1740us        21     341ns     198ns  1.4470us  cudaGetDevice
  0.00%  6.7100us         7     958ns     494ns  1.7000us  cudaEventCreateWithFlags
  0.00%  6.0190us        23     261ns     106ns  2.4750us  cudaSetupArgument
  0.00%  5.9880us         7     855ns     519ns  1.6970us  cudaEventRecord
  0.00%  4.7540us         7     679ns     379ns  1.1080us  cudaEventDestroy
  0.00%  3.9170us         3  1.3050us     342ns  3.1130us  cuDeviceGetCount
  0.00%  3.1490us        11     286ns     199ns     660ns  cudaDeviceGetAttribute
  0.00%  3.0460us        11     276ns     166ns     743ns  cudaConfigureCall
  0.00%  1.0810us         3     360ns     209ns     532ns  cuDeviceGet
  0.00%     373ns         2     186ns     136ns     237ns  cudaCreateChannelDesc
