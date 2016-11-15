==12947== NVPROF is profiling process 12947, command: ./dilate.o
==12947== Profiling application: ./dilate.o
==12947== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.85%  127.01us         1  127.01us  127.01us  127.01us  [CUDA memcpy DtoH]
 31.67%  109.15us         5  21.830us     576ns  106.75us  [CUDA memcpy HtoD]
 26.69%  91.966us         1  91.966us  91.966us  91.966us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.87%  13.344us         3  4.4480us  3.5840us  4.9920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.92%  3.1680us         1  3.1680us  3.1680us  3.1680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12947== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.27%  182.52ms         8  22.815ms  5.4410us  181.99ms  cudaMalloc
  0.32%  592.44us         5  118.49us  6.0050us  561.46us  cudaMemcpy
  0.09%  173.26us         1  173.26us  173.26us  173.26us  cuDeviceTotalMem
  0.09%  170.70us        90  1.8960us      97ns  67.500us  cuDeviceGetAttribute
  0.08%  143.29us         4  35.821us  4.9270us  66.480us  cudaFree
  0.07%  122.98us         1  122.98us  122.98us  122.98us  cudaMemcpyAsync
  0.03%  62.623us         5  12.524us  9.8350us  19.505us  cudaLaunch
  0.02%  33.931us        20  1.6960us  1.3590us  4.0580us  cudaFuncGetAttributes
  0.01%  16.245us         1  16.245us  16.245us  16.245us  cuDeviceGetName
  0.00%  6.7680us        15     451ns     242ns  1.2970us  cudaGetDevice
  0.00%  5.4760us         5  1.0950us     861ns  1.5640us  cudaEventCreateWithFlags
  0.00%  4.6370us         5     927ns     722ns  1.5000us  cudaEventRecord
  0.00%  3.7510us         5     750ns     563ns  1.1380us  cudaEventDestroy
  0.00%  3.7050us         5     741ns     237ns  2.4830us  cudaSetupArgument
  0.00%  3.2000us        11     290ns     200ns     963ns  cudaDeviceGetAttribute
  0.00%  1.9130us         5     382ns     236ns     790ns  cudaConfigureCall
  0.00%  1.7870us         2     893ns     437ns  1.3500us  cuDeviceGetCount
  0.00%     329ns         2     164ns     152ns     177ns  cuDeviceGet
