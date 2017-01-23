==8024== NVPROF is profiling process 8024, command: ./erode.o
==8024== Profiling application: ./erode.o
==8024== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.49%  57.951us         1  57.951us  57.951us  57.951us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 23.80%  24.416us         5  4.8830us     576ns  20.544us  [CUDA memcpy HtoD]
 19.71%  20.224us         1  20.224us  20.224us  20.224us  [CUDA memcpy DtoH]

==8024== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.20%  558.65ms         4  139.66ms  3.8770us  558.64ms  cudaMallocPitch
  1.04%  5.9167ms        90  65.741us     123ns  3.8601ms  cuDeviceGetAttribute
  0.53%  3.0344ms         4  758.59us  3.7540us  3.0184ms  cudaMalloc
  0.11%  616.79us         1  616.79us  616.79us  616.79us  cuDeviceGetName
  0.07%  382.84us         1  382.84us  382.84us  382.84us  cuDeviceTotalMem
  0.03%  196.49us         2  98.242us  19.708us  176.78us  cudaMemcpy2D
  0.01%  59.613us         4  14.903us  3.3540us  26.557us  cudaMemcpy
  0.00%  22.600us         1  22.600us  22.600us  22.600us  cudaLaunch
  0.00%  12.744us         4  3.1860us  1.4150us  8.4110us  cudaFuncGetAttributes
  0.00%  4.3880us         1  4.3880us  4.3880us  4.3880us  cudaSetupArgument
  0.00%  3.3910us         2  1.6950us  1.5250us  1.8660us  cuDeviceGetCount
  0.00%  2.9980us        11     272ns     207ns     705ns  cudaDeviceGetAttribute
  0.00%  1.8390us         1  1.8390us  1.8390us  1.8390us  cudaEventCreateWithFlags
  0.00%  1.5840us         3     528ns     219ns  1.1090us  cudaGetDevice
  0.00%  1.2910us         1  1.2910us  1.2910us  1.2910us  cudaEventRecord
  0.00%  1.0560us         1  1.0560us  1.0560us  1.0560us  cudaConfigureCall
  0.00%  1.0250us         1  1.0250us  1.0250us  1.0250us  cudaEventDestroy
  0.00%     920ns         2     460ns     373ns     547ns  cuDeviceGet
