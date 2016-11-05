==6925== NVPROF is profiling process 6925, command: ./gaussian_filter.o
==6925== Profiling application: ./gaussian_filter.o
==6925== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 67.75%  599.52us         1  599.52us  599.52us  599.52us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 17.21%  152.29us        55  2.7680us     576ns  92.018us  [CUDA memcpy HtoD]
 13.10%  115.88us        51  2.2720us     319ns  74.773us  [CUDA memcpy DtoH]
  1.03%  9.0870us         3  3.0290us  1.6000us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.57%  5.0230us         1  5.0230us  5.0230us  5.0230us  [CUDA memcpy DtoD]
  0.35%  3.0710us         1  3.0710us  3.0710us  3.0710us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6925== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.16%  543.45ms         8  67.932ms  10.475us  538.75ms  cudaMalloc
  3.33%  19.192ms        90  213.24us     125ns  14.578ms  cuDeviceGetAttribute
  1.36%  7.8476ms         1  7.8476ms  7.8476ms  7.8476ms  cudaGetDeviceProperties
  0.55%  3.1660ms         3  1.0553ms  28.584us  3.0937ms  cudaFree
  0.16%  910.07us       101  9.0100us  2.1730us  151.33us  cudaMemcpyAsync
  0.11%  646.03us         5  129.21us  27.955us  512.18us  cudaLaunch
  0.10%  604.94us         1  604.94us  604.94us  604.94us  cudaDeviceSynchronize
  0.10%  575.23us         1  575.23us  575.23us  575.23us  cuDeviceGetName
  0.06%  374.92us         1  374.92us  374.92us  374.92us  cuDeviceTotalMem
  0.05%  288.79us         6  48.131us  14.424us  198.21us  cudaMemcpy
  0.01%  46.878us        17  2.7570us  1.4080us  6.6780us  cudaFuncGetAttributes
  0.00%  16.458us         4  4.1140us  1.7410us  8.3770us  cudaEventCreateWithFlags
  0.00%  11.757us        13     904ns     218ns  2.8560us  cudaGetDevice
  0.00%  6.9810us         4  1.7450us  1.2690us  2.3000us  cudaEventRecord
  0.00%  6.6970us         9     744ns     191ns  3.8940us  cudaSetupArgument
  0.00%  5.9290us         2  2.9640us  2.4670us  3.4620us  cuDeviceGetCount
  0.00%  5.1630us        15     344ns     213ns     861ns  cudaDeviceGetAttribute
  0.00%  4.8460us         4  1.2110us  1.0600us  1.3550us  cudaEventDestroy
  0.00%  4.6160us         5     923ns     764ns  1.0750us  cudaConfigureCall
  0.00%  2.8720us         2  1.4360us     662ns  2.2100us  cudaGetLastError
  0.00%  1.8780us         1  1.8780us  1.8780us  1.8780us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.0580us         2     529ns     490ns     568ns  cuDeviceGet
