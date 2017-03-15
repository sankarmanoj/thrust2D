==10311== NVPROF is profiling process 10311, command: ./sobel_filter.o
==10311== Profiling application: ./sobel_filter.o
==10311== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.03%  117.29us         2  58.642us  57.378us  59.907us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 33.86%  90.179us        12  7.5140us     544ns  30.145us  [CUDA memcpy HtoD]
 13.52%  36.002us         1  36.002us  36.002us  36.002us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.59%  22.881us         1  22.881us  22.881us  22.881us  [CUDA memcpy DtoH]

==10311== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.42%  206.09ms         7  29.442ms  2.8410us  205.79ms  cudaMallocPitch
  0.16%  341.47us         6  56.912us  7.6330us  177.60us  cudaMemcpy2D
  0.15%  311.91us         7  44.559us  3.8970us  286.67us  cudaMalloc
  0.11%  235.30us        90  2.6140us      96ns  91.031us  cuDeviceGetAttribute
  0.08%  155.69us         1  155.69us  155.69us  155.69us  cuDeviceTotalMem
  0.02%  34.862us         7  4.9800us  2.9790us  11.083us  cudaMemcpy
  0.02%  34.849us         1  34.849us  34.849us  34.849us  cuDeviceGetName
  0.02%  33.194us         3  11.064us  8.8780us  15.236us  cudaLaunch
  0.01%  22.437us        12  1.8690us  1.3620us  6.6580us  cudaFuncGetAttributes
  0.00%  5.0730us         9     563ns     206ns  2.3920us  cudaGetDevice
  0.00%  3.3980us        11     308ns     206ns     878ns  cudaDeviceGetAttribute
  0.00%  3.1820us         3  1.0600us     739ns  1.6720us  cudaEventCreateWithFlags
  0.00%  2.7610us         3     920ns     625ns  1.4890us  cudaEventRecord
  0.00%  2.5730us         3     857ns     171ns  2.1560us  cudaSetupArgument
  0.00%  2.1270us         3     709ns     512ns  1.0660us  cudaEventDestroy
  0.00%  1.9270us         2     963ns     640ns  1.2870us  cuDeviceGetCount
  0.00%  1.2850us         3     428ns     224ns     807ns  cudaConfigureCall
  0.00%     402ns         1     402ns     402ns     402ns  cudaGetLastError
  0.00%     393ns         2     196ns     193ns     200ns  cuDeviceGet
