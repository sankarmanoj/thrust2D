==23776== NVPROF is profiling process 23776, command: ./gaussian_filter.o
==23776== Profiling application: ./gaussian_filter.o
==23776== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 61.50%  2.4905ms         1  2.4905ms  2.4905ms  2.4905ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.08%  893.97us       728  1.2270us     575ns  19.164us  [CUDA memcpy HtoD]
 16.13%  653.36us       723     903ns     319ns  18.844us  [CUDA memcpy DtoH]
  0.25%  10.079us         4  2.5190us  2.1120us  3.6790us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.04%  1.5040us         1  1.5040us  1.5040us  1.5040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==23776== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.23%  235.97ms        10  23.597ms  4.2400us  235.15ms  cudaMalloc
  4.39%  10.994ms      1445  7.6080us  2.0600us  350.11us  cudaMemcpyAsync
  1.03%  2.5766ms         6  429.43us  4.5730us  2.5415ms  cudaMemcpy
  0.11%  284.82us         5  56.964us  5.7280us  141.73us  cudaFree
  0.10%  243.47us        90  2.7050us     101ns  94.924us  cuDeviceGetAttribute
  0.07%  183.39us         1  183.39us  183.39us  183.39us  cuDeviceTotalMem
  0.03%  64.596us         6  10.766us  5.7830us  23.950us  cudaLaunch
  0.02%  41.090us        24  1.7120us  1.4090us  4.2950us  cudaFuncGetAttributes
  0.01%  29.616us         1  29.616us  29.616us  29.616us  cuDeviceGetName
  0.00%  6.9820us        18     387ns     212ns  1.5210us  cudaGetDevice
  0.00%  6.0570us         6  1.0090us     186ns  4.2770us  cudaSetupArgument
  0.00%  5.9550us         6     992ns     668ns  1.6020us  cudaEventCreateWithFlags
  0.00%  5.0100us         6     835ns     585ns  1.3330us  cudaEventRecord
  0.00%  4.0230us         6     670ns     540ns     953ns  cudaEventDestroy
  0.00%  3.0310us        11     275ns     207ns     760ns  cudaDeviceGetAttribute
  0.00%  2.3120us         6     385ns     188ns     819ns  cudaConfigureCall
  0.00%  2.1100us         2  1.0550us     657ns  1.4530us  cuDeviceGetCount
  0.00%     446ns         2     223ns     202ns     244ns  cuDeviceGet
