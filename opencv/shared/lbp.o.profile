==14264== NVPROF is profiling process 14264, command: ./lbp.o
==14264== Profiling application: ./lbp.o
==14264== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.66%  103.71us         1  103.71us  103.71us  103.71us  [CUDA memcpy DtoH]
 33.93%  91.004us         6  15.167us     576ns  87.932us  [CUDA memcpy HtoD]
 19.81%  53.150us         1  53.150us  53.150us  53.150us  void thrust::transform_texture_kernel<float, lbpFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
  3.23%  8.6710us         1  8.6710us  8.6710us  8.6710us  [CUDA memcpy DtoD]
  3.15%  8.4470us         2  4.2230us  3.8080us  4.6390us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.22%  3.2640us         1  3.2640us  3.2640us  3.2640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==14264== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.55%  165.45ms         8  20.681ms  5.0050us  165.05ms  cudaMalloc
  0.49%  823.63us         1  823.63us  823.63us  823.63us  cuDeviceGetName
  0.33%  552.06us         6  92.010us  3.1510us  519.10us  cudaMemcpy
  0.11%  188.28us         1  188.28us  188.28us  188.28us  cuDeviceTotalMem
  0.10%  168.38us         1  168.38us  168.38us  168.38us  cudaMallocPitch
  0.10%  164.16us        91  1.8030us      98ns  68.274us  cuDeviceGetAttribute
  0.09%  150.62us         1  150.62us  150.62us  150.62us  cudaGetDeviceProperties
  0.09%  145.33us         3  48.442us  7.6450us  98.959us  cudaFree
  0.04%  74.943us         1  74.943us  74.943us  74.943us  cudaMemcpyAsync
  0.03%  53.141us         4  13.285us  8.8560us  24.169us  cudaLaunch
  0.02%  39.583us         1  39.583us  39.583us  39.583us  cudaMemcpy2D
  0.01%  24.597us        12  2.0490us  1.3520us  7.8810us  cudaFuncGetAttributes
  0.01%  21.365us         1  21.365us  21.365us  21.365us  cudaCreateTextureObject
  0.00%  4.2930us         9     477ns     212ns  1.5480us  cudaGetDevice
  0.00%  3.8980us         3  1.2990us     955ns  1.9700us  cudaEventCreateWithFlags
  0.00%  3.7300us         7     532ns     117ns  2.6300us  cudaSetupArgument
  0.00%  3.4850us        11     316ns     216ns     841ns  cudaDeviceGetAttribute
  0.00%  3.2650us         3  1.0880us     762ns  1.7000us  cudaEventRecord
  0.00%  2.4040us         3     801ns     674ns  1.0350us  cudaEventDestroy
  0.00%  1.8220us         4     455ns     303ns     809ns  cudaConfigureCall
  0.00%  1.7460us         3     582ns      97ns  1.4540us  cuDeviceGetCount
  0.00%     585ns         3     195ns     110ns     274ns  cuDeviceGet
  0.00%     184ns         1     184ns     184ns     184ns  cudaCreateChannelDesc
