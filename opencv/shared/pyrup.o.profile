==6638== NVPROF is profiling process 6638, command: ./pyrup.o
==6638== Profiling application: ./pyrup.o
==6638== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 61.04%  728.85us        19  38.360us     320ns  714.17us  [CUDA memcpy DtoH]
 27.41%  327.31us         1  327.31us  327.31us  327.31us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
  9.07%  108.26us        24  4.5100us     576ns  81.090us  [CUDA memcpy HtoD]
  2.12%  25.345us         3  8.4480us  1.6000us  19.745us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.36%  4.3200us         1  4.3200us  4.3200us  4.3200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6638== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.07%  199.41ms         9  22.156ms  5.5360us  198.50ms  cudaMalloc
  0.82%  1.6578ms         6  276.29us  5.2630us  1.5828ms  cudaMemcpy
  0.30%  613.59us         2  306.79us  222.07us  391.51us  cudaGetDeviceProperties
  0.22%  454.09us         1  454.09us  454.09us  454.09us  cuDeviceTotalMem
  0.22%  444.81us        90  4.9420us     253ns  171.32us  cuDeviceGetAttribute
  0.17%  347.48us        37  9.3910us  2.1690us  82.191us  cudaMemcpyAsync
  0.11%  227.69us         4  56.923us  6.3850us  138.35us  cudaFree
  0.04%  81.566us         5  16.313us  8.2500us  33.911us  cudaLaunch
  0.02%  41.813us         1  41.813us  41.813us  41.813us  cuDeviceGetName
  0.02%  32.216us        16  2.0130us  1.4050us  4.5390us  cudaFuncGetAttributes
  0.00%  6.5440us        12     545ns     213ns  1.4770us  cudaGetDevice
  0.00%  5.7600us         4  1.4400us     896ns  2.5080us  cudaEventCreateWithFlags
  0.00%  4.8080us         4  1.2020us     713ns  2.0950us  cudaEventRecord
  0.00%  3.6650us         4     916ns     641ns  1.3810us  cudaEventDestroy
  0.00%  3.0540us        11     277ns     208ns     754ns  cudaDeviceGetAttribute
  0.00%  2.8950us         5     579ns     283ns     991ns  cudaConfigureCall
  0.00%  2.6910us         2  1.3450us     429ns  2.2620us  cuDeviceGetCount
  0.00%  2.2150us         7     316ns     117ns     831ns  cudaSetupArgument
  0.00%     713ns         2     356ns     272ns     441ns  cuDeviceGet
