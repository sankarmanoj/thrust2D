==8543== NVPROF is profiling process 8543, command: ./scharr_filter.o
==8543== Profiling application: ./scharr_filter.o
==8543== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 18.99%  35.552us         1  35.552us  35.552us  35.552us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 18.08%  33.856us         2  16.928us  16.608us  17.248us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 17.21%  32.225us         4  8.0560us  7.9040us  8.4160us  [CUDA memcpy DtoA]
 14.13%  26.464us         7  3.7800us  1.1840us  19.200us  [CUDA memcpy HtoD]
 10.07%  18.848us         1  18.848us  18.848us  18.848us  [CUDA memcpy DtoH]
  8.24%  15.424us         2  7.7120us  7.6160us  7.8080us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.76%  14.528us         2  7.2640us  7.1040us  7.4240us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  5.52%  10.336us         4  2.5840us  2.1120us  3.9360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8543== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.25%  225.85ms        10  22.585ms  4.1410us  225.48ms  cudaMalloc
  0.23%  521.25us        90  5.7910us     359ns  195.61us  cuDeviceGetAttribute
  0.18%  411.15us         1  411.15us  411.15us  411.15us  cuDeviceTotalMem
  0.15%  341.74us         2  170.87us  3.7890us  337.96us  cudaMallocArray
  0.05%  111.00us         5  22.200us  4.1070us  88.577us  cudaMemcpy
  0.03%  67.865us        11  6.1690us  4.3030us  12.997us  cudaLaunch
  0.03%  57.867us         4  14.466us  6.8800us  32.582us  cudaMemcpyToArray
  0.02%  45.767us         1  45.767us  45.767us  45.767us  cuDeviceGetName
  0.02%  41.247us        28  1.4730us  1.3290us  3.1010us  cudaFuncGetAttributes
  0.02%  34.536us         4  8.6340us  4.4820us  19.200us  cudaFree
  0.01%  19.432us         2  9.7160us  6.7220us  12.710us  cudaMemcpyToSymbol
  0.01%  14.874us         1  14.874us  14.874us  14.874us  cudaMemcpyAsync
  0.00%  11.155us         4  2.7880us  2.0180us  4.3670us  cudaCreateTextureObject
  0.00%  6.9120us        23     300ns     109ns  3.5090us  cudaSetupArgument
  0.00%  6.3190us        21     300ns     202ns  1.2310us  cudaGetDevice
  0.00%  5.2660us         7     752ns     507ns  1.3390us  cudaEventCreateWithFlags
  0.00%  4.9700us         7     710ns     445ns  1.2950us  cudaEventRecord
  0.00%  3.8990us         7     557ns     402ns     869ns  cudaEventDestroy
  0.00%  3.1660us        11     287ns     196ns  1.0220us  cudaDeviceGetAttribute
  0.00%  2.9110us        11     264ns     142ns     863ns  cudaConfigureCall
  0.00%  2.6450us         2  1.3220us     557ns  2.0880us  cuDeviceGetCount
  0.00%  1.0110us         2     505ns     422ns     589ns  cuDeviceGet
  0.00%     287ns         2     143ns     109ns     178ns  cudaCreateChannelDesc
