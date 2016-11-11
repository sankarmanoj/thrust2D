==5430== NVPROF is profiling process 5430, command: ./scharr_filter.o
==5430== Profiling application: ./scharr_filter.o
==5430== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.28%  505.86us         1  505.86us  505.86us  505.86us  [CUDA memcpy DtoH]
 31.39%  450.03us         2  225.01us  220.17us  229.86us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 25.03%  358.84us        28  12.815us     544ns  337.53us  [CUDA memcpy HtoD]
  2.66%  38.172us         1  38.172us  38.172us  38.172us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.43%  34.812us         2  17.406us  17.150us  17.662us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.06%  29.469us         8  3.6830us     960ns  4.7030us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.94%  13.502us         2  6.7510us  5.4070us  8.0950us  [CUDA memcpy DtoD]
  0.22%  3.1680us         1  3.1680us  3.1680us  3.1680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5430== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.34%  977.51ms        18  54.306ms  7.5050us  958.76ms  cudaMalloc
  1.66%  16.867ms         2  8.4333ms  5.6118ms  11.255ms  cudaGetDeviceProperties
  0.85%  8.6565ms        90  96.182us     139ns  5.0904ms  cuDeviceGetAttribute
  0.65%  6.5920ms         7  941.72us  8.4370us  4.2143ms  cudaFree
  0.17%  1.6792ms        12  139.93us  9.1560us  1.3239ms  cudaMemcpy
  0.08%  765.90us        14  54.707us  8.8040us  161.36us  cudaLaunch
  0.07%  745.65us        19  39.244us  3.1490us  670.63us  cudaMemcpyAsync
  0.07%  698.24us         2  349.12us  264.54us  433.71us  cudaDeviceSynchronize
  0.04%  453.35us         1  453.35us  453.35us  453.35us  cuDeviceTotalMem
  0.03%  285.88us         1  285.88us  285.88us  285.88us  cuDeviceGetName
  0.02%  199.39us        50  3.9870us  1.4020us  28.256us  cudaFuncGetAttributes
  0.00%  42.914us        38  1.1290us     212ns  6.3530us  cudaGetDevice
  0.00%  41.991us        12  3.4990us  1.2100us  8.1370us  cudaEventCreateWithFlags
  0.00%  36.081us        12  3.0060us     834ns  7.0170us  cudaEventRecord
  0.00%  28.928us        12  2.4100us     695ns  8.4990us  cudaEventDestroy
  0.00%  20.102us        22     913ns     110ns  4.7320us  cudaSetupArgument
  0.00%  19.292us        14  1.3780us     201ns  4.2920us  cudaConfigureCall
  0.00%  10.495us         2  5.2470us  1.9000us  8.5950us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  9.9410us        19     523ns     208ns  1.8190us  cudaDeviceGetAttribute
  0.00%  2.6120us         2  1.3060us     632ns  1.9800us  cudaGetLastError
  0.00%  1.9700us         2     985ns     274ns  1.6960us  cuDeviceGetCount
  0.00%  1.0280us         2     514ns     197ns     831ns  cuDeviceGet
