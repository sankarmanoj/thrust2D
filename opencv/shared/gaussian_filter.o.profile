==6598== NVPROF is profiling process 6598, command: ./gaussian_filter.o
==6598== Profiling application: ./gaussian_filter.o
==6598== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.25%  266.08us         1  266.08us  266.08us  266.08us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 21.99%  105.89us        25  4.2350us     576ns  80.703us  [CUDA memcpy HtoD]
 20.01%  96.384us        19  5.0720us     320ns  82.752us  [CUDA memcpy DtoH]
  1.96%  9.4400us         3  3.1460us  1.5040us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.80%  3.8400us         1  3.8400us  3.8400us  3.8400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6598== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.78%  613.22ms        10  61.322ms  5.0180us  602.01ms  cudaMalloc
  2.20%  14.212ms         1  14.212ms  14.212ms  14.212ms  cudaGetDeviceProperties
  1.60%  10.352ms        90  115.02us     117ns  4.7391ms  cuDeviceGetAttribute
  1.15%  7.4355ms         4  1.8589ms  21.637us  4.5072ms  cudaFree
  0.08%  514.14us         7  73.448us  4.5780us  443.31us  cudaMemcpy
  0.07%  455.50us         1  455.50us  455.50us  455.50us  cuDeviceGetName
  0.05%  343.21us        37  9.2760us  2.0260us  61.116us  cudaMemcpyAsync
  0.04%  273.99us         1  273.99us  273.99us  273.99us  cuDeviceTotalMem
  0.02%  112.80us         5  22.560us  7.4160us  28.558us  cudaLaunch
  0.01%  35.268us        16  2.2040us  1.4760us  5.2270us  cudaFuncGetAttributes
  0.00%  8.6140us        12     717ns     210ns  2.2780us  cudaGetDevice
  0.00%  7.2390us         8     904ns     134ns  4.7490us  cudaSetupArgument
  0.00%  5.9950us         2  2.9970us  2.4430us  3.5520us  cuDeviceGetCount
  0.00%  5.8860us         4  1.4710us     877ns  1.8450us  cudaEventCreateWithFlags
  0.00%  4.7590us         4  1.1890us     561ns  1.4690us  cudaEventDestroy
  0.00%  4.7460us         4  1.1860us     722ns  1.3700us  cudaEventRecord
  0.00%  4.6830us         5     936ns     183ns  1.3980us  cudaConfigureCall
  0.00%  3.7300us        11     339ns     212ns  1.3520us  cudaDeviceGetAttribute
  0.00%     957ns         2     478ns     433ns     524ns  cuDeviceGet
