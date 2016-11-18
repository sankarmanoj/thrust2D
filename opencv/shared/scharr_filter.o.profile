==6596== NVPROF is profiling process 6596, command: ./scharr_filter.o
==6596== Profiling application: ./scharr_filter.o
==6596== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.56%  128.19us        26  4.9300us     576ns  99.871us  [CUDA memcpy HtoD]
 29.19%  92.255us         1  92.255us  92.255us  92.255us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 26.10%  82.496us         1  82.496us  82.496us  82.496us  [CUDA memcpy DtoH]
  3.30%  10.432us         4  2.6080us     960ns  4.1280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.84%  2.6560us         1  2.6560us  2.6560us  2.6560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6596== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.17%  1.05683s        12  88.069ms  5.5550us  1.04470s  cudaMalloc
  1.91%  21.019ms         1  21.019ms  21.019ms  21.019ms  cudaGetDeviceProperties
  0.66%  7.2855ms         5  1.4571ms  5.6650us  5.1248ms  cudaFree
  0.52%  5.7587ms        90  63.985us     121ns  3.5226ms  cuDeviceGetAttribute
  0.39%  4.2722ms         1  4.2722ms  4.2722ms  4.2722ms  cuDeviceTotalMem
  0.28%  3.0753ms         1  3.0753ms  3.0753ms  3.0753ms  cuDeviceGetName
  0.03%  366.76us         8  45.845us  3.7620us  263.84us  cudaMemcpy
  0.01%  124.37us         6  20.728us  7.2290us  32.969us  cudaLaunch
  0.01%  116.86us        19  6.1500us  3.1640us  54.698us  cudaMemcpyAsync
  0.00%  46.121us        20  2.3060us  1.4380us  5.5200us  cudaFuncGetAttributes
  0.00%  11.406us        15     760ns     211ns  2.9380us  cudaGetDevice
  0.00%  8.2220us         5  1.6440us     891ns  2.6740us  cudaEventCreateWithFlags
  0.00%  7.2020us         9     800ns     122ns  5.1110us  cudaSetupArgument
  0.00%  6.0300us         2  3.0150us  2.8740us  3.1560us  cuDeviceGetCount
  0.00%  6.0010us         5  1.2000us     643ns  1.8270us  cudaEventRecord
  0.00%  5.1140us         5  1.0220us     549ns  1.3430us  cudaEventDestroy
  0.00%  5.1110us        11     464ns     327ns  1.1030us  cudaDeviceGetAttribute
  0.00%  4.1010us         6     683ns     176ns  1.2070us  cudaConfigureCall
  0.00%     988ns         2     494ns     443ns     545ns  cuDeviceGet
  0.00%     620ns         1     620ns     620ns     620ns  cudaGetLastError
