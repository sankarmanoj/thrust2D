==12959== NVPROF is profiling process 12959, command: ./sobel_filter.o
==12959== Profiling application: ./sobel_filter.o
==12959== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.45%  154.97us         2  77.486us  75.934us  79.038us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 23.86%  107.36us        30  3.5780us     544ns  83.453us  [CUDA memcpy HtoD]
 18.32%  82.397us         1  82.397us  82.397us  82.397us  [CUDA memcpy DtoH]
  9.37%  42.142us         1  42.142us  42.142us  42.142us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.63%  38.814us         2  19.407us  19.039us  19.775us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.47%  20.128us         6  3.3540us  1.1200us  6.2080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.90%  4.0640us         1  4.0640us  4.0640us  4.0640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12959== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 87.94%  723.67ms        18  40.204ms  4.4640us  668.64ms  cudaMalloc
  5.70%  46.882ms         2  23.441ms  14.322ms  32.560ms  cudaGetDeviceProperties
  4.95%  40.748ms         7  5.8211ms  4.7020us  39.420ms  cudaFree
  1.14%  9.3505ms        90  103.89us     102ns  5.6151ms  cuDeviceGetAttribute
  0.08%  632.14us        19  33.270us  1.9240us  594.69us  cudaMemcpyAsync
  0.07%  557.26us        12  46.438us  3.9620us  252.68us  cudaMemcpy
  0.05%  406.39us         1  406.39us  406.39us  406.39us  cuDeviceTotalMem
  0.03%  251.86us        12  20.987us  5.7880us  35.838us  cudaLaunch
  0.03%  224.15us         1  224.15us  224.15us  224.15us  cuDeviceGetName
  0.01%  92.800us        40  2.3200us  1.4460us  6.4510us  cudaFuncGetAttributes
  0.00%  21.905us        30     730ns     211ns  2.7750us  cudaGetDevice
  0.00%  16.352us        10  1.6350us     644ns  2.3510us  cudaEventCreateWithFlags
  0.00%  13.028us        10  1.3020us     534ns  1.9190us  cudaEventRecord
  0.00%  10.774us        10  1.0770us     439ns  1.3960us  cudaEventDestroy
  0.00%  9.1180us        18     506ns     118ns  3.8260us  cudaSetupArgument
  0.00%  8.3220us        12     693ns     161ns  1.1570us  cudaConfigureCall
  0.00%  3.4200us        11     310ns     227ns     853ns  cudaDeviceGetAttribute
  0.00%  2.4190us         2  1.2090us     873ns  1.5460us  cuDeviceGetCount
  0.00%     400ns         2     200ns     196ns     204ns  cuDeviceGet
  0.00%     381ns         1     381ns     381ns     381ns  cudaGetLastError
