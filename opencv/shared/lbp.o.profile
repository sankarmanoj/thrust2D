==12762== NVPROF is profiling process 12762, command: ./lbp.o
==12762== Profiling application: ./lbp.o
==12762== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.02%  126.49us         6  21.081us  1.1840us  120.44us  [CUDA memcpy HtoD]
 34.24%  100.67us         1  100.67us  100.67us  100.67us  [CUDA memcpy DtoH]
 18.53%  54.494us         1  54.494us  54.494us  54.494us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, lbpFunctor)
  2.84%  8.3520us         2  4.1760us  3.8400us  4.5120us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.37%  4.0320us         1  4.0320us  4.0320us  4.0320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12762== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.44%  730.72ms         8  91.340ms  16.150us  727.56ms  cudaMalloc
  3.23%  24.704ms         3  8.2346ms  50.771us  24.173ms  cudaFree
  0.73%  5.5608ms         1  5.5608ms  5.5608ms  5.5608ms  cudaGetDeviceProperties
  0.22%  1.7146ms         6  285.77us  14.749us  1.0438ms  cudaMemcpy
  0.18%  1.3848ms         1  1.3848ms  1.3848ms  1.3848ms  cudaMemcpyAsync
  0.09%  703.98us         4  176.00us  42.084us  543.46us  cudaLaunch
  0.05%  385.28us        90  4.2800us     134ns  148.62us  cuDeviceGetAttribute
  0.03%  204.89us         1  204.89us  204.89us  204.89us  cuDeviceTotalMem
  0.02%  130.79us         3  43.597us  2.3610us  124.94us  cudaEventDestroy
  0.01%  46.872us        12  3.9060us  2.0230us  9.6550us  cudaFuncGetAttributes
  0.01%  44.286us         1  44.286us  44.286us  44.286us  cuDeviceGetName
  0.00%  15.796us         9  1.7550us     335ns  6.0700us  cudaGetDevice
  0.00%  14.975us         7  2.1390us     164ns  11.584us  cudaSetupArgument
  0.00%  14.222us         3  4.7400us  3.4070us  6.8370us  cudaEventCreateWithFlags
  0.00%  8.2380us         3  2.7460us  2.5950us  2.9910us  cudaEventRecord
  0.00%  7.1850us         4  1.7960us  1.0500us  2.8970us  cudaConfigureCall
  0.00%  6.4310us        11     584ns     257ns  2.3000us  cudaDeviceGetAttribute
  0.00%  2.6290us         2  1.3140us     807ns  1.8220us  cuDeviceGetCount
  0.00%     681ns         2     340ns     235ns     446ns  cuDeviceGet
