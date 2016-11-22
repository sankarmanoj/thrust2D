==30158== NVPROF is profiling process 30158, command: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==30158== Profiling application: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==30158== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.38%  858.82us         4  214.70us  1.2160us  436.75us  [CUDA memcpy HtoD]
 27.61%  500.44us         1  500.44us  500.44us  500.44us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<HotspotFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.92%  415.41us         1  415.41us  415.41us  415.41us  [CUDA memcpy DtoH]
  2.09%  37.857us         2  18.928us  18.113us  19.744us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30158== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.83%  238.48ms         4  59.621ms  5.3000us  237.82ms  cudaMalloc
  0.45%  1.0908ms         3  363.61us  10.144us  1.0612ms  cudaMemcpy
  0.37%  888.32us         2  444.16us  442.77us  445.55us  cudaMemcpyAsync
  0.12%  284.39us        90  3.1590us     136ns  105.29us  cuDeviceGetAttribute
  0.10%  239.23us         1  239.23us  239.23us  239.23us  cuDeviceTotalMem
  0.09%  217.15us         2  108.58us  74.530us  142.62us  cudaFree
  0.01%  31.128us         3  10.376us  8.9810us  13.019us  cudaLaunch
  0.01%  26.754us         1  26.754us  26.754us  26.754us  cuDeviceGetName
  0.01%  20.458us        12  1.7040us  1.3790us  3.4540us  cudaFuncGetAttributes
  0.00%  4.4960us         9     499ns     202ns  1.6780us  cudaGetDevice
  0.00%  3.1900us         3  1.0630us     888ns  1.3510us  cudaEventCreateWithFlags
  0.00%  3.0590us        11     278ns     195ns     908ns  cudaDeviceGetAttribute
  0.00%  2.6770us         3     892ns     664ns  1.2850us  cudaEventRecord
  0.00%  1.9180us         3     639ns     517ns     788ns  cudaEventDestroy
  0.00%  1.4890us         2     744ns     318ns  1.1710us  cuDeviceGetCount
  0.00%  1.2480us         3     416ns     256ns     621ns  cudaSetupArgument
  0.00%  1.0830us         3     361ns     187ns     608ns  cudaConfigureCall
  0.00%     395ns         2     197ns     153ns     242ns  cuDeviceGet
