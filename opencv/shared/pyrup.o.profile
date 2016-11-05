==6964== NVPROF is profiling process 6964, command: ./pyrup.o
==6964== Profiling application: ./pyrup.o
==6964== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 71.63%  598.05us         1  598.05us  598.05us  598.05us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 17.57%  146.70us        56  2.6190us     800ns  81.043us  [CUDA memcpy HtoD]
  7.33%  61.176us        51  1.1990us     319ns  18.845us  [CUDA memcpy DtoH]
  1.46%  12.159us         4  3.0390us  1.3440us  5.8550us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.94%  7.8700us         1  7.8700us  7.8700us  7.8700us  [CUDA memcpy DtoD]
  0.61%  5.0870us         1  5.0870us  5.0870us  5.0870us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.46%  3.8390us         1  3.8390us  3.8390us  3.8390us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6964== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.63%  574.38ms        10  57.438ms  5.3680us  573.41ms  cudaMalloc
  0.39%  2.2711ms         1  2.2711ms  2.2711ms  2.2711ms  cuDeviceGetName
  0.38%  2.2399ms        90  24.887us     127ns  987.85us  cuDeviceGetAttribute
  0.15%  846.89us         7  120.98us  5.2140us  395.47us  cudaMemcpy
  0.15%  844.59us       101  8.3620us  2.0840us  93.644us  cudaMemcpyAsync
  0.11%  641.29us         2  320.64us  30.960us  610.33us  cudaDeviceSynchronize
  0.08%  478.51us         1  478.51us  478.51us  478.51us  cuDeviceTotalMem
  0.05%  288.17us         1  288.17us  288.17us  288.17us  cudaGetDeviceProperties
  0.03%  184.07us         4  46.017us  8.8880us  135.06us  cudaFree
  0.02%  104.84us         7  14.977us  6.8470us  24.485us  cudaLaunch
  0.01%  51.293us        25  2.0510us  1.3990us  4.8070us  cudaFuncGetAttributes
  0.00%  10.506us        19     552ns     219ns  1.7290us  cudaGetDevice
  0.00%  9.0340us         6  1.5050us     754ns  1.9280us  cudaEventCreateWithFlags
  0.00%  7.5510us         6  1.2580us     649ns  1.4770us  cudaEventRecord
  0.00%  5.6450us        11     513ns     117ns  3.1040us  cudaSetupArgument
  0.00%  5.3370us         6     889ns     547ns  1.1150us  cudaEventDestroy
  0.00%  4.2980us        15     286ns     205ns     917ns  cudaDeviceGetAttribute
  0.00%  3.6220us         7     517ns     173ns     831ns  cudaConfigureCall
  0.00%  2.6790us         2  1.3390us     582ns  2.0970us  cuDeviceGetCount
  0.00%  1.5260us         1  1.5260us  1.5260us  1.5260us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     755ns         2     377ns     254ns     501ns  cuDeviceGet
  0.00%     426ns         1     426ns     426ns     426ns  cudaGetLastError
