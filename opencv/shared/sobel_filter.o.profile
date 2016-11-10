==4452== NVPROF is profiling process 4452, command: ./sobel_filter.o
==4452== Profiling application: ./sobel_filter.o
==4452== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.24%  947.72us         2  473.86us  473.35us  474.37us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 13.29%  212.65us        28  7.5940us     576ns  181.31us  [CUDA memcpy HtoD]
 10.53%  168.48us         1  168.48us  168.48us  168.48us  [CUDA memcpy DtoH]
  5.05%  80.764us         1  80.764us  80.764us  80.764us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.55%  72.857us         2  36.428us  36.333us  36.524us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.92%  62.740us         8  7.8420us     961ns  10.564us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.11%  49.682us         2  24.841us  24.521us  25.161us  [CUDA memcpy DtoD]
  0.31%  4.9290us         1  4.9290us  4.9290us  4.9290us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4452== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.48%  238.82ms        18  13.268ms  4.5420us  236.32ms  cudaMalloc
  0.40%  960.19us         2  480.10us  479.49us  480.70us  cudaDeviceSynchronize
  0.23%  551.38us         2  275.69us  269.77us  281.61us  cudaGetDeviceProperties
  0.20%  476.49us        12  39.707us  5.1510us  379.76us  cudaMemcpy
  0.18%  427.66us         7  61.094us  4.3730us  136.60us  cudaFree
  0.17%  414.35us        90  4.6030us     176ns  162.96us  cuDeviceGetAttribute
  0.13%  311.85us         1  311.85us  311.85us  311.85us  cuDeviceTotalMem
  0.09%  228.13us        19  12.006us  1.9960us  189.00us  cudaMemcpyAsync
  0.05%  118.79us        14  8.4840us  5.4890us  13.931us  cudaLaunch
  0.03%  81.104us        50  1.6220us  1.4100us  3.3130us  cudaFuncGetAttributes
  0.02%  42.543us         1  42.543us  42.543us  42.543us  cuDeviceGetName
  0.01%  14.357us        38     377ns     218ns  1.5150us  cudaGetDevice
  0.00%  10.112us        12     842ns     574ns  1.4420us  cudaEventCreateWithFlags
  0.00%  8.8230us        12     735ns     484ns  1.1750us  cudaEventRecord
  0.00%  7.9940us        22     363ns     117ns  3.9290us  cudaSetupArgument
  0.00%  7.9510us        12     662ns     449ns  1.0480us  cudaEventDestroy
  0.00%  5.0420us        19     265ns     209ns     861ns  cudaDeviceGetAttribute
  0.00%  4.2150us        14     301ns     160ns     755ns  cudaConfigureCall
  0.00%  2.0550us         2  1.0270us     569ns  1.4860us  cuDeviceGetCount
  0.00%  1.5550us         2     777ns     663ns     892ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     705ns         2     352ns     300ns     405ns  cudaGetLastError
  0.00%     521ns         2     260ns     212ns     309ns  cuDeviceGet
