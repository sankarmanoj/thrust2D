==3502== NVPROF is profiling process 3502, command: ./scharr_filter.o
==3502== Profiling application: ./scharr_filter.o
==3502== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.59%  443.68us         2  221.84us  219.95us  223.73us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.91%  111.05us        28  3.9650us     576ns  85.221us  [CUDA memcpy HtoD]
  9.98%  74.277us         1  74.277us  74.277us  74.277us  [CUDA memcpy DtoH]
  5.12%  38.114us         1  38.114us  38.114us  38.114us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.95%  36.835us         2  18.417us  17.154us  19.681us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.68%  27.393us         8  3.4240us     960ns  5.2160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.44%  10.720us         2  5.3600us  5.3120us  5.4080us  [CUDA memcpy DtoD]
  0.34%  2.5290us         1  2.5290us  2.5290us  2.5290us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3502== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.46%  451.78ms        18  25.099ms  5.8840us  441.81ms  cudaMalloc
  3.37%  16.101ms         2  8.0505ms  4.6082ms  11.493ms  cudaGetDeviceProperties
  0.67%  3.2228ms         7  460.40us  4.5290us  2.5705ms  cudaFree
  0.50%  2.3857ms        90  26.507us     122ns  1.6794ms  cuDeviceGetAttribute
  0.48%  2.2794ms         1  2.2794ms  2.2794ms  2.2794ms  cuDeviceGetName
  0.19%  894.19us        12  74.515us  6.7990us  484.61us  cudaMemcpy
  0.11%  544.53us         2  272.26us  270.78us  273.75us  cudaDeviceSynchronize
  0.07%  339.87us        14  24.276us  7.3450us  48.660us  cudaLaunch
  0.05%  262.98us        19  13.841us  3.0040us  199.38us  cudaMemcpyAsync
  0.05%  229.68us         1  229.68us  229.68us  229.68us  cuDeviceTotalMem
  0.03%  125.34us        50  2.5060us  1.4200us  7.3030us  cudaFuncGetAttributes
  0.01%  27.820us        38     732ns     205ns  3.6230us  cudaGetDevice
  0.00%  22.955us        12  1.9120us  1.0310us  3.2050us  cudaEventCreateWithFlags
  0.00%  18.431us        12  1.5350us     845ns  3.5750us  cudaEventRecord
  0.00%  13.617us        12  1.1340us     664ns  2.1070us  cudaEventDestroy
  0.00%  11.317us        22     514ns     113ns  4.9070us  cudaSetupArgument
  0.00%  9.6610us        14     690ns     230ns  1.3460us  cudaConfigureCall
  0.00%  7.1530us        19     376ns     205ns  1.1420us  cudaDeviceGetAttribute
  0.00%  3.3820us         2  1.6910us  1.6890us  1.6930us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  2.7870us         2  1.3930us     483ns  2.3040us  cuDeviceGetCount
  0.00%  1.2750us         3     425ns     334ns     595ns  cudaGetLastError
  0.00%     597ns         2     298ns     175ns     422ns  cuDeviceGet
