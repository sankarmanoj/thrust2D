==29156== NVPROF is profiling process 29156, command: ./erode.o
==29156== Profiling application: ./erode.o
==29156== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.51%  148.74us         1  148.74us  148.74us  148.74us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, erodeFunctor)
 24.60%  77.025us         6  12.837us     576ns  72.225us  [CUDA memcpy HtoD]
 24.12%  75.520us         1  75.520us  75.520us  75.520us  [CUDA memcpy DtoH]
  2.74%  8.5760us         2  4.2880us  4.1280us  4.4480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.03%  3.2320us         1  3.2320us  3.2320us  3.2320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29156== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.05%  802.03ms         8  100.25ms  8.1730us  797.70ms  cudaMalloc
  1.36%  11.241ms         1  11.241ms  11.241ms  11.241ms  cudaGetDeviceProperties
  0.66%  5.4417ms         1  5.4417ms  5.4417ms  5.4417ms  cuDeviceGetName
  0.51%  4.1758ms        90  46.397us     122ns  2.2316ms  cuDeviceGetAttribute
  0.28%  2.2842ms         3  761.38us  30.548us  1.5806ms  cudaFree
  0.07%  540.50us         6  90.083us  6.1630us  428.30us  cudaMemcpy
  0.04%  317.97us         1  317.97us  317.97us  317.97us  cuDeviceTotalMem
  0.02%  160.13us         4  40.031us  12.024us  82.610us  cudaLaunch
  0.01%  113.61us         1  113.61us  113.61us  113.61us  cudaMemcpyAsync
  0.00%  35.895us        12  2.9910us  2.3200us  5.6250us  cudaFuncGetAttributes
  0.00%  7.5530us         9     839ns     368ns  2.2360us  cudaGetDevice
  0.00%  6.4760us         7     925ns     206ns  4.1940us  cudaSetupArgument
  0.00%  5.9900us         3  1.9960us  1.4390us  2.3180us  cudaEventCreateWithFlags
  0.00%  4.8840us         3  1.6280us  1.1310us  1.8980us  cudaEventRecord
  0.00%  4.5570us        11     414ns     310ns     974ns  cudaDeviceGetAttribute
  0.00%  4.1970us         4  1.0490us     412ns  1.9370us  cudaConfigureCall
  0.00%  3.5750us         3  1.1910us     971ns  1.3500us  cudaEventDestroy
  0.00%  3.3970us         2  1.6980us  1.0510us  2.3460us  cuDeviceGetCount
  0.00%     889ns         2     444ns     330ns     559ns  cuDeviceGet
  0.00%     696ns         1     696ns     696ns     696ns  cudaGetLastError
