==8116== NVPROF is profiling process 8116, command: ./scharr_filter.o
==8116== Profiling application: ./scharr_filter.o
==8116== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.66%  119.46us         2  59.727us  58.272us  61.183us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.09%  75.422us        12  6.2850us     544ns  21.664us  [CUDA memcpy HtoD]
 14.43%  36.159us         1  36.159us  36.159us  36.159us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.81%  19.584us         1  19.584us  19.584us  19.584us  [CUDA memcpy DtoH]

==8116== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.16%  567.25ms         7  81.036ms  2.8610us  566.37ms  cudaMallocPitch
  1.09%  6.2979ms        90  69.976us     104ns  4.7882ms  cuDeviceGetAttribute
  0.32%  1.8410ms         1  1.8410ms  1.8410ms  1.8410ms  cuDeviceGetName
  0.30%  1.7233ms         7  246.19us  4.1120us  1.6891ms  cudaMalloc
  0.06%  372.88us         6  62.147us  12.768us  216.87us  cudaMemcpy2D
  0.04%  243.56us         1  243.56us  243.56us  243.56us  cuDeviceTotalMem
  0.01%  55.269us         3  18.423us  5.4110us  39.032us  cudaLaunch
  0.01%  52.610us         7  7.5150us  3.4650us  23.258us  cudaMemcpy
  0.00%  23.046us        12  1.9200us  1.4220us  4.0860us  cudaFuncGetAttributes
  0.00%  6.2490us         3  2.0830us     577ns  5.0250us  cudaEventCreateWithFlags
  0.00%  5.3010us         3  1.7670us     154ns  4.5960us  cudaSetupArgument
  0.00%  4.2850us         3  1.4280us     493ns  3.2800us  cudaEventRecord
  0.00%  3.6240us         9     402ns     201ns  1.1320us  cudaGetDevice
  0.00%  3.3830us        11     307ns     206ns     698ns  cudaDeviceGetAttribute
  0.00%  2.5170us         3     839ns     388ns  1.7280us  cudaEventDestroy
  0.00%  2.0340us         3     678ns     147ns  1.2640us  cudaConfigureCall
  0.00%  1.8170us         2     908ns     397ns  1.4200us  cuDeviceGetCount
  0.00%     369ns         2     184ns     156ns     213ns  cuDeviceGet
  0.00%     358ns         1     358ns     358ns     358ns  cudaGetLastError
