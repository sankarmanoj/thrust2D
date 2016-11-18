==4068== NVPROF is profiling process 4068, command: ./pyrup.o
==4068== Profiling application: ./pyrup.o
==4068== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.01%  100.42us        25  4.0160us     576ns  72.547us  [CUDA memcpy HtoD]
 36.83%  90.180us         1  90.180us  90.180us  90.180us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 13.29%  32.546us        19  1.7120us     320ns  18.753us  [CUDA memcpy DtoH]
  5.68%  13.921us         5  2.7840us  1.3760us  4.3840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.12%  5.1840us         1  5.1840us  5.1840us  5.1840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.07%  2.6250us         1  2.6250us  2.6250us  2.6250us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4068== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.35%  236.12ms        12  19.677ms  5.0060us  234.98ms  cudaMalloc
  0.14%  343.59us        90  3.8170us     102ns  139.32us  cuDeviceGetAttribute
  0.12%  294.41us        37  7.9560us  2.1930us  41.126us  cudaMemcpyAsync
  0.11%  253.61us         6  42.268us  4.2690us  104.06us  cudaFree
  0.09%  224.01us         7  32.001us  4.7760us  175.49us  cudaMemcpy
  0.08%  193.65us         1  193.65us  193.65us  193.65us  cuDeviceTotalMem
  0.04%  98.746us         8  12.343us  5.8780us  27.638us  cudaLaunch
  0.02%  55.376us        32  1.7300us  1.4050us  4.7590us  cudaFuncGetAttributes
  0.01%  29.046us         1  29.046us  29.046us  29.046us  cuDeviceGetName
  0.00%  9.3130us        24     388ns     205ns  1.7240us  cudaGetDevice
  0.00%  8.0010us         8  1.0000us     582ns  1.8260us  cudaEventCreateWithFlags
  0.00%  6.7490us         8     843ns     526ns  1.4780us  cudaEventRecord
  0.00%  6.0730us         8     759ns     182ns  3.8930us  cudaSetupArgument
  0.00%  5.1950us         8     649ns     433ns  1.1000us  cudaEventDestroy
  0.00%  3.2420us        11     294ns     204ns     901ns  cudaDeviceGetAttribute
  0.00%  3.1240us         8     390ns     178ns     919ns  cudaConfigureCall
  0.00%  1.7180us         2     859ns     189ns  1.5290us  cuDeviceGetCount
  0.00%     369ns         2     184ns     116ns     253ns  cuDeviceGet
