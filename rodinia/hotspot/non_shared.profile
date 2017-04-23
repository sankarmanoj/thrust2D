==11466== NVPROF is profiling process 11466, command: ./hotspot.out 1024 2 2 temp_1024 power_1024 result.out
==11466== Profiling application: ./hotspot.out 1024 2 2 temp_1024 power_1024 result.out
==11466== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.09%  70.536ms         1  70.536ms  70.536ms  70.536ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<int>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HotspotFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.17%  1.5962ms         1  1.5962ms  1.5962ms  1.5962ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<int>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<int>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.14%  839.51us         7  119.93us  1.1840us  417.15us  [CUDA memcpy HtoD]
  0.59%  431.99us         1  431.99us  431.99us  431.99us  [CUDA memcpy DtoH]

==11466== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.57%  2.15218s         2  1.07609s  347.15us  2.15183s  cudaMallocPitch
  3.24%  72.139ms         2  36.070ms  1.6000ms  70.539ms  cudaDeviceSynchronize
  0.07%  1.4982ms         3  499.39us  443.35us  559.16us  cudaMemcpy2D
  0.05%  1.1856ms         2  592.79us  555.13us  630.45us  cudaLaunch
  0.03%  725.93us         6  120.99us  4.4260us  355.36us  cudaMalloc
  0.02%  463.50us        90  5.1500us     127ns  205.56us  cuDeviceGetAttribute
  0.01%  206.54us         1  206.54us  206.54us  206.54us  cuDeviceTotalMem
  0.01%  163.37us         1  163.37us  163.37us  163.37us  cudaFree
  0.00%  37.919us         1  37.919us  37.919us  37.919us  cuDeviceGetName
  0.00%  32.962us         5  6.5920us  4.7590us  10.075us  cudaMemcpy
  0.00%  12.831us         8  1.6030us  1.3510us  2.6070us  cudaFuncGetAttributes
  0.00%  2.9070us        11     264ns     199ns     706ns  cudaDeviceGetAttribute
  0.00%  2.6110us         2  1.3050us  1.2510us  1.3600us  cudaEventCreateWithFlags
  0.00%  2.5460us         6     424ns     192ns  1.2080us  cudaGetDevice
  0.00%  2.1900us         2  1.0950us     894ns  1.2960us  cudaEventRecord
  0.00%  1.5830us         2     791ns     691ns     892ns  cudaEventDestroy
  0.00%  1.3610us         2     680ns     275ns  1.0860us  cuDeviceGetCount
  0.00%  1.0370us         2     518ns     324ns     713ns  cudaConfigureCall
  0.00%     768ns         2     384ns     308ns     460ns  cudaSetupArgument
  0.00%     518ns         2     259ns     172ns     346ns  cuDeviceGet
