==3297== NVPROF is profiling process 3297, command: ./affine.o
==3297== Profiling application: ./affine.o
==3297== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.81%  84.644us        10  8.4640us  1.1520us  73.828us  [CUDA memcpy HtoD]
 33.24%  74.405us         1  74.405us  74.405us  74.405us  [CUDA memcpy DtoH]
 24.83%  55.588us         1  55.588us  55.588us  55.588us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.12%  9.2160us         3  3.0720us  1.0880us  4.4800us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3297== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.61%  501.76ms         6  83.627ms  8.7320us  501.23ms  cudaMalloc
  0.11%  565.88us         3  188.63us  12.596us  521.69us  cudaFree
  0.08%  425.29us        90  4.7250us     139ns  162.39us  cuDeviceGetAttribute
  0.06%  284.93us         4  71.232us  10.760us  240.53us  cudaMemcpy
  0.04%  225.03us         1  225.03us  225.03us  225.03us  cuDeviceTotalMem
  0.03%  176.03us         7  25.146us  3.7940us  151.10us  cudaMemcpyAsync
  0.02%  89.670us         4  22.417us  14.444us  33.067us  cudaLaunch
  0.01%  55.501us         1  55.501us  55.501us  55.501us  cudaDeviceSynchronize
  0.01%  54.402us        16  3.4000us  2.0970us  10.115us  cudaFuncGetAttributes
  0.01%  40.610us         1  40.610us  40.610us  40.610us  cuDeviceGetName
  0.00%  8.9760us        12     748ns     323ns  2.8160us  cudaGetDevice
  0.00%  8.1350us         4  2.0330us  1.5500us  2.5550us  cudaEventCreateWithFlags
  0.00%  7.1670us         4  1.7910us     308ns  5.8090us  cudaSetupArgument
  0.00%  6.9800us         4  1.7450us  1.1560us  2.2620us  cudaEventRecord
  0.00%  5.4260us        11     493ns     348ns  1.1880us  cudaDeviceGetAttribute
  0.00%  5.2090us         4  1.3020us     961ns  1.5400us  cudaEventDestroy
  0.00%  3.1680us         4     792ns     390ns  1.2720us  cudaConfigureCall
  0.00%  2.2500us         2  1.1250us     325ns  1.9250us  cuDeviceGetCount
  0.00%     617ns         2     308ns     231ns     386ns  cuDeviceGet
