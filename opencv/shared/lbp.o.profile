==29050== NVPROF is profiling process 29050, command: ./lbp.o
==29050== Profiling application: ./lbp.o
==29050== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 49.49%  199.65us         1  199.65us  199.65us  199.65us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, lbpFunctor)
 23.73%  95.744us         6  15.957us  1.2160us  89.632us  [CUDA memcpy HtoD]
 23.53%  94.944us         1  94.944us  94.944us  94.944us  [CUDA memcpy DtoH]
  2.25%  9.0570us         2  4.5280us  4.0970us  4.9600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.00%  4.0320us         1  4.0320us  4.0320us  4.0320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29050== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.44%  405.72ms         8  50.715ms  7.2720us  403.88ms  cudaMalloc
  2.07%  8.6199ms         1  8.6199ms  8.6199ms  8.6199ms  cudaGetDeviceProperties
  0.16%  647.79us         6  107.97us  7.2790us  492.61us  cudaMemcpy
  0.08%  346.81us         3  115.60us  57.534us  188.52us  cudaFree
  0.07%  307.06us        90  3.4110us     127ns  116.05us  cuDeviceGetAttribute
  0.06%  249.31us         1  249.31us  249.31us  249.31us  cudaMemcpyAsync
  0.05%  204.54us         1  204.54us  204.54us  204.54us  cuDeviceTotalMem
  0.04%  148.85us         4  37.212us  11.091us  49.499us  cudaLaunch
  0.01%  44.468us        12  3.7050us  1.9200us  17.076us  cudaFuncGetAttributes
  0.01%  30.096us         1  30.096us  30.096us  30.096us  cuDeviceGetName
  0.00%  10.458us         7  1.4940us     151ns  8.2740us  cudaSetupArgument
  0.00%  9.1380us         9  1.0150us     283ns  4.3990us  cudaGetDevice
  0.00%  7.1550us         3  2.3850us  1.0070us  3.4100us  cudaEventCreateWithFlags
  0.00%  5.6070us         4  1.4010us     425ns  2.2610us  cudaConfigureCall
  0.00%  5.3250us        11     484ns     261ns  1.8180us  cudaDeviceGetAttribute
  0.00%  4.8870us         3  1.6290us     868ns  2.1890us  cudaEventRecord
  0.00%  3.7340us         3  1.2440us     850ns  1.5480us  cudaEventDestroy
  0.00%  1.8090us         2     904ns     373ns  1.4360us  cuDeviceGetCount
  0.00%     750ns         1     750ns     750ns     750ns  cudaGetLastError
  0.00%     595ns         2     297ns     222ns     373ns  cuDeviceGet
