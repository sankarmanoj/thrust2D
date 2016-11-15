==9549== NVPROF is profiling process 9549, command: ./pyrdown.o
==9549== Profiling application: ./pyrdown.o
==9549== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 68.18%  1.4665ms        19  77.184us     320ns  1.4578ms  [CUDA memcpy DtoH]
 21.38%  460.00us         1  460.00us  460.00us  460.00us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.94%  149.18us        25  5.9670us     544ns  135.49us  [CUDA memcpy HtoD]
  2.29%  49.248us         5  9.8490us  1.4080us  19.808us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.05%  22.624us         1  22.624us  22.624us  22.624us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.16%  3.4880us         1  3.4880us  3.4880us  3.4880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9549== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.40%  220.61ms        12  18.384ms  4.5720us  219.83ms  cudaMalloc
  1.03%  2.3163ms         7  330.90us  5.4940us  2.2405ms  cudaMemcpy
  0.14%  310.83us        37  8.4000us  1.7730us  147.92us  cudaMemcpyAsync
  0.10%  226.50us        90  2.5160us      96ns  93.301us  cuDeviceGetAttribute
  0.09%  199.40us         6  33.233us  4.9490us  97.320us  cudaFree
  0.07%  164.33us         1  164.33us  164.33us  164.33us  cuDeviceTotalMem
  0.07%  147.94us         8  18.492us  7.0930us  34.931us  cudaLaunch
  0.05%  106.22us         1  106.22us  106.22us  106.22us  cudaDeviceSynchronize
  0.02%  55.991us        32  1.7490us  1.3270us  5.1780us  cudaFuncGetAttributes
  0.01%  19.687us         1  19.687us  19.687us  19.687us  cuDeviceGetName
  0.00%  9.3510us        24     389ns     196ns  1.4000us  cudaGetDevice
  0.00%  8.9350us         8  1.1160us     756ns  2.0190us  cudaEventCreateWithFlags
  0.00%  7.1190us         8     889ns     525ns  1.7350us  cudaEventRecord
  0.00%  6.6470us         8     830ns     479ns  1.8520us  cudaEventDestroy
  0.00%  5.2930us         8     661ns     187ns  2.8720us  cudaSetupArgument
  0.00%  3.2330us        11     293ns     200ns     955ns  cudaDeviceGetAttribute
  0.00%  3.1590us         8     394ns     199ns     833ns  cudaConfigureCall
  0.00%  1.1640us         2     582ns     225ns     939ns  cuDeviceGetCount
  0.00%     284ns         2     142ns     117ns     167ns  cuDeviceGet
