==25363== NVPROF is profiling process 25363, command: ./harris.o
==25363== Profiling application: ./harris.o
==25363== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.27%  576.55us        24  24.022us     545ns  539.43us  [CUDA memcpy HtoD]
 42.04%  482.16us        19  25.376us     320ns  472.36us  [CUDA memcpy DtoH]
  6.85%  78.599us         1  78.599us  78.599us  78.599us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, HarrisIntensityFunctor)
  0.84%  9.6410us         3  3.2130us  1.4100us  5.2840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25363== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.89%  908.66ms         8  113.58ms  25.392us  900.34ms  cudaMalloc
  1.62%  15.227ms         1  15.227ms  15.227ms  15.227ms  cudaGetDeviceProperties
  0.54%  5.0863ms        90  56.514us     127ns  3.3046ms  cuDeviceGetAttribute
  0.43%  3.9913ms         3  1.3304ms  123.41us  2.3179ms  cudaFree
  0.22%  2.0442ms         6  340.69us  19.840us  975.71us  cudaMemcpy
  0.21%  1.9944ms        37  53.903us  3.6110us  915.71us  cudaMemcpyAsync
  0.04%  416.90us         4  104.23us  61.468us  165.68us  cudaLaunch
  0.02%  182.32us         1  182.32us  182.32us  182.32us  cuDeviceTotalMem
  0.01%  71.501us        12  5.9580us  2.2210us  16.428us  cudaFuncGetAttributes
  0.00%  45.575us         1  45.575us  45.575us  45.575us  cuDeviceGetName
  0.00%  27.042us         3  9.0140us  6.2490us  11.979us  cudaEventCreateWithFlags
  0.00%  24.632us         3  8.2100us  3.6780us  14.034us  cudaEventDestroy
  0.00%  23.701us         9  2.6330us     379ns  8.5950us  cudaGetDevice
  0.00%  20.188us         3  6.7290us  3.4960us  9.8860us  cudaEventRecord
  0.00%  15.202us         7  2.1710us     160ns  11.894us  cudaSetupArgument
  0.00%  10.854us         4  2.7130us  1.7710us  4.5220us  cudaConfigureCall
  0.00%  9.4030us        11     854ns     295ns  2.9580us  cudaDeviceGetAttribute
  0.00%  9.1170us         2  4.5580us  4.3970us  4.7200us  cuDeviceGetCount
  0.00%  1.8320us         2     916ns     568ns  1.2640us  cuDeviceGet
