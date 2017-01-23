==7988== NVPROF is profiling process 7988, command: ./dilate.o
==7988== Profiling application: ./dilate.o
==7988== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.60%  61.823us         1  61.823us  61.823us  61.823us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 36.22%  47.039us         6  7.8390us     576ns  22.240us  [CUDA memcpy HtoD]
 16.19%  21.024us         1  21.024us  21.024us  21.024us  [CUDA memcpy DtoH]

==7988== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.59%  540.21ms         4  135.05ms  3.2950us  540.20ms  cudaMallocPitch
  0.25%  1.3426ms         4  335.65us  3.5800us  1.3298ms  cudaMalloc
  0.07%  360.19us        90  4.0020us     137ns  142.97us  cuDeviceGetAttribute
  0.04%  221.90us         3  73.967us  19.180us  161.61us  cudaMemcpy2D
  0.04%  209.65us         1  209.65us  209.65us  209.65us  cuDeviceTotalMem
  0.01%  35.163us         1  35.163us  35.163us  35.163us  cuDeviceGetName
  0.01%  29.460us         4  7.3650us  3.0260us  18.945us  cudaMemcpy
  0.00%  20.401us         1  20.401us  20.401us  20.401us  cudaLaunch
  0.00%  7.6670us         4  1.9160us  1.4130us  3.3550us  cudaFuncGetAttributes
  0.00%  4.2630us         1  4.2630us  4.2630us  4.2630us  cudaSetupArgument
  0.00%  3.1400us         2  1.5700us     729ns  2.4110us  cuDeviceGetCount
  0.00%  2.9510us        11     268ns     208ns     629ns  cudaDeviceGetAttribute
  0.00%  1.6060us         1  1.6060us  1.6060us  1.6060us  cudaEventCreateWithFlags
  0.00%  1.4100us         3     470ns     208ns     954ns  cudaGetDevice
  0.00%  1.3070us         1  1.3070us  1.3070us  1.3070us  cudaEventRecord
  0.00%     936ns         1     936ns     936ns     936ns  cudaConfigureCall
  0.00%     892ns         1     892ns     892ns     892ns  cudaEventDestroy
  0.00%     692ns         2     346ns     289ns     403ns  cuDeviceGet
