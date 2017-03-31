==10142== NVPROF is profiling process 10142, command: ./erode.o
==10142== Profiling application: ./erode.o
==10142== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.16%  66.050us         1  66.050us  66.050us  66.050us  [CUDA memcpy DtoH]
 32.37%  51.938us         5  10.387us     544ns  49.442us  [CUDA memcpy HtoD]
 26.47%  42.465us         1  42.465us  42.465us  42.465us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10142== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.50%  384.45ms         4  96.113ms  5.5210us  384.43ms  cudaMallocPitch
  0.13%  500.20us         4  125.05us  6.1720us  480.67us  cudaMalloc
  0.11%  441.53us        90  4.9050us     137ns  167.20us  cuDeviceGetAttribute
  0.11%  421.64us         2  210.82us  151.18us  270.46us  cudaMemcpy2D
  0.06%  218.52us         4  54.630us  26.281us  65.208us  cudaMemcpy
  0.05%  189.79us         1  189.79us  189.79us  189.79us  cuDeviceTotalMem
  0.02%  60.474us         1  60.474us  60.474us  60.474us  cudaLaunch
  0.01%  45.671us         1  45.671us  45.671us  45.671us  cuDeviceGetName
  0.00%  15.493us         4  3.8730us  2.8780us  6.7560us  cudaFuncGetAttributes
  0.00%  7.7940us        11     708ns     378ns  2.7030us  cudaDeviceGetAttribute
  0.00%  5.3950us         3  1.7980us     442ns  4.3140us  cudaGetDevice
  0.00%  5.2430us         1  5.2430us  5.2430us  5.2430us  cudaSetupArgument
  0.00%  4.5490us         2  2.2740us     995ns  3.5540us  cuDeviceGetCount
  0.00%  3.4260us         1  3.4260us  3.4260us  3.4260us  cudaEventRecord
  0.00%  3.3870us         1  3.3870us  3.3870us  3.3870us  cudaEventCreateWithFlags
  0.00%  1.9900us         1  1.9900us  1.9900us  1.9900us  cudaConfigureCall
  0.00%  1.7450us         1  1.7450us  1.7450us  1.7450us  cudaEventDestroy
  0.00%     693ns         2     346ns     297ns     396ns  cuDeviceGet
