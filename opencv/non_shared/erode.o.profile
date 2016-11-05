==6183== NVPROF is profiling process 6183, command: ./erode.o
==6183== Profiling application: ./erode.o
==6183== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.59%  84.147us         1  84.147us  84.147us  84.147us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 31.10%  77.907us         5  15.581us     863ns  73.397us  [CUDA memcpy HtoD]
 29.51%  73.941us         1  73.941us  73.941us  73.941us  [CUDA memcpy DtoH]
  4.76%  11.935us         3  3.9780us  3.7760us  4.1280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.03%  2.5910us         1  2.5910us  2.5910us  2.5910us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6183== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.22%  689.68ms         8  86.210ms  5.9120us  684.23ms  cudaMalloc
  3.06%  21.954ms        90  243.94us     118ns  12.530ms  cuDeviceGetAttribute
  0.34%  2.4608ms         1  2.4608ms  2.4608ms  2.4608ms  cuDeviceTotalMem
  0.20%  1.4114ms         4  352.85us  8.3280us  633.04us  cudaFree
  0.08%  575.95us         1  575.95us  575.95us  575.95us  cudaMemcpyAsync
  0.05%  377.13us         5  75.426us  15.528us  252.35us  cudaMemcpy
  0.02%  135.64us         1  135.64us  135.64us  135.64us  cuDeviceGetName
  0.02%  113.77us         5  22.753us  8.7790us  29.832us  cudaLaunch
  0.01%  42.649us        20  2.1320us  1.4080us  4.5390us  cudaFuncGetAttributes
  0.00%  11.917us        15     794ns     224ns  2.9920us  cudaGetDevice
  0.00%  8.2270us         5  1.6450us     884ns  2.2150us  cudaEventCreateWithFlags
  0.00%  7.0550us         5  1.4110us     788ns  1.9190us  cudaEventRecord
  0.00%  5.5670us         5  1.1130us     265ns  3.4970us  cudaSetupArgument
  0.00%  5.4170us         5  1.0830us     620ns  1.3200us  cudaEventDestroy
  0.00%  3.9810us         5     796ns     283ns  1.0570us  cudaConfigureCall
  0.00%  3.3650us        11     305ns     210ns     938ns  cudaDeviceGetAttribute
  0.00%  2.1550us         2  1.0770us     269ns  1.8860us  cuDeviceGetCount
  0.00%     578ns         2     289ns     159ns     419ns  cuDeviceGet
