==8667== NVPROF is profiling process 8667, command: ./blend.o
==8667== Profiling application: ./blend.o
==8667== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.18%  163.20us         5  32.639us  1.2160us  80.446us  [CUDA memcpy HtoD]
 26.59%  78.623us         1  78.623us  78.623us  78.623us  [CUDA memcpy DtoH]
 14.21%  42.015us         1  42.015us  42.015us  42.015us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.03%  11.904us         3  3.9680us  3.1360us  4.9280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8667== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.53%  372.74ms         6  62.123ms  6.3530us  371.81ms  cudaMalloc
  0.11%  412.73us        90  4.5850us     147ns  161.70us  cuDeviceGetAttribute
  0.08%  299.63us         4  74.907us  6.5140us  261.03us  cudaMemcpy
  0.08%  289.14us         3  96.380us  17.156us  182.86us  cudaFree
  0.07%  265.62us         2  132.81us  129.64us  135.99us  cudaMemcpyAsync
  0.06%  216.40us         1  216.40us  216.40us  216.40us  cuDeviceTotalMem
  0.03%  94.251us         1  94.251us  94.251us  94.251us  cuDeviceGetName
  0.02%  85.898us         4  21.474us  12.535us  33.530us  cudaLaunch
  0.01%  39.584us        16  2.4740us  1.4520us  5.0300us  cudaFuncGetAttributes
  0.00%  8.1830us        12     681ns     212ns  1.9160us  cudaGetDevice
  0.00%  6.5530us         4  1.6380us  1.0740us  2.1890us  cudaEventCreateWithFlags
  0.00%  5.8870us         4  1.4710us     229ns  4.2350us  cudaSetupArgument
  0.00%  5.1480us        11     468ns     325ns  1.1420us  cudaDeviceGetAttribute
  0.00%  4.9450us         4  1.2360us     947ns  1.5810us  cudaEventRecord
  0.00%  3.8870us         4     971ns     821ns  1.1270us  cudaEventDestroy
  0.00%  3.0400us         4     760ns     534ns  1.2450us  cudaConfigureCall
  0.00%  1.9940us         2     997ns     613ns  1.3810us  cuDeviceGetCount
  0.00%     587ns         2     293ns     270ns     317ns  cuDeviceGet
