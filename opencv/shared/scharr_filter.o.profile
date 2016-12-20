==9951== NVPROF is profiling process 9951, command: ./scharr_filter.o 1631
==9951== Profiling application: ./scharr_filter.o 1631
==9951== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 21.38%  9.4090ms         7  1.3441ms     640ns  9.4049ms  [CUDA memcpy HtoD]
 20.75%  9.1304ms         1  9.1304ms  9.1304ms  9.1304ms  [CUDA memcpy DtoH]
 15.61%  6.8720ms         4  1.7180ms  1.7049ms  1.7241ms  [CUDA memcpy DtoA]
 12.52%  5.5102ms         2  2.7551ms  2.7359ms  2.7743ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 10.66%  4.6903ms         2  2.3452ms  2.3403ms  2.3500ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.29%  3.2093ms         2  1.6046ms  1.5957ms  1.6136ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.50%  2.8599ms         1  2.8599ms  2.8599ms  2.8599ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.29%  2.3290ms         4  582.26us  579.17us  587.49us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9951== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 86.31%  382.91ms        10  38.291ms  9.1860us  380.66ms  cudaMalloc
  5.08%  22.519ms         5  4.5037ms  194.11us  20.594ms  cudaMemcpy
  3.15%  13.960ms        90  155.12us     101ns  5.9605ms  cuDeviceGetAttribute
  2.27%  10.059ms         2  5.0296ms  2.3361ms  7.7231ms  cudaMemcpyToSymbol
  2.19%  9.7006ms         1  9.7006ms  9.7006ms  9.7006ms  cudaMemcpyAsync
  0.34%  1.5101ms         1  1.5101ms  1.5101ms  1.5101ms  cuDeviceTotalMem
  0.27%  1.1880ms         1  1.1880ms  1.1880ms  1.1880ms  cuDeviceGetName
  0.21%  923.41us         2  461.70us  440.71us  482.70us  cudaMallocArray
  0.07%  321.06us         4  80.265us  56.821us  145.35us  cudaFree
  0.05%  222.24us        11  20.203us  8.6130us  77.549us  cudaLaunch
  0.03%  132.35us         4  33.088us  13.910us  57.832us  cudaMemcpyToArray
  0.02%  96.978us        28  3.4630us  2.1270us  13.978us  cudaFuncGetAttributes
  0.01%  26.158us         4  6.5390us  4.1180us  9.7390us  cudaCreateTextureObject
  0.00%  19.385us        21     923ns     337ns  5.7350us  cudaGetDevice
  0.00%  14.239us         7  2.0340us  1.0450us  3.7250us  cudaEventCreateWithFlags
  0.00%  13.441us         7  1.9200us     966ns  4.1960us  cudaEventRecord
  0.00%  11.246us        23     488ns     172ns  3.4400us  cudaSetupArgument
  0.00%  9.1760us         7  1.3100us     736ns  1.8210us  cudaEventDestroy
  0.00%  6.5350us        11     594ns     320ns  1.2050us  cudaConfigureCall
  0.00%  6.3380us        11     576ns     411ns  1.3200us  cudaDeviceGetAttribute
  0.00%  4.4680us         2  2.2340us  1.8610us  2.6070us  cuDeviceGetCount
  0.00%     585ns         2     292ns     282ns     303ns  cuDeviceGet
  0.00%     389ns         2     194ns     191ns     198ns  cudaCreateChannelDesc
