==3458== NVPROF is profiling process 3458, command: ./harris.o
==3458== Profiling application: ./harris.o
==3458== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.53%  128.52us         1  128.52us  128.52us  128.52us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.47%  101.64us        23  4.4190us     640ns  75.429us  [CUDA memcpy HtoD]
 26.73%  89.157us        19  4.6920us     320ns  73.924us  [CUDA memcpy DtoH]
  4.26%  14.208us         4  3.5520us  1.2160us  5.0880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3458== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.05%  539.74ms         8  67.468ms  6.3410us  537.54ms  cudaMalloc
  0.53%  2.8871ms         4  721.76us  9.1640us  2.4555ms  cudaFree
  0.11%  604.13us         1  604.13us  604.13us  604.13us  cuDeviceGetName
  0.08%  444.91us        37  12.024us  3.1220us  129.21us  cudaMemcpyAsync
  0.08%  434.58us        90  4.8280us     129ns  167.71us  cuDeviceGetAttribute
  0.07%  397.51us         5  79.501us  8.3400us  318.57us  cudaMemcpy
  0.04%  231.52us         1  231.52us  231.52us  231.52us  cuDeviceTotalMem
  0.02%  98.844us         5  19.768us  12.630us  32.725us  cudaLaunch
  0.01%  48.608us        20  2.4300us  1.4320us  4.5630us  cudaFuncGetAttributes
  0.00%  8.4870us        15     565ns     206ns  1.6430us  cudaGetDevice
  0.00%  8.1020us         5  1.6200us  1.1360us  2.2950us  cudaEventCreateWithFlags
  0.00%  6.8110us         5  1.3620us     239ns  4.5960us  cudaSetupArgument
  0.00%  6.6630us         5  1.3320us     868ns  1.9700us  cudaEventRecord
  0.00%  4.9810us         5     996ns     697ns  1.2890us  cudaEventDestroy
  0.00%  4.0670us         2  2.0330us  1.9150us  2.1520us  cuDeviceGetCount
  0.00%  3.2560us        11     296ns     204ns     800ns  cudaDeviceGetAttribute
  0.00%  2.7300us         5     546ns     303ns  1.0070us  cudaConfigureCall
  0.00%  1.1050us         2     552ns     370ns     735ns  cuDeviceGet
