==4946== NVPROF is profiling process 4946, command: ./sobel_filter.o
==4946== Profiling application: ./sobel_filter.o
==4946== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.87%  438.49us         2  219.25us  218.29us  220.21us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.25%  104.36us        28  3.7270us     576ns  72.997us  [CUDA memcpy HtoD]
 10.09%  73.925us         1  73.925us  73.925us  73.925us  [CUDA memcpy DtoH]
  5.19%  37.987us         1  37.987us  37.987us  37.987us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.71%  34.530us         2  17.265us  16.929us  17.601us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.90%  28.547us         8  3.5680us     992ns  5.1850us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.48%  10.816us         2  5.4080us  5.2800us  5.5360us  [CUDA memcpy DtoD]
  0.52%  3.7760us         1  3.7760us  3.7760us  3.7760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4946== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.93%  221.16ms        18  12.286ms  4.0420us  219.70ms  cudaMalloc
  0.24%  526.58us         2  263.29us  259.81us  266.77us  cudaGetDeviceProperties
  0.20%  450.65us         2  225.32us  224.47us  226.18us  cudaDeviceSynchronize
  0.14%  322.72us        90  3.5850us     102ns  128.13us  cuDeviceGetAttribute
  0.12%  272.97us        12  22.747us  4.8660us  202.77us  cudaMemcpy
  0.11%  250.71us         7  35.816us  4.1690us  91.092us  cudaFree
  0.09%  197.74us         1  197.74us  197.74us  197.74us  cuDeviceTotalMem
  0.05%  105.37us        14  7.5260us  5.2330us  13.322us  cudaLaunch
  0.05%  101.99us        19  5.3680us  2.0500us  61.926us  cudaMemcpyAsync
  0.04%  81.978us        50  1.6390us  1.4120us  6.3380us  cudaFuncGetAttributes
  0.01%  28.427us         1  28.427us  28.427us  28.427us  cuDeviceGetName
  0.01%  12.479us        38     328ns     201ns  1.3240us  cudaGetDevice
  0.00%  9.8840us        12     823ns     634ns  1.3900us  cudaEventCreateWithFlags
  0.00%  8.5650us        12     713ns     508ns  1.2480us  cudaEventRecord
  0.00%  7.2000us        12     600ns     420ns     933ns  cudaEventDestroy
  0.00%  6.6950us        22     304ns     114ns  2.6830us  cudaSetupArgument
  0.00%  4.7290us        19     248ns     203ns     676ns  cudaDeviceGetAttribute
  0.00%  3.5760us        14     255ns     167ns     712ns  cudaConfigureCall
  0.00%  1.5720us         2     786ns     373ns  1.1990us  cuDeviceGetCount
  0.00%  1.4190us         2     709ns     562ns     857ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     441ns         2     220ns     207ns     234ns  cudaGetLastError
  0.00%     313ns         2     156ns     116ns     197ns  cuDeviceGet
