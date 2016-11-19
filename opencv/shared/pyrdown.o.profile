==5748== NVPROF is profiling process 5748, command: ./pyrdown.o
==5748== Profiling application: ./pyrdown.o
==5748== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.18%  108.73us        25  4.3490us     576ns  81.210us  [CUDA memcpy HtoD]
 34.49%  84.890us         1  84.890us  84.890us  84.890us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 14.55%  35.806us        19  1.8840us     320ns  20.927us  [CUDA memcpy DtoH]
  5.04%  12.414us         4  3.1030us  1.4400us  5.1510us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.74%  4.2880us         1  4.2880us  4.2880us  4.2880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5748== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.39%  206.05ms        11  18.732ms  4.4460us  205.14ms  cudaMalloc
  0.41%  862.87us         1  862.87us  862.87us  862.87us  cuDeviceTotalMem
  0.38%  805.14us         2  402.57us  216.26us  588.89us  cudaGetDeviceProperties
  0.35%  740.72us        90  8.2300us     510ns  296.19us  cuDeviceGetAttribute
  0.15%  322.93us        37  8.7270us  2.1120us  62.076us  cudaMemcpyAsync
  0.10%  211.37us         7  30.195us  4.6420us  141.25us  cudaMemcpy
  0.09%  191.16us         5  38.231us  3.7820us  101.22us  cudaFree
  0.04%  89.369us         1  89.369us  89.369us  89.369us  cuDeviceGetName
  0.03%  69.168us         6  11.528us  5.6680us  27.307us  cudaLaunch
  0.02%  33.379us        20  1.6680us  1.3340us  3.6420us  cudaFuncGetAttributes
  0.00%  6.7930us         2  3.3960us  2.9880us  3.8050us  cuDeviceGetCount
  0.00%  6.2860us        15     419ns     203ns  1.3340us  cudaGetDevice
  0.00%  5.1860us         5  1.0370us     684ns  1.5310us  cudaEventCreateWithFlags
  0.00%  4.4620us         5     892ns     619ns  1.2870us  cudaEventRecord
  0.00%  3.6070us         5     721ns     544ns     994ns  cudaEventDestroy
  0.00%  3.2660us        11     296ns     204ns     877ns  cudaDeviceGetAttribute
  0.00%  2.6480us         6     441ns     144ns     987ns  cudaConfigureCall
  0.00%  1.9950us         2     997ns     970ns  1.0250us  cuDeviceGet
  0.00%  1.8510us         8     231ns     113ns     425ns  cudaSetupArgument
