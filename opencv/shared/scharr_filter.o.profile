==4028== NVPROF is profiling process 4028, command: ./scharr_filter.o
==4028== Profiling application: ./scharr_filter.o
==4028== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.49%  71.073us         9  7.8970us  1.2160us  21.697us  [CUDA memcpy HtoD]
 18.74%  35.520us         1  35.520us  35.520us  35.520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 17.76%  33.664us         4  8.4160us  7.8720us  9.8880us  [CUDA memcpy DtoA]
 10.33%  19.585us         1  19.585us  19.585us  19.585us  [CUDA memcpy DtoH]
  8.10%  15.360us         2  7.6800us  7.4560us  7.9040us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.58%  14.368us         2  7.1840us  7.0400us  7.3280us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)

==4028== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.72%  146.73ms         4  36.682ms  3.4390us  146.72ms  cudaMallocPitch
  0.46%  680.31us         6  113.38us  3.7110us  335.19us  cudaMalloc
  0.23%  338.49us         2  169.25us  4.2880us  334.21us  cudaMallocArray
  0.20%  298.46us        90  3.3160us     100ns  118.67us  cuDeviceGetAttribute
  0.13%  197.56us         4  49.389us  17.709us  99.922us  cudaMemcpy2D
  0.13%  195.26us         1  195.26us  195.26us  195.26us  cuDeviceTotalMem
  0.04%  58.048us         4  14.512us  6.8600us  32.310us  cudaMemcpy2DToArray
  0.02%  28.090us         5  5.6180us  4.3360us  8.6760us  cudaLaunch
  0.02%  26.760us         1  26.760us  26.760us  26.760us  cuDeviceGetName
  0.01%  19.512us         4  4.8780us  2.9540us  9.6070us  cudaMemcpy
  0.01%  18.885us         2  9.4420us  7.8660us  11.019us  cudaMemcpyToSymbol
  0.01%  11.729us         4  2.9320us  2.0200us  4.8340us  cudaCreateTextureObject
  0.00%  6.4390us         4  1.6090us  1.3510us  2.3100us  cudaFuncGetAttributes
  0.00%  5.6180us        17     330ns     112ns  3.3170us  cudaSetupArgument
  0.00%  2.7600us        11     250ns     195ns     606ns  cudaDeviceGetAttribute
  0.00%  1.5010us         5     300ns     127ns     722ns  cudaConfigureCall
  0.00%  1.3850us         3     461ns     193ns     973ns  cudaGetDevice
  0.00%  1.3420us         2     671ns     242ns  1.1000us  cuDeviceGetCount
  0.00%  1.2030us         1  1.2030us  1.2030us  1.2030us  cudaEventCreateWithFlags
  0.00%  1.0840us         1  1.0840us  1.0840us  1.0840us  cudaEventRecord
  0.00%  1.0220us         1  1.0220us  1.0220us  1.0220us  cudaEventDestroy
  0.00%     334ns         2     167ns     135ns     199ns  cuDeviceGet
  0.00%     323ns         2     161ns     130ns     193ns  cudaCreateChannelDesc
