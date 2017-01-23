==8206== NVPROF is profiling process 8206, command: ./sobel_filter.o
==8206== Profiling application: ./sobel_filter.o
==8206== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.76%  120.58us         2  60.287us  58.368us  62.207us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.16%  76.127us        12  6.3430us  1.2160us  21.696us  [CUDA memcpy HtoD]
 14.32%  36.160us         1  36.160us  36.160us  36.160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.76%  19.583us         1  19.583us  19.583us  19.583us  [CUDA memcpy DtoH]

==8206== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.13%  191.98ms         7  27.426ms  2.7050us  191.63ms  cudaMallocPitch
  0.25%  482.28us        90  5.3580us     219ns  188.66us  cuDeviceGetAttribute
  0.21%  402.61us         1  402.61us  402.61us  402.61us  cuDeviceTotalMem
  0.19%  360.94us         7  51.562us  3.7960us  336.18us  cudaMalloc
  0.16%  312.57us         6  52.095us  11.737us  193.72us  cudaMemcpy2D
  0.02%  42.092us         1  42.092us  42.092us  42.092us  cuDeviceGetName
  0.02%  32.763us         7  4.6800us  3.1070us  9.8870us  cudaMemcpy
  0.01%  22.664us         3  7.5540us  4.9210us  12.700us  cudaLaunch
  0.01%  17.832us        12  1.4860us  1.3530us  2.4560us  cudaFuncGetAttributes
  0.00%  4.5020us         3  1.5000us     157ns  4.1480us  cudaSetupArgument
  0.00%  2.8470us        11     258ns     199ns     661ns  cudaDeviceGetAttribute
  0.00%  2.6210us         9     291ns     194ns     777ns  cudaGetDevice
  0.00%  2.5180us         3     839ns     571ns  1.3440us  cudaEventCreateWithFlags
  0.00%  2.1920us         2  1.0960us     348ns  1.8440us  cuDeviceGetCount
  0.00%  2.0930us         3     697ns     449ns  1.0830us  cudaEventRecord
  0.00%  1.7930us         3     597ns     345ns  1.0710us  cudaEventDestroy
  0.00%  1.0990us         3     366ns     128ns     807ns  cudaConfigureCall
  0.00%     788ns         2     394ns     263ns     525ns  cuDeviceGet
  0.00%     358ns         1     358ns     358ns     358ns  cudaGetLastError
