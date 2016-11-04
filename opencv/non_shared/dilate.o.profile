==3525== NVPROF is profiling process 3525, command: ./dilate.o
==3525== Profiling application: ./dilate.o
==3525== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.59%  84.933us         1  84.933us  84.933us  84.933us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.87%  78.053us         5  15.610us  1.2160us  73.189us  [CUDA memcpy HtoD]
 29.24%  73.925us         1  73.925us  73.925us  73.925us  [CUDA memcpy DtoH]
  5.28%  13.344us         3  4.4480us  3.7440us  5.3440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.03%  2.5920us         1  2.5920us  2.5920us  2.5920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3525== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.37%  444.16ms         8  55.520ms  5.1760us  443.09ms  cudaMalloc
  0.28%  1.2487ms        90  13.874us     131ns  750.43us  cuDeviceGetAttribute
  0.10%  446.32us         1  446.32us  446.32us  446.32us  cuDeviceGetName
  0.08%  350.45us         5  70.089us  5.5420us  321.26us  cudaMemcpy
  0.06%  283.05us         1  283.05us  283.05us  283.05us  cuDeviceTotalMem
  0.06%  278.84us         4  69.709us  8.7890us  130.24us  cudaFree
  0.02%  84.706us         1  84.706us  84.706us  84.706us  cudaMemcpyAsync
  0.01%  49.164us         5  9.8320us  6.5870us  12.783us  cudaLaunch
  0.01%  32.689us        20  1.6340us  1.4090us  2.9150us  cudaFuncGetAttributes
  0.00%  5.6290us        15     375ns     202ns  1.0180us  cudaGetDevice
  0.00%  4.8450us         5     969ns     736ns  1.2820us  cudaEventCreateWithFlags
  0.00%  3.8030us         5     760ns     232ns  2.5510us  cudaSetupArgument
  0.00%  3.7670us         5     753ns     614ns     954ns  cudaEventRecord
  0.00%  3.2360us         5     647ns     522ns     790ns  cudaEventDestroy
  0.00%  2.9610us        11     269ns     204ns     704ns  cudaDeviceGetAttribute
  0.00%  2.4910us         2  1.2450us     333ns  2.1580us  cuDeviceGetCount
  0.00%  1.6120us         5     322ns     225ns     534ns  cudaConfigureCall
  0.00%     595ns         2     297ns     216ns     379ns  cuDeviceGet
