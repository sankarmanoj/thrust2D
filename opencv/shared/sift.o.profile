==12469== NVPROF is profiling process 12469, command: ./sift.o
==12469== Profiling application: ./sift.o
==12469== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 77.08%  3.5060ms        12  292.16us     576ns  2.8357ms  [CUDA memcpy HtoD]
 13.59%  618.03us         1  618.03us  618.03us  618.03us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
  8.45%  384.28us         1  384.28us  384.28us  384.28us  [CUDA memcpy DtoH]
  0.65%  29.503us         4  7.3750us  1.4400us  19.199us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.23%  10.592us         3  3.5300us  1.4400us  5.5680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12469== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.32%  497.37ms        16  31.086ms  8.8730us  495.35ms  cudaMalloc
  0.95%  4.8470ms         1  4.8470ms  4.8470ms  4.8470ms  cudaGetDeviceProperties
  0.87%  4.4403ms         3  1.4801ms  288.62us  3.3497ms  cudaMemcpyAsync
  0.37%  1.9079ms        10  190.79us  8.1590us  1.6103ms  cudaMemcpy
  0.17%  879.65us         7  125.66us  12.198us  565.33us  cudaFree
  0.12%  614.15us         1  614.15us  614.15us  614.15us  cudaDeviceSynchronize
  0.07%  374.27us         8  46.783us  20.718us  125.38us  cudaLaunch
  0.04%  216.09us        90  2.4000us     133ns  74.957us  cuDeviceGetAttribute
  0.03%  173.55us         1  173.55us  173.55us  173.55us  cuDeviceTotalMem
  0.02%  99.473us        28  3.5520us  2.0260us  18.809us  cudaFuncGetAttributes
  0.01%  36.922us         1  36.922us  36.922us  36.922us  cuDeviceGetName
  0.00%  21.186us        21  1.0080us     303ns  6.9580us  cudaGetDevice
  0.00%  20.776us         7  2.9680us  1.5440us  7.2250us  cudaEventCreateWithFlags
  0.00%  18.534us        11  1.6840us     150ns  15.218us  cudaSetupArgument
  0.00%  13.542us         7  1.9340us  1.1130us  5.6370us  cudaEventRecord
  0.00%  12.324us         8  1.5400us     577ns  3.8660us  cudaConfigureCall
  0.00%  11.878us         7  1.6960us  1.1070us  3.5760us  cudaEventDestroy
  0.00%  10.669us        11     969ns     295ns  4.8880us  cudaDeviceGetAttribute
  0.00%  4.2450us         2  2.1220us     387ns  3.8580us  cuDeviceGetCount
  0.00%     703ns         2     351ns     312ns     391ns  cuDeviceGet
