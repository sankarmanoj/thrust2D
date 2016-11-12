==29179== NVPROF is profiling process 29179, command: ./sift.o
==29179== Profiling application: ./sift.o
==29179== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.06%  1.1841ms         1  1.1841ms  1.1841ms  1.1841ms  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, siftTransformFunctor)
 45.78%  1.1278ms        12  93.986us     640ns  968.13us  [CUDA memcpy HtoD]
  4.62%  113.76us         1  113.76us  113.76us  113.76us  [CUDA memcpy DtoH]
  1.12%  27.520us         4  6.8800us  1.4400us  18.720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.43%  10.528us         3  3.5090us  1.7600us  5.1840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29179== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.88%  908.84ms        16  56.802ms  7.5470us  904.74ms  cudaMalloc
  1.47%  13.626ms        90  151.40us     117ns  8.0665ms  cuDeviceGetAttribute
  0.17%  1.5864ms         3  528.81us  114.19us  1.1570ms  cudaMemcpyAsync
  0.13%  1.1879ms         1  1.1879ms  1.1879ms  1.1879ms  cudaDeviceSynchronize
  0.10%  957.65us        10  95.764us  21.097us  672.67us  cudaMemcpy
  0.06%  521.62us         7  74.516us  6.4270us  202.68us  cudaFree
  0.05%  492.51us         1  492.51us  492.51us  492.51us  cuDeviceGetName
  0.05%  479.67us         1  479.67us  479.67us  479.67us  cuDeviceTotalMem
  0.04%  404.81us         1  404.81us  404.81us  404.81us  cudaGetDeviceProperties
  0.03%  260.28us         8  32.534us  9.8850us  59.003us  cudaLaunch
  0.01%  89.562us        28  3.1980us  2.0120us  7.6710us  cudaFuncGetAttributes
  0.00%  18.472us        21     879ns     336ns  3.0830us  cudaGetDevice
  0.00%  15.311us         7  2.1870us  1.1030us  3.3490us  cudaEventCreateWithFlags
  0.00%  13.738us         7  1.9620us     992ns  3.1130us  cudaEventRecord
  0.00%  13.106us        11  1.1910us     150ns  8.4420us  cudaSetupArgument
  0.00%  11.061us         8  1.3820us     318ns  3.6350us  cudaConfigureCall
  0.00%  9.1740us         7  1.3100us     779ns  1.8680us  cudaEventDestroy
  0.00%  5.5780us        11     507ns     310ns  1.2770us  cudaDeviceGetAttribute
  0.00%  3.0790us         2  1.5390us     949ns  2.1300us  cuDeviceGetCount
  0.00%     726ns         1     726ns     726ns     726ns  cudaGetLastError
  0.00%     666ns         2     333ns     216ns     450ns  cuDeviceGet
