==17436== NVPROF is profiling process 17436, command: ./dilate.o
==17436== Profiling application: ./dilate.o
==17436== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 42.53%  119.67us         6  19.945us     544ns  116.66us  [CUDA memcpy HtoD]
 41.29%  116.18us         1  116.18us  116.18us  116.18us  [CUDA memcpy DtoH]
  8.73%  24.574us         1  24.574us  24.574us  24.574us  void thrust::transform_texture_kernel<float, dilateFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, dilateFunctor)
  3.17%  8.9280us         2  4.4640us  4.0960us  4.8320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.05%  8.5760us         1  8.5760us  8.5760us  8.5760us  [CUDA memcpy DtoD]
  1.22%  3.4240us         1  3.4240us  3.4240us  3.4240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==17436== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.86%  166.00ms         8  20.750ms  4.8290us  165.63ms  cudaMalloc
  0.34%  574.59us         6  95.764us  3.0850us  541.46us  cudaMemcpy
  0.18%  301.61us         2  150.81us  127.04us  174.57us  cudaGetDeviceProperties
  0.13%  224.75us         3  74.916us  11.919us  172.55us  cudaFree
  0.12%  195.93us        91  2.1530us      97ns  102.24us  cuDeviceGetAttribute
  0.11%  181.11us         1  181.11us  181.11us  181.11us  cudaMallocPitch
  0.09%  155.03us         1  155.03us  155.03us  155.03us  cuDeviceTotalMem
  0.08%  125.95us         1  125.95us  125.95us  125.95us  cudaMemcpyAsync
  0.03%  50.948us         4  12.737us  8.3980us  21.569us  cudaLaunch
  0.02%  29.451us        12  2.4540us  1.3580us  12.546us  cudaFuncGetAttributes
  0.02%  27.537us         1  27.537us  27.537us  27.537us  cudaMemcpy2D
  0.01%  17.023us         1  17.023us  17.023us  17.023us  cuDeviceGetName
  0.01%  9.9480us         1  9.9480us  9.9480us  9.9480us  cudaCreateTextureObject
  0.00%  4.4560us         9     495ns     203ns  1.5490us  cudaGetDevice
  0.00%  3.7370us         3  1.2450us  1.0090us  1.6430us  cudaEventCreateWithFlags
  0.00%  3.2190us         3  1.0730us     803ns  1.5850us  cudaEventRecord
  0.00%  3.0530us        11     277ns     203ns     723ns  cudaDeviceGetAttribute
  0.00%  2.3500us         3     783ns     666ns  1.0100us  cudaEventDestroy
  0.00%  1.9240us         4     481ns     286ns     969ns  cudaConfigureCall
  0.00%  1.5880us         7     226ns     107ns     494ns  cudaSetupArgument
  0.00%  1.5180us         3     506ns     100ns  1.1870us  cuDeviceGetCount
  0.00%     722ns         3     240ns     115ns     419ns  cuDeviceGet
  0.00%     135ns         1     135ns     135ns     135ns  cudaCreateChannelDesc
