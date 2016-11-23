==3522== NVPROF is profiling process 3522, command: ./sobel_filter.o
==3522== Profiling application: ./sobel_filter.o
==3522== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 28.24%  213.18us         2  106.59us  102.30us  110.88us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.29%  168.24us        27  6.2310us     704ns  149.48us  [CUDA memcpy HtoD]
 18.71%  141.23us         1  141.23us  141.23us  141.23us  [CUDA memcpy DtoH]
 10.94%  82.551us         7  11.793us     960ns  21.862us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 10.31%  77.846us         1  77.846us  77.846us  77.846us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  9.01%  68.020us         2  34.010us  31.977us  36.043us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.50%  3.8100us         1  3.8100us  3.8100us  3.8100us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3522== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.34%  319.21ms        16  19.951ms  4.3490us  317.96ms  cudaMalloc
  0.30%  954.60us         9  106.07us  5.0580us  867.93us  cudaMemcpy
  0.11%  354.08us         8  44.259us  5.8210us  149.39us  cudaFree
  0.07%  212.42us        90  2.3600us      96ns  84.458us  cuDeviceGetAttribute
  0.05%  171.88us         1  171.88us  171.88us  171.88us  cuDeviceTotalMem
  0.04%  131.52us        13  10.117us  5.2010us  20.343us  cudaLaunch
  0.03%  109.38us        19  5.7560us  1.8350us  72.794us  cudaMemcpyAsync
  0.03%  88.092us        52  1.6940us  1.3500us  3.8750us  cudaFuncGetAttributes
  0.01%  30.239us         1  30.239us  30.239us  30.239us  cuDeviceGetName
  0.00%  14.624us        39     374ns     197ns  1.7130us  cudaGetDevice
  0.00%  12.165us        13     935ns     614ns  1.4260us  cudaEventCreateWithFlags
  0.00%  10.522us        13     809ns     567ns  1.3550us  cudaEventRecord
  0.00%  9.1120us        13     700ns     444ns  1.0770us  cudaEventDestroy
  0.00%  5.5480us        13     426ns     166ns  2.5770us  cudaSetupArgument
  0.00%  3.7750us        13     290ns     167ns     712ns  cudaConfigureCall
  0.00%  3.5150us        11     319ns     199ns     670ns  cudaDeviceGetAttribute
  0.00%  2.7090us         2  1.3540us     746ns  1.9630us  cuDeviceGetCount
  0.00%  1.1460us         1  1.1460us  1.1460us  1.1460us  cudaGetLastError
  0.00%     629ns         2     314ns     150ns     479ns  cuDeviceGet
