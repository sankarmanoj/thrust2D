==10773== NVPROF is profiling process 10773, command: ./sift.o
==10773== Profiling application: ./sift.o
==10773== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 66.85%  1.3450ms         1  1.3450ms  1.3450ms  1.3450ms  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, siftTransformFunctor)
 27.61%  555.53us        12  46.294us  1.2160us  438.41us  [CUDA memcpy HtoD]
  3.69%  74.146us         1  74.146us  74.146us  74.146us  [CUDA memcpy DtoH]
  1.32%  26.625us         4  6.6560us  1.3760us  17.889us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.52%  10.528us         3  3.5090us  1.4080us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10773== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.71%  643.30ms        16  40.206ms  4.9850us  641.50ms  cudaMalloc
  1.31%  8.6143ms        90  95.713us     118ns  7.4021ms  cuDeviceGetAttribute
  0.20%  1.3480ms         1  1.3480ms  1.3480ms  1.3480ms  cudaDeviceSynchronize
  0.19%  1.2311ms         1  1.2311ms  1.2311ms  1.2311ms  cuDeviceTotalMem
  0.15%  999.41us         1  999.41us  999.41us  999.41us  cuDeviceGetName
  0.15%  985.01us         1  985.01us  985.01us  985.01us  cudaGetDeviceProperties
  0.11%  697.67us         3  232.56us  41.779us  524.43us  cudaMemcpyAsync
  0.08%  523.82us        10  52.382us  4.9130us  395.85us  cudaMemcpy
  0.08%  504.90us         7  72.128us  7.3480us  153.63us  cudaFree
  0.02%  100.81us         8  12.600us  5.9610us  25.585us  cudaLaunch
  0.01%  46.397us        28  1.6570us  1.3950us  3.9870us  cudaFuncGetAttributes
  0.00%  7.9550us        21     378ns     218ns  1.3530us  cudaGetDevice
  0.00%  6.9780us         7     996ns     696ns  1.6730us  cudaEventCreateWithFlags
  0.00%  6.6360us         7     948ns     646ns  2.0190us  cudaEventRecord
  0.00%  5.9980us        11     545ns     117ns  3.9760us  cudaSetupArgument
  0.00%  5.3470us         7     763ns     596ns  1.2220us  cudaEventDestroy
  0.00%  4.0360us         8     504ns     218ns  1.5560us  cudaConfigureCall
  0.00%  3.0190us        11     274ns     203ns     767ns  cudaDeviceGetAttribute
  0.00%  1.5060us         2     753ns     385ns  1.1210us  cuDeviceGetCount
  0.00%     337ns         2     168ns     130ns     207ns  cuDeviceGet
  0.00%     326ns         1     326ns     326ns     326ns  cudaGetLastError
