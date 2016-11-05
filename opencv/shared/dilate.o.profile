==6790== NVPROF is profiling process 6790, command: ./dilate.o
==6790== Profiling application: ./dilate.o
==6790== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.12%  177.86us         1  177.86us  177.86us  177.86us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, dilateFunctor)
 24.22%  85.971us         6  14.328us     608ns  80.531us  [CUDA memcpy HtoD]
 22.02%  78.132us         1  78.132us  78.132us  78.132us  [CUDA memcpy DtoH]
  2.53%  8.9900us         2  4.4950us  4.0950us  4.8950us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.11%  3.9350us         1  3.9350us  3.9350us  3.9350us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6790== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.52%  567.13ms         8  70.892ms  7.9070us  537.90ms  cudaMalloc
  2.66%  15.615ms         1  15.615ms  15.615ms  15.615ms  cudaGetDeviceProperties
  0.52%  3.0618ms         3  1.0206ms  34.586us  2.7955ms  cudaFree
  0.10%  559.70us         6  93.283us  6.7050us  429.00us  cudaMemcpy
  0.05%  315.56us        90  3.5060us     119ns  118.04us  cuDeviceGetAttribute
  0.04%  231.17us         9  25.685us     360ns  224.20us  cudaGetDevice
  0.04%  230.13us         1  230.13us  230.13us  230.13us  cudaMemcpyAsync
  0.03%  199.00us         1  199.00us  199.00us  199.00us  cuDeviceTotalMem
  0.03%  151.59us         4  37.896us  10.426us  59.152us  cudaLaunch
  0.01%  39.577us        12  3.2980us  1.9390us  7.4450us  cudaFuncGetAttributes
  0.01%  32.021us         1  32.021us  32.021us  32.021us  cuDeviceGetName
  0.00%  7.6570us         7  1.0930us     210ns  5.6240us  cudaSetupArgument
  0.00%  6.3610us         3  2.1200us  1.0480us  2.7230us  cudaEventCreateWithFlags
  0.00%  5.5200us         4  1.3800us     319ns  2.0850us  cudaConfigureCall
  0.00%  5.4260us         3  1.8080us     981ns  2.2880us  cudaEventRecord
  0.00%  5.2560us        11     477ns     237ns  1.8650us  cudaDeviceGetAttribute
  0.00%  3.6570us         3  1.2190us     866ns  1.3990us  cudaEventDestroy
  0.00%  2.2870us         2  1.1430us     414ns  1.8730us  cuDeviceGetCount
  0.00%     651ns         2     325ns     212ns     439ns  cuDeviceGet
  0.00%     439ns         1     439ns     439ns     439ns  cudaGetLastError
