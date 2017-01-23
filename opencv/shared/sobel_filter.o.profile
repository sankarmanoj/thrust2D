==11039== NVPROF is profiling process 11039, command: ./sobel_filter.o
==11039== Profiling application: ./sobel_filter.o
==11039== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.65%  73.430us         9  8.1580us  1.0250us  22.759us  [CUDA memcpy HtoD]
 22.35%  39.404us         1  39.404us  39.404us  39.404us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 12.31%  21.702us         1  21.702us  21.702us  21.702us  [CUDA memcpy DtoH]
  8.92%  15.718us         2  7.8590us  7.6190us  8.0990us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  8.84%  15.588us         2  7.7940us  7.5860us  8.0020us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  3.63%  6.4020us         2  3.2010us  2.9130us  3.4890us  [CUDA memcpy DtoA]
  2.31%  4.0650us         2  2.0320us  1.8880us  2.1770us  [CUDA memcpy DtoD]

==11039== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.39%  698.77ms         4  174.69ms  3.5930us  698.76ms  cudaMallocPitch
  1.72%  12.376ms        90  137.52us     106ns  6.1011ms  cuDeviceGetAttribute
  0.30%  2.1633ms         2  1.0817ms  7.6760us  2.1557ms  cudaMallocArray
  0.23%  1.6718ms         6  278.64us  3.8460us  1.6374ms  cudaMalloc
  0.12%  882.02us         1  882.02us  882.02us  882.02us  cuDeviceTotalMem
  0.11%  762.03us         6  127.00us  6.5770us  535.30us  cudaMemcpy2D
  0.09%  668.90us         1  668.90us  668.90us  668.90us  cuDeviceGetName
  0.01%  55.806us         2  27.903us  13.059us  42.747us  cudaMemcpy2DToArray
  0.00%  31.561us         5  6.3120us  4.1820us  10.427us  cudaLaunch
  0.00%  31.191us         4  7.7970us  3.2950us  20.281us  cudaMemcpy
  0.00%  28.173us         2  14.086us  6.7070us  21.466us  cudaMemcpyToSymbol
  0.00%  16.784us         4  4.1960us  1.8500us  10.020us  cudaCreateTextureObject
  0.00%  7.3660us         4  1.8410us  1.4310us  3.0210us  cudaFuncGetAttributes
  0.00%  6.5750us        17     386ns     118ns  4.0020us  cudaSetupArgument
  0.00%  2.8950us        11     263ns     205ns     597ns  cudaDeviceGetAttribute
  0.00%  2.7720us         2  1.3860us  1.1500us  1.6220us  cudaMemcpyToArray
  0.00%  1.8320us         2     916ns     154ns  1.6780us  cuDeviceGetCount
  0.00%  1.7010us         3     567ns     202ns  1.2330us  cudaGetDevice
  0.00%  1.5520us         1  1.5520us  1.5520us  1.5520us  cudaEventRecord
  0.00%  1.3980us         5     279ns     133ns     652ns  cudaConfigureCall
  0.00%  1.3380us         1  1.3380us  1.3380us  1.3380us  cudaEventDestroy
  0.00%  1.2440us         1  1.2440us  1.2440us  1.2440us  cudaEventCreateWithFlags
  0.00%     436ns         2     218ns     206ns     230ns  cudaCreateChannelDesc
  0.00%     373ns         2     186ns     110ns     263ns  cuDeviceGet
