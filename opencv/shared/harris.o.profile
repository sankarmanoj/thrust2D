==12567== NVPROF is profiling process 12567, command: ./harris.o
==12567== Profiling application: ./harris.o
==12567== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.95%  394.80us        19  20.779us     320ns  384.63us  [CUDA memcpy DtoH]
 36.96%  280.89us        24  11.703us     544ns  264.89us  [CUDA memcpy HtoD]
  9.68%  73.598us         1  73.598us  73.598us  73.598us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, HarrisIntensityFunctor)
  1.40%  10.656us         3  3.5520us  1.3120us  5.4720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12567== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.15%  376.36ms         8  47.045ms  11.720us  375.39ms  cudaMalloc
  0.29%  1.1016ms         6  183.60us  9.3120us  919.23us  cudaMemcpy
  0.21%  781.37us        37  21.118us  3.7310us  474.19us  cudaMemcpyAsync
  0.11%  431.17us         3  143.72us  53.553us  221.58us  cudaFree
  0.06%  244.71us         1  244.71us  244.71us  244.71us  cudaGetDeviceProperties
  0.06%  211.95us        90  2.3550us     132ns  74.365us  cuDeviceGetAttribute
  0.05%  175.86us         1  175.86us  175.86us  175.86us  cuDeviceTotalMem
  0.04%  141.75us         4  35.438us  26.746us  49.596us  cudaLaunch
  0.01%  46.930us        12  3.9100us  2.3100us  9.8870us  cudaFuncGetAttributes
  0.01%  32.654us         1  32.654us  32.654us  32.654us  cuDeviceGetName
  0.00%  13.963us         7  1.9940us     205ns  10.552us  cudaSetupArgument
  0.00%  12.081us         3  4.0270us  2.5030us  5.0800us  cudaEventCreateWithFlags
  0.00%  10.756us         9  1.1950us     328ns  3.7790us  cudaGetDevice
  0.00%  10.496us         3  3.4980us  1.9690us  5.2090us  cudaEventRecord
  0.00%  7.7170us        11     701ns     267ns  2.4740us  cudaDeviceGetAttribute
  0.00%  6.8750us         4  1.7180us     735ns  3.5080us  cudaConfigureCall
  0.00%  6.1420us         3  2.0470us  1.5550us  2.3960us  cudaEventDestroy
  0.00%  4.5430us         2  2.2710us     397ns  4.1460us  cuDeviceGetCount
  0.00%     913ns         2     456ns     310ns     603ns  cuDeviceGet
