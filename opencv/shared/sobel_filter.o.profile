==8616== NVPROF is profiling process 8616, command: ./sobel_filter.o
==8616== Profiling application: ./sobel_filter.o
==8616== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 19.06%  35.648us         1  35.648us  35.648us  35.648us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 18.07%  33.792us         2  16.896us  16.512us  17.280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 17.20%  32.160us         4  8.0400us  7.8720us  8.3520us  [CUDA memcpy DtoA]
 14.15%  26.464us         7  3.7800us  1.2160us  19.168us  [CUDA memcpy HtoD]
 10.08%  18.848us         1  18.848us  18.848us  18.848us  [CUDA memcpy DtoH]
  8.30%  15.520us         2  7.7600us  7.6160us  7.9040us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.65%  14.304us         2  7.1520us  7.0080us  7.2960us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  5.49%  10.272us         4  2.5680us  2.1120us  3.8720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8616== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.06%  203.61ms        10  20.361ms  4.3210us  203.21ms  cudaMalloc
  0.30%  614.42us         1  614.42us  614.42us  614.42us  cuDeviceTotalMem
  0.24%  497.76us        90  5.5300us     341ns  188.34us  cuDeviceGetAttribute
  0.17%  356.10us         2  178.05us  4.0180us  352.08us  cudaMallocArray
  0.05%  110.42us         5  22.083us  4.5820us  85.502us  cudaMemcpy
  0.04%  79.289us        11  7.2080us  4.3560us  18.914us  cudaLaunch
  0.03%  59.964us         4  14.991us  7.0580us  33.687us  cudaMemcpyToArray
  0.02%  47.404us        28  1.6930us  1.4020us  6.9710us  cudaFuncGetAttributes
  0.02%  45.236us         1  45.236us  45.236us  45.236us  cuDeviceGetName
  0.01%  29.519us         4  7.3790us  4.3370us  15.232us  cudaFree
  0.01%  17.999us         2  8.9990us  7.1360us  10.863us  cudaMemcpyToSymbol
  0.01%  15.100us         1  15.100us  15.100us  15.100us  cudaMemcpyAsync
  0.01%  11.201us         4  2.8000us  1.9970us  4.3380us  cudaCreateTextureObject
  0.00%  7.1830us        23     312ns     114ns  3.4600us  cudaSetupArgument
  0.00%  6.8010us        21     323ns     208ns  1.4860us  cudaGetDevice
  0.00%  5.7530us         7     821ns     539ns  1.4860us  cudaEventCreateWithFlags
  0.00%  5.0250us         7     717ns     462ns  1.4410us  cudaEventRecord
  0.00%  4.0030us         2  2.0010us     565ns  3.4380us  cuDeviceGetCount
  0.00%  3.9630us         7     566ns     408ns     895ns  cudaEventDestroy
  0.00%  2.8990us        11     263ns     174ns     814ns  cudaConfigureCall
  0.00%  2.8730us        11     261ns     202ns     668ns  cudaDeviceGetAttribute
  0.00%  1.2950us         2     647ns     387ns     908ns  cuDeviceGet
  0.00%     301ns         2     150ns     116ns     185ns  cudaCreateChannelDesc
