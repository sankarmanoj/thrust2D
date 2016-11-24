==5620== NVPROF is profiling process 5620, command: ./pyrup.o
==5620== Profiling application: ./pyrup.o
==5620== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.62%  69.147us         1  69.147us  69.147us  69.147us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.50%  46.237us        25  1.8490us     576ns  19.199us  [CUDA memcpy HtoD]
 12.98%  19.679us        19  1.0350us     288ns  5.0880us  [CUDA memcpy DtoH]
  7.26%  11.008us         5  2.2010us  1.3440us  3.6800us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.77%  4.1910us         1  4.1910us  4.1910us  4.1910us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.86%  1.3110us         1  1.3110us  1.3110us  1.3110us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5620== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.40%  213.06ms        12  17.755ms  4.8110us  212.29ms  cudaMalloc
  0.14%  296.55us        90  3.2940us     103ns  118.22us  cuDeviceGetAttribute
  0.13%  283.76us        37  7.6690us  2.0970us  20.550us  cudaMemcpyAsync
  0.10%  220.11us         6  36.684us  5.1070us  113.05us  cudaFree
  0.09%  193.18us         1  193.18us  193.18us  193.18us  cuDeviceTotalMem
  0.05%  109.86us         7  15.694us  4.4320us  71.558us  cudaMemcpy
  0.03%  69.531us         8  8.6910us  5.7880us  14.054us  cudaLaunch
  0.02%  51.840us        32  1.6200us  1.4160us  3.4970us  cudaFuncGetAttributes
  0.01%  28.252us         1  28.252us  28.252us  28.252us  cuDeviceGetName
  0.00%  8.5320us        24     355ns     214ns  1.3720us  cudaGetDevice
  0.00%  7.3920us         8     924ns     622ns  1.7560us  cudaEventCreateWithFlags
  0.00%  6.0960us         8     762ns     512ns  1.3950us  cudaEventRecord
  0.00%  5.7060us         8     713ns     191ns  3.8620us  cudaSetupArgument
  0.00%  4.8860us         8     610ns     408ns     990ns  cudaEventDestroy
  0.00%  2.9880us        11     271ns     207ns     738ns  cudaDeviceGetAttribute
  0.00%  2.6120us         8     326ns     159ns     724ns  cudaConfigureCall
  0.00%  1.3710us         2     685ns     216ns  1.1550us  cuDeviceGetCount
  0.00%     285ns         2     142ns     106ns     179ns  cuDeviceGet
