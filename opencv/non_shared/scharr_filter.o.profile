==10315== NVPROF is profiling process 10315, command: ./scharr_filter.o
==10315== Profiling application: ./scharr_filter.o
==10315== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 42.85%  108.90us         2  54.450us  49.538us  59.363us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 34.14%  86.757us        12  7.2290us     544ns  28.897us  [CUDA memcpy HtoD]
 14.03%  35.649us         1  35.649us  35.649us  35.649us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.98%  22.817us         1  22.817us  22.817us  22.817us  [CUDA memcpy DtoH]

==10315== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.08%  194.28ms         7  27.755ms  2.9210us  193.98ms  cudaMallocPitch
  0.42%  829.97us        90  9.2210us      99ns  548.28us  cuDeviceGetAttribute
  0.18%  348.32us         6  58.052us  7.5690us  187.08us  cudaMemcpy2D
  0.17%  329.90us         7  47.128us  3.9650us  302.31us  cudaMalloc
  0.08%  156.72us         1  156.72us  156.72us  156.72us  cuDeviceTotalMem
  0.02%  41.528us         3  13.842us  9.2490us  22.893us  cudaLaunch
  0.02%  40.003us         7  5.7140us  3.1910us  13.583us  cudaMemcpy
  0.01%  22.848us         1  22.848us  22.848us  22.848us  cuDeviceGetName
  0.01%  18.591us        12  1.5490us  1.3310us  3.1170us  cudaFuncGetAttributes
  0.00%  6.4720us         9     719ns     203ns  4.4710us  cudaGetDevice
  0.00%  3.8160us        11     346ns     204ns  1.0120us  cudaDeviceGetAttribute
  0.00%  3.2550us         3  1.0850us     190ns  2.8180us  cudaSetupArgument
  0.00%  3.1620us         3  1.0540us     700ns  1.6710us  cudaEventCreateWithFlags
  0.00%  2.6330us         3     877ns     529ns  1.4870us  cudaEventRecord
  0.00%  1.9370us         3     645ns     455ns  1.0020us  cudaEventDestroy
  0.00%  1.8680us         2     934ns     275ns  1.5930us  cuDeviceGetCount
  0.00%  1.3720us         3     457ns     215ns     921ns  cudaConfigureCall
  0.00%     845ns         1     845ns     845ns     845ns  cudaGetLastError
  0.00%     365ns         2     182ns     120ns     245ns  cuDeviceGet
