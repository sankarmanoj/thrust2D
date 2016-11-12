==30028== NVPROF is profiling process 30028, command: ./affine.o
==30028== Profiling application: ./affine.o
==30028== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.22%  83.873us        10  8.3870us     576ns  73.697us  [CUDA memcpy HtoD]
 33.04%  74.465us         1  74.465us  74.465us  74.465us  [CUDA memcpy DtoH]
 24.42%  55.041us         1  55.041us  55.041us  55.041us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.31%  11.968us         3  3.9890us  1.0880us  5.6960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30028== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.35%  692.17ms         6  115.36ms  9.5700us  688.00ms  cudaMalloc
  0.41%  2.8390ms        90  31.544us     126ns  1.4153ms  cuDeviceGetAttribute
  0.05%  381.27us         3  127.09us  10.585us  338.63us  cudaFree
  0.05%  322.41us         4  80.603us  10.663us  258.69us  cudaMemcpy
  0.05%  319.17us         1  319.17us  319.17us  319.17us  cuDeviceTotalMem
  0.04%  258.89us         1  258.89us  258.89us  258.89us  cuDeviceGetName
  0.02%  166.94us         7  23.849us  3.6540us  142.10us  cudaMemcpyAsync
  0.02%  108.82us         4  27.205us  12.403us  37.627us  cudaLaunch
  0.01%  54.557us         1  54.557us  54.557us  54.557us  cudaDeviceSynchronize
  0.01%  47.730us        16  2.9830us  1.8300us  6.2470us  cudaFuncGetAttributes
  0.00%  10.666us        12     888ns     356ns  3.6030us  cudaGetDevice
  0.00%  8.5920us         4  2.1480us  1.2970us  2.6550us  cudaEventCreateWithFlags
  0.00%  8.5390us         4  2.1340us     641ns  6.3140us  cudaSetupArgument
  0.00%  7.1640us         4  1.7910us  1.0370us  2.1920us  cudaEventRecord
  0.00%  5.9550us        11     541ns     367ns  1.7070us  cudaDeviceGetAttribute
  0.00%  5.5410us         4  1.3850us     857ns  1.8190us  cudaEventDestroy
  0.00%  3.8670us         4     966ns     374ns  1.5500us  cudaConfigureCall
  0.00%  2.3470us         2  1.1730us     705ns  1.6420us  cuDeviceGetCount
  0.00%     596ns         2     298ns     297ns     299ns  cuDeviceGet
