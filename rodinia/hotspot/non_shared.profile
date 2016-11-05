==9137== NVPROF is profiling process 9137, command: ./hotspot.out 1024 2 2 temp_1024 power_1024 result.out
==9137== Profiling application: ./hotspot.out 1024 2 2 temp_1024 power_1024 result.out
==9137== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.19%  853.05us         4  213.26us  1.1830us  435.82us  [CUDA memcpy HtoD]
 31.35%  605.18us         1  605.18us  605.18us  605.18us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HotspotFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 21.58%  416.69us         1  416.69us  416.69us  416.69us  [CUDA memcpy DtoH]
  1.99%  38.480us         2  19.240us  18.776us  19.704us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.89%  17.112us         1  17.112us  17.112us  17.112us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<int>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<int>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9137== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.94%  270.93ms         5  54.185ms  5.5180us  269.89ms  cudaMalloc
  0.33%  903.81us         2  451.90us  444.55us  459.25us  cudaMemcpyAsync
  0.33%  901.08us         3  300.36us  73.758us  693.64us  cudaFree
  0.21%  563.48us         3  187.83us  9.5920us  534.97us  cudaMemcpy
  0.09%  251.69us        90  2.7960us     116ns  97.215us  cuDeviceGetAttribute
  0.07%  186.00us         1  186.00us  186.00us  186.00us  cuDeviceTotalMem
  0.01%  38.037us         4  9.5090us  6.0380us  12.801us  cudaLaunch
  0.01%  26.523us        16  1.6570us  1.3870us  3.6600us  cudaFuncGetAttributes
  0.01%  23.805us         1  23.805us  23.805us  23.805us  cuDeviceGetName
  0.00%  4.8030us        12     400ns     202ns  1.3170us  cudaGetDevice
  0.00%  3.5560us         4     889ns     558ns  1.2930us  cudaEventCreateWithFlags
  0.00%  3.2310us         4     807ns     528ns  1.2840us  cudaEventRecord
  0.00%  2.8860us        11     262ns     203ns     616ns  cudaDeviceGetAttribute
  0.00%  2.5990us         4     649ns     394ns     907ns  cudaEventDestroy
  0.00%  1.5570us         2     778ns     161ns  1.3960us  cuDeviceGetCount
  0.00%  1.4860us         4     371ns     190ns     791ns  cudaConfigureCall
  0.00%  1.4170us         4     354ns     271ns     528ns  cudaSetupArgument
  0.00%     411ns         2     205ns     152ns     259ns  cuDeviceGet
