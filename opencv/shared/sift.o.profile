==12940== NVPROF is profiling process 12940, command: ./sift.o
==12940== Profiling application: ./sift.o
==12940== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 49.92%  762.69us        12  63.557us     608ns  611.15us  [CUDA memcpy HtoD]
 40.05%  611.82us         1  611.82us  611.82us  611.82us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
  7.22%  110.30us         1  110.30us  110.30us  110.30us  [CUDA memcpy DtoH]
  2.05%  31.358us         4  7.8390us  1.5030us  19.775us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.76%  11.615us         3  3.8710us  1.6960us  5.7910us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12940== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.38%  618.00ms        16  38.625ms  6.4850us  606.94ms  cudaMalloc
  1.74%  11.281ms        90  125.35us     101ns  6.2950ms  cuDeviceGetAttribute
  1.21%  7.8355ms         1  7.8355ms  7.8355ms  7.8355ms  cudaGetDeviceProperties
  0.67%  4.3249ms         1  4.3249ms  4.3249ms  4.3249ms  cuDeviceGetName
  0.42%  2.7198ms         7  388.54us  14.776us  1.4965ms  cudaFree
  0.15%  1.0011ms         3  333.71us  83.843us  728.16us  cudaMemcpyAsync
  0.15%  986.43us         1  986.43us  986.43us  986.43us  cudaDeviceSynchronize
  0.11%  693.05us         1  693.05us  693.05us  693.05us  cuDeviceTotalMem
  0.10%  677.63us        10  67.762us  6.4850us  429.25us  cudaMemcpy
  0.04%  235.70us         8  29.463us  9.3440us  45.100us  cudaLaunch
  0.01%  84.348us        28  3.0120us  1.4630us  11.051us  cudaFuncGetAttributes
  0.00%  22.913us        21  1.0910us     209ns  8.3310us  cudaGetDevice
  0.00%  14.524us         7  2.0740us  1.0060us  2.9150us  cudaEventCreateWithFlags
  0.00%  11.236us         7  1.6050us     773ns  2.6090us  cudaEventRecord
  0.00%  10.080us        11     916ns     117ns  6.2710us  cudaSetupArgument
  0.00%  7.8650us         7  1.1230us     640ns  1.6760us  cudaEventDestroy
  0.00%  7.5790us         8     947ns     317ns  1.4140us  cudaConfigureCall
  0.00%  5.2900us        11     480ns     375ns  1.0700us  cudaDeviceGetAttribute
  0.00%  2.3580us         2  1.1790us     635ns  1.7230us  cuDeviceGetCount
  0.00%     455ns         2     227ns     186ns     269ns  cuDeviceGet
