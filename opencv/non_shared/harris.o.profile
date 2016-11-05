==6158== NVPROF is profiling process 6158, command: ./harris.o
==6158== Profiling application: ./harris.o
==6158== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.13%  130.06us         1  130.06us  130.06us  130.06us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 28.60%  92.689us        23  4.0290us     544ns  72.693us  [CUDA memcpy HtoD]
 27.41%  88.818us        19  4.6740us     319ns  73.908us  [CUDA memcpy DtoH]
  3.86%  12.510us         4  3.1270us  1.4400us  3.7750us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6158== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.51%  718.22ms         8  89.777ms  8.1330us  714.71ms  cudaMalloc
  1.06%  7.7060ms        90  85.622us     105ns  6.9051ms  cuDeviceGetAttribute
  0.21%  1.5486ms         4  387.14us  14.778us  935.63us  cudaFree
  0.08%  578.39us        37  15.632us  3.4250us  96.406us  cudaMemcpyAsync
  0.07%  518.92us         5  103.78us  9.3220us  404.49us  cudaMemcpy
  0.03%  239.56us         1  239.56us  239.56us  239.56us  cuDeviceTotalMem
  0.02%  118.54us         5  23.708us  12.048us  38.207us  cudaLaunch
  0.01%  62.716us        20  3.1350us  2.1180us  5.7830us  cudaFuncGetAttributes
  0.01%  60.970us         1  60.970us  60.970us  60.970us  cuDeviceGetName
  0.00%  12.223us        15     814ns     377ns  2.7710us  cudaGetDevice
  0.00%  9.6890us         5  1.9370us  1.2050us  2.7740us  cudaEventCreateWithFlags
  0.00%  8.9730us         5  1.7940us     474ns  6.2070us  cudaSetupArgument
  0.00%  7.9410us         5  1.5880us  1.0060us  2.0340us  cudaEventRecord
  0.00%  6.0080us         5  1.2010us     812ns  1.4160us  cudaEventDestroy
  0.00%  5.1180us        11     465ns     244ns  1.4310us  cudaDeviceGetAttribute
  0.00%  4.1140us         5     822ns     335ns  1.2610us  cudaConfigureCall
  0.00%  3.8680us         2  1.9340us  1.7060us  2.1620us  cuDeviceGetCount
  0.00%     675ns         2     337ns     314ns     361ns  cuDeviceGet
