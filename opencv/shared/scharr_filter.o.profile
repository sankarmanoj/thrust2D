==4973== NVPROF is profiling process 4973, command: ./scharr_filter.o
==4973== Profiling application: ./scharr_filter.o
==4973== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.80%  438.05us         2  219.02us  217.90us  220.14us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.35%  105.09us        28  3.7530us     576ns  73.125us  [CUDA memcpy HtoD]
 10.44%  76.486us         1  76.486us  76.486us  76.486us  [CUDA memcpy DtoH]
  5.19%  37.986us         1  37.986us  37.986us  37.986us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.67%  34.243us         2  17.121us  16.770us  17.473us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.76%  27.522us         8  3.4400us     960ns  5.5040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.46%  10.689us         2  5.3440us  5.1850us  5.5040us  [CUDA memcpy DtoD]
  0.34%  2.4640us         1  2.4640us  2.4640us  2.4640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4973== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.95%  227.21ms        18  12.623ms  4.3570us  225.75ms  cudaMalloc
  0.23%  535.16us         2  267.58us  262.62us  272.54us  cudaGetDeviceProperties
  0.20%  450.65us         2  225.32us  224.18us  226.47us  cudaDeviceSynchronize
  0.13%  294.14us        90  3.2680us     103ns  116.92us  cuDeviceGetAttribute
  0.12%  279.82us        12  23.318us  4.5140us  209.60us  cudaMemcpy
  0.11%  254.94us         7  36.420us  4.0300us  90.161us  cudaFree
  0.08%  193.81us         1  193.81us  193.81us  193.81us  cuDeviceTotalMem
  0.06%  127.02us        19  6.6850us  2.0390us  86.895us  cudaMemcpyAsync
  0.05%  106.91us        14  7.6360us  5.4600us  13.238us  cudaLaunch
  0.03%  79.532us        50  1.5900us  1.4120us  3.0360us  cudaFuncGetAttributes
  0.01%  25.975us         1  25.975us  25.975us  25.975us  cuDeviceGetName
  0.01%  12.643us        38     332ns     201ns  1.4010us  cudaGetDevice
  0.00%  10.101us        12     841ns     606ns  1.4390us  cudaEventCreateWithFlags
  0.00%  8.2810us        12     690ns     504ns  1.1470us  cudaEventRecord
  0.00%  7.3870us        12     615ns     399ns     935ns  cudaEventDestroy
  0.00%  6.2200us        22     282ns     113ns  2.1640us  cudaSetupArgument
  0.00%  4.8340us        19     254ns     204ns     701ns  cudaDeviceGetAttribute
  0.00%  3.3680us        14     240ns     154ns     683ns  cudaConfigureCall
  0.00%  1.4260us         2     713ns     579ns     847ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.1780us         2     589ns     182ns     996ns  cuDeviceGetCount
  0.00%     449ns         2     224ns     190ns     259ns  cudaGetLastError
  0.00%     321ns         2     160ns     130ns     191ns  cuDeviceGet
