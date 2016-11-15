==8357== NVPROF is profiling process 8357, command: ./sobel_filter.o
==8357== Profiling application: ./sobel_filter.o
==8357== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.28%  437.26us         2  218.63us  217.72us  219.54us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.66%  109.96us        28  3.9270us     543ns  94.291us  [CUDA memcpy HtoD]
 12.01%  90.132us         1  90.132us  90.132us  90.132us  [CUDA memcpy DtoH]
  5.12%  38.413us         1  38.413us  38.413us  38.413us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.62%  34.640us         2  17.320us  17.016us  17.624us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.59%  26.930us         8  3.3660us     991ns  4.8930us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.39%  10.458us         2  5.2290us  5.0850us  5.3730us  [CUDA memcpy DtoD]
  0.34%  2.5260us         1  2.5260us  2.5260us  2.5260us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8357== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.96%  874.73ms        18  48.596ms  4.2020us  865.20ms  cudaMalloc
  1.37%  12.229ms        90  135.87us     131ns  8.6479ms  cuDeviceGetAttribute
  0.29%  2.6135ms         1  2.6135ms  2.6135ms  2.6135ms  cuDeviceTotalMem
  0.12%  1.0295ms        50  20.589us  1.3460us  470.56us  cudaFuncGetAttributes
  0.05%  484.50us        12  40.374us  5.2250us  365.07us  cudaMemcpy
  0.05%  442.46us         2  221.23us  220.87us  221.59us  cudaDeviceSynchronize
  0.03%  303.24us         1  303.24us  303.24us  303.24us  cuDeviceGetName
  0.03%  297.55us         2  148.78us  133.83us  163.72us  cudaGetDeviceProperties
  0.03%  262.06us        19  13.792us  1.9920us  222.84us  cudaMemcpyAsync
  0.03%  257.04us        14  18.359us  5.9310us  44.965us  cudaLaunch
  0.02%  184.04us         7  26.291us  4.5090us  74.878us  cudaFree
  0.00%  28.420us        38     747ns     203ns  5.8030us  cudaGetDevice
  0.00%  17.309us        12  1.4420us     677ns  2.4760us  cudaEventCreateWithFlags
  0.00%  14.254us        14  1.0180us     173ns  8.0530us  cudaConfigureCall
  0.00%  12.815us        12  1.0670us     487ns  1.7440us  cudaEventRecord
  0.00%  11.909us        22     541ns     104ns  3.2960us  cudaSetupArgument
  0.00%  11.841us        12     986ns     465ns  1.7580us  cudaEventDestroy
  0.00%  5.5480us        19     292ns     207ns     982ns  cudaDeviceGetAttribute
  0.00%  2.0290us         2  1.0140us     352ns  1.6770us  cuDeviceGetCount
  0.00%  1.7920us         2     896ns     661ns  1.1310us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     824ns         3     274ns     239ns     309ns  cudaGetLastError
  0.00%     726ns         2     363ns     167ns     559ns  cuDeviceGet
