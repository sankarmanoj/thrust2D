==7943== NVPROF is profiling process 7943, command: ./blend.o
==7943== Profiling application: ./blend.o
==7943== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.35%  54.495us         5  10.899us     704ns  26.240us  [CUDA memcpy HtoD]
 25.63%  31.488us         1  31.488us  31.488us  31.488us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 19.48%  23.935us         1  23.935us  23.935us  23.935us  [CUDA memcpy DtoH]
 10.55%  12.960us         3  4.3200us  4.0640us  4.8320us  [CUDA memset]

==7943== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.27%  566.14ms         3  188.71ms  8.1710us  566.12ms  cudaMallocPitch
  1.08%  6.2395ms         3  2.0798ms  7.8000us  6.2056ms  cudaMalloc
  0.41%  2.3343ms        90  25.937us     127ns  1.0603ms  cuDeviceGetAttribute
  0.10%  561.92us         3  187.31us  16.173us  505.96us  cudaMemset2D
  0.05%  297.28us         1  297.28us  297.28us  297.28us  cuDeviceTotalMem
  0.05%  276.55us         3  92.184us  27.272us  175.60us  cudaMemcpy2D
  0.02%  118.04us         1  118.04us  118.04us  118.04us  cuDeviceGetName
  0.01%  73.863us         3  24.621us  13.725us  36.551us  cudaMemcpy
  0.01%  31.874us         1  31.874us  31.874us  31.874us  cudaLaunch
  0.00%  14.326us         4  3.5810us  1.9840us  7.9850us  cudaFuncGetAttributes
  0.00%  6.7630us         1  6.7630us  6.7630us  6.7630us  cudaSetupArgument
  0.00%  5.4680us        11     497ns     258ns  1.6130us  cudaDeviceGetAttribute
  0.00%  3.0840us         2  1.5420us     894ns  2.1900us  cuDeviceGetCount
  0.00%  2.3830us         1  2.3830us  2.3830us  2.3830us  cudaEventCreateWithFlags
  0.00%  2.3720us         3     790ns     272ns  1.6280us  cudaGetDevice
  0.00%  2.3620us         1  2.3620us  2.3620us  2.3620us  cudaEventRecord
  0.00%  1.5300us         1  1.5300us  1.5300us  1.5300us  cudaEventDestroy
  0.00%  1.3890us         1  1.3890us  1.3890us  1.3890us  cudaConfigureCall
  0.00%     783ns         2     391ns     287ns     496ns  cuDeviceGet
