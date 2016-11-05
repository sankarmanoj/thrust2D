==6819== NVPROF is profiling process 6819, command: ./sift.o
==6819== Profiling application: ./sift.o
==6819== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.19%  1.1519ms         1  1.1519ms  1.1519ms  1.1519ms  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, siftTransformFunctor)
 36.06%  713.84us        12  59.486us     576ns  597.41us  [CUDA memcpy HtoD]
  3.83%  75.828us         1  75.828us  75.828us  75.828us  [CUDA memcpy DtoH]
  1.39%  27.484us         4  6.8710us  1.3760us  17.949us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.54%  10.654us         3  3.5510us  1.4080us  5.1190us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6819== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.23%  707.47ms        16  44.217ms  7.1000us  703.76ms  cudaMalloc
  1.96%  14.420ms         1  14.420ms  14.420ms  14.420ms  cudaGetDeviceProperties
  1.26%  9.2389ms         7  1.3198ms  13.544us  3.4299ms  cudaFree
  0.21%  1.5269ms         3  508.95us  81.416us  777.81us  cudaMemcpyAsync
  0.16%  1.1629ms         1  1.1629ms  1.1629ms  1.1629ms  cudaDeviceSynchronize
  0.06%  413.81us        10  41.380us  5.9090us  281.63us  cudaMemcpy
  0.05%  340.41us        90  3.7820us     118ns  133.71us  cuDeviceGetAttribute
  0.03%  205.86us         8  25.732us  7.7850us  46.003us  cudaLaunch
  0.03%  197.34us         1  197.34us  197.34us  197.34us  cuDeviceTotalMem
  0.01%  77.502us        28  2.7670us  1.9600us  11.335us  cudaFuncGetAttributes
  0.00%  34.152us         1  34.152us  34.152us  34.152us  cuDeviceGetName
  0.00%  15.613us        21     743ns     315ns  2.4700us  cudaGetDevice
  0.00%  11.360us         7  1.6220us     846ns  2.2850us  cudaEventCreateWithFlags
  0.00%  10.018us         7  1.4310us     783ns  1.9680us  cudaEventRecord
  0.00%  9.0280us        11     820ns     158ns  5.3470us  cudaSetupArgument
  0.00%  7.4270us         7  1.0610us     634ns  1.4540us  cudaEventDestroy
  0.00%  7.1770us         8     897ns     233ns  2.2480us  cudaConfigureCall
  0.00%  4.3760us        11     397ns     277ns  1.1230us  cudaDeviceGetAttribute
  0.00%  2.1870us         2  1.0930us     400ns  1.7870us  cuDeviceGetCount
  0.00%     517ns         2     258ns     188ns     329ns  cuDeviceGet
  0.00%     513ns         1     513ns     513ns     513ns  cudaGetLastError
