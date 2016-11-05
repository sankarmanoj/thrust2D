==6242== NVPROF is profiling process 6242, command: ./scharr_filter.o
==6242== Profiling application: ./scharr_filter.o
==6242== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.49%  437.34us         2  218.67us  217.73us  219.62us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 13.75%  101.11us        28  3.6100us     576ns  72.565us  [CUDA memcpy HtoD]
 11.07%  81.396us         1  81.396us  81.396us  81.396us  [CUDA memcpy DtoH]
  5.22%  38.362us         1  38.362us  38.362us  38.362us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.74%  34.844us         2  17.422us  16.862us  17.982us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.96%  29.146us         8  3.6430us  1.1200us  5.2790us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.43%  10.526us         2  5.2630us  5.1190us  5.4070us  [CUDA memcpy DtoD]
  0.34%  2.4640us         1  2.4640us  2.4640us  2.4640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6242== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.67%  599.35ms        18  33.297ms  4.6000us  597.85ms  cudaMalloc
  0.78%  4.7383ms        90  52.647us     131ns  2.6780ms  cuDeviceGetAttribute
  0.16%  1.0005ms         2  500.27us  264.63us  735.90us  cudaGetDeviceProperties
  0.08%  507.81us        12  42.317us  5.1250us  262.00us  cudaMemcpy
  0.08%  488.12us         2  244.06us  224.50us  263.63us  cudaDeviceSynchronize
  0.06%  385.90us         1  385.90us  385.90us  385.90us  cuDeviceTotalMem
  0.05%  303.28us         1  303.28us  303.28us  303.28us  cuDeviceGetName
  0.05%  299.39us         7  42.769us  4.4580us  120.49us  cudaFree
  0.02%  130.43us        14  9.3160us  5.3960us  22.108us  cudaLaunch
  0.02%  92.237us        19  4.8540us  1.9960us  53.772us  cudaMemcpyAsync
  0.01%  83.805us        50  1.6760us  1.3860us  7.1930us  cudaFuncGetAttributes
  0.00%  13.846us        38     364ns     214ns  1.3900us  cudaGetDevice
  0.00%  10.640us        12     886ns     580ns  1.5410us  cudaEventCreateWithFlags
  0.00%  9.2580us        12     771ns     533ns  1.5830us  cudaEventRecord
  0.00%  8.3150us        22     377ns     117ns  4.1370us  cudaSetupArgument
  0.00%  7.5710us        12     630ns     430ns     975ns  cudaEventDestroy
  0.00%  5.0610us        19     266ns     205ns     732ns  cudaDeviceGetAttribute
  0.00%  4.3580us        14     311ns     147ns  1.2160us  cudaConfigureCall
  0.00%  2.3250us         2  1.1620us     785ns  1.5400us  cuDeviceGetCount
  0.00%  1.5400us         2     770ns     649ns     891ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     877ns         3     292ns     253ns     328ns  cudaGetLastError
  0.00%     587ns         2     293ns     235ns     352ns  cuDeviceGet
