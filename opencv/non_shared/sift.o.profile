==23557== NVPROF is profiling process 23557, command: ./sift.o
==23557== Profiling application: ./sift.o
==23557== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 80.33%  622.07us         1  622.07us  622.07us  622.07us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 14.41%  111.62us        11  10.147us  1.1830us  72.652us  [CUDA memcpy HtoD]
  2.82%  21.817us         8  2.7270us  1.3120us  5.1820us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.43%  18.843us         1  18.843us  18.843us  18.843us  [CUDA memcpy DtoH]

==23557== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.24%  251.99ms        16  15.749ms  4.4990us  250.89ms  cudaMalloc
  0.32%  800.86us         9  88.984us  4.5180us  751.40us  cudaMemcpy
  0.12%  309.32us         8  38.665us  4.6810us  119.54us  cudaFree
  0.12%  300.47us        90  3.3380us     103ns  118.53us  cuDeviceGetAttribute
  0.07%  189.84us         1  189.84us  189.84us  189.84us  cuDeviceTotalMem
  0.05%  121.90us         3  40.632us  10.836us  79.092us  cudaMemcpyAsync
  0.03%  85.601us         9  9.5110us  5.8340us  21.548us  cudaLaunch
  0.02%  57.443us        36  1.5950us  1.3930us  3.4330us  cudaFuncGetAttributes
  0.01%  28.146us         1  28.146us  28.146us  28.146us  cuDeviceGetName
  0.00%  9.2570us        27     342ns     213ns  1.2400us  cudaGetDevice
  0.00%  7.6000us         9     844ns     642ns  1.4900us  cudaEventCreateWithFlags
  0.00%  6.4230us         9     713ns     546ns  1.1760us  cudaEventRecord
  0.00%  5.9590us         9     662ns     517ns     958ns  cudaEventDestroy
  0.00%  5.5340us         9     614ns     208ns  3.2050us  cudaSetupArgument
  0.00%  3.1720us        11     288ns     202ns     985ns  cudaDeviceGetAttribute
  0.00%  2.8750us         9     319ns     170ns     879ns  cudaConfigureCall
  0.00%  1.3530us         2     676ns     156ns  1.1970us  cuDeviceGetCount
  0.00%     335ns         2     167ns     119ns     216ns  cuDeviceGet
