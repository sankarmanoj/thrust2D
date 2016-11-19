==3776== NVPROF is profiling process 3776, command: ./pyrup.o
==3776== Profiling application: ./pyrup.o
==3776== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 61.29%  724.60us        19  38.137us     320ns  710.52us  [CUDA memcpy DtoH]
 27.24%  322.06us         1  322.06us  322.06us  322.06us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
  8.95%  105.80us        24  4.4080us     544ns  81.379us  [CUDA memcpy HtoD]
  2.26%  26.688us         3  8.8960us  1.5040us  20.896us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.26%  3.0720us         1  3.0720us  3.0720us  3.0720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3776== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.45%  1.21418s         9  134.91ms  5.3830us  1.21316s  cudaMalloc
  2.38%  30.546ms        90  339.40us     184ns  12.060ms  cuDeviceGetAttribute
  1.89%  24.324ms         2  12.162ms  268.68us  24.056ms  cudaGetDeviceProperties
  0.88%  11.272ms         4  2.8179ms  18.098us  7.8010ms  cudaFree
  0.12%  1.5967ms         1  1.5967ms  1.5967ms  1.5967ms  cuDeviceGetName
  0.12%  1.5198ms         1  1.5198ms  1.5198ms  1.5198ms  cuDeviceTotalMem
  0.11%  1.4702ms         6  245.03us  5.4670us  1.3799ms  cudaMemcpy
  0.03%  443.14us        37  11.976us  3.3440us  122.95us  cudaMemcpyAsync
  0.01%  96.668us         5  19.333us  8.0100us  32.127us  cudaLaunch
  0.00%  36.000us        16  2.2500us  1.4130us  6.2330us  cudaFuncGetAttributes
  0.00%  8.9370us        12     744ns     224ns  2.9110us  cudaGetDevice
  0.00%  6.5990us         4  1.6490us     787ns  2.5690us  cudaEventCreateWithFlags
  0.00%  5.0440us        11     458ns     299ns  1.2830us  cudaDeviceGetAttribute
  0.00%  4.7140us         4  1.1780us     685ns  1.8760us  cudaEventRecord
  0.00%  4.4080us         4  1.1020us     616ns  1.8360us  cudaEventDestroy
  0.00%  3.0010us         5     600ns     206ns  1.2370us  cudaConfigureCall
  0.00%  2.1450us         7     306ns     114ns     600ns  cudaSetupArgument
  0.00%  2.1320us         2  1.0660us     687ns  1.4450us  cuDeviceGetCount
  0.00%     603ns         2     301ns     254ns     349ns  cuDeviceGet
