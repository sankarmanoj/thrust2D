==12954== NVPROF is profiling process 12954, command: ./harris.o
==12954== Profiling application: ./harris.o
==12954== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.72%  108.57us        24  4.5230us     608ns  81.309us  [CUDA memcpy HtoD]
 33.92%  97.629us        19  5.1380us     320ns  82.461us  [CUDA memcpy DtoH]
 25.41%  73.149us         1  73.149us  73.149us  73.149us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, HarrisIntensityFunctor)
  2.95%  8.4800us         3  2.8260us  1.3120us  4.4160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12954== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.86%  570.26ms         8  71.282ms  5.7250us  567.31ms  cudaMalloc
  5.81%  36.041ms         3  12.014ms  27.491us  35.657ms  cudaFree
  1.09%  6.7715ms        90  75.238us     134ns  2.4119ms  cuDeviceGetAttribute
  1.01%  6.2442ms         1  6.2442ms  6.2442ms  6.2442ms  cudaGetDeviceProperties
  0.07%  452.26us         1  452.26us  452.26us  452.26us  cuDeviceTotalMem
  0.06%  371.20us        37  10.032us  1.9690us  89.913us  cudaMemcpyAsync
  0.06%  342.95us         6  57.159us  4.8520us  246.46us  cudaMemcpy
  0.02%  127.51us         1  127.51us  127.51us  127.51us  cuDeviceGetName
  0.02%  106.75us         4  26.687us  21.107us  33.650us  cudaLaunch
  0.01%  31.162us        12  2.5960us  1.4420us  5.6640us  cudaFuncGetAttributes
  0.00%  7.0340us         9     781ns     209ns  2.4150us  cudaGetDevice
  0.00%  6.3540us         3  2.1180us  1.6950us  2.3760us  cudaEventCreateWithFlags
  0.00%  6.1130us         7     873ns     116ns  4.5200us  cudaSetupArgument
  0.00%  4.4750us         3  1.4910us  1.3560us  1.5720us  cudaEventRecord
  0.00%  4.0780us         4  1.0190us     842ns  1.2440us  cudaConfigureCall
  0.00%  3.5690us        11     324ns     207ns  1.1820us  cudaDeviceGetAttribute
  0.00%  3.2280us         3  1.0760us  1.0370us  1.1300us  cudaEventDestroy
  0.00%  2.1180us         2  1.0590us     390ns  1.7280us  cuDeviceGetCount
  0.00%     860ns         2     430ns     210ns     650ns  cuDeviceGet
