==10546== NVPROF is profiling process 10546, command: ./lbp.o
==10546== Profiling application: ./lbp.o
==10546== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.10%  202.69us         1  202.69us  202.69us  202.69us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, lbpFunctor)
 23.95%  96.898us         1  96.898us  96.898us  96.898us  [CUDA memcpy DtoH]
 22.80%  92.226us         6  15.371us  1.1840us  86.178us  [CUDA memcpy HtoD]
  2.17%  8.7690us         2  4.3840us  3.8400us  4.9290us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.99%  4.0000us         1  4.0000us  4.0000us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10546== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.95%  536.26ms         8  67.032ms  8.2110us  535.25ms  cudaMalloc
  0.98%  5.3452ms        90  59.391us     117ns  3.8111ms  cuDeviceGetAttribute
  0.75%  4.0812ms         1  4.0812ms  4.0812ms  4.0812ms  cuDeviceTotalMem
  0.11%  626.59us         6  104.43us  5.9050us  501.34us  cudaMemcpy
  0.07%  386.15us         1  386.15us  386.15us  386.15us  cudaGetDeviceProperties
  0.06%  318.92us         3  106.31us  43.185us  164.46us  cudaFree
  0.04%  196.12us         1  196.12us  196.12us  196.12us  cudaMemcpyAsync
  0.02%  129.02us         4  32.255us  10.411us  43.193us  cudaLaunch
  0.01%  42.569us         1  42.569us  42.569us  42.569us  cuDeviceGetName
  0.01%  31.468us        12  2.6220us  1.8620us  6.1490us  cudaFuncGetAttributes
  0.00%  10.818us         7  1.5450us     201ns  8.5360us  cudaSetupArgument
  0.00%  6.9540us         9     772ns     280ns  2.2730us  cudaGetDevice
  0.00%  6.7040us         3  2.2340us  1.2050us  2.8530us  cudaEventCreateWithFlags
  0.00%  4.8470us        11     440ns     243ns  1.4670us  cudaDeviceGetAttribute
  0.00%  4.7510us         4  1.1870us     429ns  1.8950us  cudaConfigureCall
  0.00%  4.6910us         3  1.5630us     820ns  2.0260us  cudaEventRecord
  0.00%  3.5630us         3  1.1870us     820ns  1.4410us  cudaEventDestroy
  0.00%  3.3120us         2  1.6560us  1.4210us  1.8910us  cuDeviceGetCount
  0.00%     906ns         2     453ns     397ns     509ns  cuDeviceGet
  0.00%     524ns         1     524ns     524ns     524ns  cudaGetLastError
