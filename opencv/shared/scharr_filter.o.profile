==11073== NVPROF is profiling process 11073, command: ./scharr_filter.o
==11073== Profiling application: ./scharr_filter.o
==11073== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.49%  68.983us         9  7.6640us     576ns  21.863us  [CUDA memcpy HtoD]
 22.86%  38.956us         1  38.956us  38.956us  38.956us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 12.30%  20.966us         1  20.966us  20.966us  20.966us  [CUDA memcpy DtoH]
  9.11%  15.525us         2  7.7620us  7.5860us  7.9390us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  9.09%  15.493us         2  7.7460us  7.4900us  8.0030us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  3.76%  6.4020us         2  3.2010us  2.9130us  3.4890us  [CUDA memcpy DtoA]
  2.39%  4.0650us         2  2.0320us  1.8880us  2.1770us  [CUDA memcpy DtoD]

==11073== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.09%  688.85ms         4  172.21ms  3.4310us  688.84ms  cudaMallocPitch
  1.28%  8.9723ms        90  99.692us     102ns  5.3661ms  cuDeviceGetAttribute
  0.35%  2.4356ms         1  2.4356ms  2.4356ms  2.4356ms  cuDeviceGetName
  0.10%  717.42us         6  119.57us  3.8620us  693.23us  cudaMalloc
  0.06%  445.70us         1  445.70us  445.70us  445.70us  cuDeviceTotalMem
  0.06%  444.62us         2  222.31us  3.9730us  440.65us  cudaMallocArray
  0.04%  248.10us         6  41.349us  6.5040us  139.35us  cudaMemcpy2D
  0.01%  53.442us         2  26.721us  12.431us  41.011us  cudaMemcpy2DToArray
  0.00%  31.880us         5  6.3760us  4.4250us  10.160us  cudaLaunch
  0.00%  29.899us         4  7.4740us  3.4180us  18.865us  cudaMemcpy
  0.00%  13.870us         2  6.9350us  5.5490us  8.3210us  cudaMemcpyToSymbol
  0.00%  11.209us         4  2.8020us  1.8870us  4.7600us  cudaCreateTextureObject
  0.00%  7.0800us         4  1.7700us  1.4550us  2.7130us  cudaFuncGetAttributes
  0.00%  5.9010us        17     347ns     121ns  3.3250us  cudaSetupArgument
  0.00%  3.1170us        11     283ns     210ns     836ns  cudaDeviceGetAttribute
  0.00%  2.8210us         2  1.4100us  1.2380us  1.5830us  cudaMemcpyToArray
  0.00%  1.7810us         5     356ns     168ns     930ns  cudaConfigureCall
  0.00%  1.7000us         2     850ns     266ns  1.4340us  cuDeviceGetCount
  0.00%  1.4990us         1  1.4990us  1.4990us  1.4990us  cudaEventRecord
  0.00%  1.3580us         3     452ns     209ns     917ns  cudaGetDevice
  0.00%  1.3000us         1  1.3000us  1.3000us  1.3000us  cudaEventCreateWithFlags
  0.00%  1.1080us         1  1.1080us  1.1080us  1.1080us  cudaEventDestroy
  0.00%     401ns         2     200ns     124ns     277ns  cuDeviceGet
  0.00%     247ns         2     123ns     120ns     127ns  cudaCreateChannelDesc
