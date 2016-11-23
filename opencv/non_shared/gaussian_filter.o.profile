==3327== NVPROF is profiling process 3327, command: ./gaussian_filter.o
==3327== Profiling application: ./gaussian_filter.o
==3327== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.96%  1.1491ms         1  1.1491ms  1.1491ms  1.1491ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 29.75%  777.67us       728  1.0680us     704ns  224.68us  [CUDA memcpy HtoD]
 24.15%  631.16us       723     872ns     320ns  183.57us  [CUDA memcpy DtoH]
  1.98%  51.727us         4  12.931us  2.6890us  20.198us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.16%  4.1930us         1  4.1930us  4.1930us  4.1930us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3327== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.74%  1.07229s        10  107.23ms  12.932us  1.04777s  cudaMalloc
  3.30%  37.370ms      1445  25.861us  3.0000us  17.964ms  cudaMemcpyAsync
  1.22%  13.796ms         5  2.7592ms  24.975us  6.7910ms  cudaFree
  0.46%  5.1928ms        90  57.697us     139ns  2.0614ms  cuDeviceGetAttribute
  0.17%  1.9626ms         6  327.10us  15.549us  1.7674ms  cudaMemcpy
  0.03%  339.96us         1  339.96us  339.96us  339.96us  cuDeviceTotalMem
  0.03%  325.68us         6  54.279us  20.163us  98.152us  cudaLaunch
  0.02%  220.03us         1  220.03us  220.03us  220.03us  cuDeviceGetName
  0.01%  137.15us        24  5.7140us  2.0980us  22.042us  cudaFuncGetAttributes
  0.00%  33.407us        18  1.8550us     384ns  7.6740us  cudaGetDevice
  0.00%  25.356us         6  4.2260us  1.7480us  6.9490us  cudaEventCreateWithFlags
  0.00%  18.598us         6  3.0990us  1.4950us  5.9480us  cudaEventRecord
  0.00%  14.931us         6  2.4880us     427ns  5.7490us  cudaSetupArgument
  0.00%  14.563us         6  2.4270us  1.3890us  3.8250us  cudaEventDestroy
  0.00%  11.703us         6  1.9500us     662ns  3.0570us  cudaConfigureCall
  0.00%  6.7690us        11     615ns     277ns  2.6140us  cudaDeviceGetAttribute
  0.00%  4.3120us         2  2.1560us  1.5100us  2.8020us  cuDeviceGetCount
  0.00%  1.2250us         2     612ns     409ns     816ns  cuDeviceGet
