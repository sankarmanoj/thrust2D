==17806== NVPROF is profiling process 17806, command: ./affine.o
==17806== Profiling application: ./affine.o
==17806== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.59%  77.279us         5  15.455us  1.1840us  72.415us  [CUDA memcpy HtoD]
 32.13%  73.920us         1  73.920us  73.920us  73.920us  [CUDA memcpy DtoH]
 26.02%  59.872us         1  59.872us  59.872us  59.872us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.26%  19.008us         2  9.5040us  8.9280us  10.080us  [CUDA memset]

==17806== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.06%  145.49ms         6  24.249ms  3.7190us  145.12ms  cudaMalloc
  0.34%  505.71us        90  5.6190us     260ns  196.21us  cuDeviceGetAttribute
  0.30%  443.25us         1  443.25us  443.25us  443.25us  cuDeviceTotalMem
  0.18%  266.22us         6  44.369us  8.2310us  176.48us  cudaMemcpy
  0.04%  57.806us         1  57.806us  57.806us  57.806us  cudaDeviceSynchronize
  0.03%  44.816us         1  44.816us  44.816us  44.816us  cuDeviceGetName
  0.02%  24.395us         2  12.197us  7.6730us  16.722us  cudaMemset
  0.01%  12.757us         1  12.757us  12.757us  12.757us  cudaLaunch
  0.00%  6.3590us         4  1.5890us  1.3450us  2.3190us  cudaFuncGetAttributes
  0.00%  2.8830us        11     262ns     195ns     694ns  cudaDeviceGetAttribute
  0.00%  2.2930us         2  1.1460us     432ns  1.8610us  cuDeviceGetCount
  0.00%  1.8530us         1  1.8530us  1.8530us  1.8530us  cudaSetupArgument
  0.00%  1.3760us         1  1.3760us  1.3760us  1.3760us  cudaEventCreateWithFlags
  0.00%  1.2410us         3     413ns     207ns     801ns  cudaGetDevice
  0.00%  1.0950us         1  1.0950us  1.0950us  1.0950us  cudaEventRecord
  0.00%  1.0680us         1  1.0680us  1.0680us  1.0680us  cudaEventDestroy
  0.00%     821ns         2     410ns     282ns     539ns  cuDeviceGet
  0.00%     622ns         1     622ns     622ns     622ns  cudaConfigureCall
