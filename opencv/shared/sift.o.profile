==4764== NVPROF is profiling process 4764, command: ./sift.o
==4764== Profiling application: ./sift.o
==4764== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.59%  1.1258ms         1  1.1258ms  1.1258ms  1.1258ms  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, siftTransformFunctor)
 35.71%  686.19us        12  57.182us     576ns  565.96us  [CUDA memcpy HtoD]
  3.85%  73.957us         1  73.957us  73.957us  73.957us  [CUDA memcpy DtoH]
  1.38%  26.467us         4  6.6160us  1.4730us  17.857us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.48%  9.2480us         3  3.0820us  1.6320us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4764== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.54%  862.42ms        16  53.902ms  6.6390us  823.66ms  cudaMalloc
  2.74%  24.986ms         7  3.5694ms  8.9220us  10.602ms  cudaFree
  1.25%  11.435ms         1  11.435ms  11.435ms  11.435ms  cudaGetDeviceProperties
  0.74%  6.7616ms        90  75.128us     150ns  3.9753ms  cuDeviceGetAttribute
  0.24%  2.2276ms         1  2.2276ms  2.2276ms  2.2276ms  cuDeviceGetName
  0.15%  1.3991ms         3  466.36us  62.668us  1.1656ms  cudaMemcpyAsync
  0.13%  1.1706ms         1  1.1706ms  1.1706ms  1.1706ms  cudaDeviceSynchronize
  0.11%  969.56us        10  96.955us  6.0650us  710.49us  cudaMemcpy
  0.04%  344.92us         1  344.92us  344.92us  344.92us  cuDeviceTotalMem
  0.04%  340.19us         8  42.524us  8.4630us  132.08us  cudaLaunch
  0.01%  81.913us        28  2.9250us  1.4120us  6.9790us  cudaFuncGetAttributes
  0.00%  20.785us        21     989ns     206ns  3.2790us  cudaGetDevice
  0.00%  13.687us         7  1.9550us  1.0390us  2.6100us  cudaEventCreateWithFlags
  0.00%  11.003us         7  1.5710us     912ns  2.1620us  cudaEventRecord
  0.00%  10.833us        11     984ns     178ns  6.9520us  cudaSetupArgument
  0.00%  9.3590us         8  1.1690us     236ns  1.9370us  cudaConfigureCall
  0.00%  8.2370us         7  1.1760us     758ns  1.5130us  cudaEventDestroy
  0.00%  5.4910us        11     499ns     317ns  1.3580us  cudaDeviceGetAttribute
  0.00%  3.6690us         2  1.8340us  1.1390us  2.5300us  cuDeviceGetCount
  0.00%     911ns         2     455ns     281ns     630ns  cuDeviceGet
  0.00%     584ns         1     584ns     584ns     584ns  cudaGetLastError
