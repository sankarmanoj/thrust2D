==14012== NVPROF is profiling process 14012, command: ./pyrdown.o
==14012== Profiling application: ./pyrdown.o
==14012== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.55%  139.55us        25  5.5810us     544ns  123.93us  [CUDA memcpy HtoD]
 29.00%  88.860us         1  88.860us  88.860us  88.860us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 20.55%  62.974us        19  3.3140us     320ns  54.142us  [CUDA memcpy DtoH]
  3.68%  11.263us         4  2.8150us  1.4080us  4.3830us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.22%  3.7440us         1  3.7440us  3.7440us  3.7440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==14012== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.27%  411.89ms        11  37.444ms  6.7360us  407.77ms  cudaMalloc
  1.43%  6.0445ms         1  6.0445ms  6.0445ms  6.0445ms  cudaGetDeviceProperties
  0.54%  2.3033ms        91  25.310us     100ns  1.7033ms  cuDeviceGetAttribute
  0.38%  1.6099ms         5  321.98us  8.5680us  1.4255ms  cudaFree
  0.13%  530.62us        37  14.341us  2.0770us  296.28us  cudaMemcpyAsync
  0.11%  466.59us         7  66.655us  9.6380us  254.12us  cudaMemcpy
  0.06%  236.53us         6  39.421us  11.648us  98.789us  cudaLaunch
  0.05%  193.74us         1  193.74us  193.74us  193.74us  cuDeviceTotalMem
  0.02%  72.144us        20  3.6070us  1.3800us  12.535us  cudaFuncGetAttributes
  0.01%  27.168us         1  27.168us  27.168us  27.168us  cuDeviceGetName
  0.00%  17.500us        15  1.1660us     206ns  6.0380us  cudaGetDevice
  0.00%  11.961us         5  2.3920us  1.4510us  4.3650us  cudaEventCreateWithFlags
  0.00%  9.9490us         5  1.9890us  1.0420us  3.2270us  cudaEventRecord
  0.00%  8.3820us         8  1.0470us     109ns  5.3250us  cudaSetupArgument
  0.00%  7.2590us         5  1.4510us     928ns  2.1890us  cudaEventDestroy
  0.00%  6.7250us         6  1.1200us     318ns  2.3540us  cudaConfigureCall
  0.00%  6.0190us        11     547ns     208ns  2.8050us  cudaDeviceGetAttribute
  0.00%  3.5180us         3  1.1720us     232ns  2.7200us  cuDeviceGetCount
  0.00%  1.4140us         3     471ns     180ns     891ns  cuDeviceGet
