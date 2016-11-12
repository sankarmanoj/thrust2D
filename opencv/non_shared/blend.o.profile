==29894== NVPROF is profiling process 29894, command: ./blend.o
==29894== Profiling application: ./blend.o
==29894== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.43%  189.86us         5  37.971us  1.1840us  93.345us  [CUDA memcpy HtoD]
 29.93%  104.42us         1  104.42us  104.42us  104.42us  [CUDA memcpy DtoH]
 11.77%  41.057us         1  41.057us  41.057us  41.057us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.87%  13.504us         3  4.5010us  3.7440us  5.4080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29894== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.33%  332.33ms         6  55.388ms  9.1770us  331.11ms  cudaMalloc
  0.15%  502.16us         2  251.08us  237.35us  264.82us  cudaMemcpyAsync
  0.14%  460.01us         4  115.00us  12.090us  395.81us  cudaMemcpy
  0.12%  417.54us        90  4.6390us     132ns  164.35us  cuDeviceGetAttribute
  0.09%  308.25us         3  102.75us  18.965us  199.04us  cudaFree
  0.07%  224.44us         1  224.44us  224.44us  224.44us  cuDeviceTotalMem
  0.05%  151.37us         4  37.841us  27.397us  51.778us  cudaLaunch
  0.02%  59.995us         1  59.995us  59.995us  59.995us  cuDeviceGetName
  0.02%  55.627us        16  3.4760us  2.1250us  9.5610us  cudaFuncGetAttributes
  0.00%  13.130us        12  1.0940us     281ns  3.2510us  cudaGetDevice
  0.00%  11.387us         4  2.8460us  2.2960us  3.3090us  cudaEventCreateWithFlags
  0.00%  8.2330us         4  2.0580us     632ns  4.6890us  cudaSetupArgument
  0.00%  8.1470us         4  2.0360us  1.7490us  2.3600us  cudaEventRecord
  0.00%  5.7770us         4  1.4440us  1.0480us  1.8730us  cudaConfigureCall
  0.00%  5.7160us         4  1.4290us  1.1150us  1.6620us  cudaEventDestroy
  0.00%  5.1250us        11     465ns     279ns  1.3740us  cudaDeviceGetAttribute
  0.00%  3.5680us         2  1.7840us  1.5940us  1.9740us  cuDeviceGetCount
  0.00%  1.1720us         2     586ns     452ns     720ns  cuDeviceGet
