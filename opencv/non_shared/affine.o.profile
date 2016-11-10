==8312== NVPROF is profiling process 8312, command: ./affine.o
==8312== Profiling application: ./affine.o
==8312== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.50%  116.46us         1  116.46us  116.46us  116.46us  [CUDA memcpy DtoH]
 30.65%  80.215us        10  8.0210us     543ns  74.844us  [CUDA memcpy HtoD]
 21.50%  56.261us         1  56.261us  56.261us  56.261us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.36%  8.7960us         3  2.9320us  1.3120us  3.7740us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8312== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.04%  720.18ms         6  120.03ms  6.7070us  715.99ms  cudaMalloc
  1.68%  12.432ms        90  138.14us     134ns  8.3747ms  cuDeviceGetAttribute
  0.70%  5.1890ms         1  5.1890ms  5.1890ms  5.1890ms  cuDeviceGetName
  0.34%  2.4922ms         3  830.74us  43.796us  2.3668ms  cudaFree
  0.14%  1.0020ms         4  250.49us  7.3710us  910.96us  cudaMemcpy
  0.07%  493.18us         1  493.18us  493.18us  493.18us  cuDeviceTotalMem
  0.02%  118.09us         4  29.521us  11.043us  41.599us  cudaLaunch
  0.01%  96.040us         7  13.720us  1.8800us  80.683us  cudaMemcpyAsync
  0.01%  63.329us         1  63.329us  63.329us  63.329us  cudaDeviceSynchronize
  0.01%  41.395us        16  2.5870us  1.3620us  5.9840us  cudaFuncGetAttributes
  0.00%  8.4660us        12     705ns     211ns  2.3600us  cudaGetDevice
  0.00%  8.1740us         4  2.0430us  1.0400us  2.6330us  cudaEventCreateWithFlags
  0.00%  7.1050us         4  1.7760us     798ns  2.2690us  cudaEventRecord
  0.00%  5.2670us         4  1.3160us     700ns  1.8420us  cudaEventDestroy
  0.00%  3.8160us         4     954ns     268ns  2.1350us  cudaSetupArgument
  0.00%  3.7210us         2  1.8600us     524ns  3.1970us  cuDeviceGetCount
  0.00%  3.6470us        11     331ns     208ns  1.1190us  cudaDeviceGetAttribute
  0.00%  3.4060us         4     851ns     267ns  1.1350us  cudaConfigureCall
  0.00%  1.4830us         2     741ns     274ns  1.2090us  cuDeviceGet
