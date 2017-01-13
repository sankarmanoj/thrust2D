==15179== NVPROF is profiling process 15179, command: ./pyrdown.o 1631
==15179== Profiling application: ./pyrdown.o 1631
==15179== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.64%  14.202ms         4  3.5504ms     736ns  14.198ms  [CUDA memcpy HtoD]
 13.42%  3.7632ms         2  1.8816ms  1.7120ms  2.0511ms  [CUDA memcpy DtoA]
 12.24%  3.4332ms         1  3.4332ms  3.4332ms  3.4332ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 10.33%  2.8968ms         1  2.8968ms  2.8968ms  2.8968ms  [CUDA memcpy DtoH]
  9.52%  2.6696ms         1  2.6696ms  2.6696ms  2.6696ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  2.52%  707.14us         2  353.57us  134.46us  572.67us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.33%  372.77us         1  372.77us  372.77us  372.77us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==15179== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.46%  460.11ms         5  92.022ms  11.607us  458.19ms  cudaMalloc
  3.08%  15.182ms         1  15.182ms  15.182ms  15.182ms  cudaMemcpyAsync
  2.75%  13.538ms         3  4.5127ms  72.417us  13.304ms  cudaMemcpy
  0.22%  1.0631ms        90  11.812us     131ns  610.16us  cuDeviceGetAttribute
  0.18%  896.04us         1  896.04us  896.04us  896.04us  cuDeviceTotalMem
  0.12%  599.91us         1  599.91us  599.91us  599.91us  cudaMallocArray
  0.05%  242.24us         1  242.24us  242.24us  242.24us  cuDeviceGetName
  0.04%  220.68us         2  110.34us  67.458us  153.22us  cudaFree
  0.04%  187.76us         5  37.551us  8.6290us  105.90us  cudaLaunch
  0.02%  80.298us         2  40.149us  13.808us  66.490us  cudaMemcpyToArray
  0.01%  47.234us        12  3.9360us  2.2800us  14.440us  cudaFuncGetAttributes
  0.01%  26.947us         1  26.947us  26.947us  26.947us  cudaMemcpyToSymbol
  0.00%  15.089us         2  7.5440us  3.9360us  11.153us  cudaCreateTextureObject
  0.00%  14.536us        11  1.3210us     163ns  9.8720us  cudaSetupArgument
  0.00%  14.082us         9  1.5640us     326ns  7.9590us  cudaGetDevice
  0.00%  9.5350us        11     866ns     402ns  3.4830us  cudaDeviceGetAttribute
  0.00%  8.0630us         5  1.6120us     268ns  4.9780us  cudaConfigureCall
  0.00%  7.5360us         3  2.5120us  1.5400us  3.5390us  cudaEventCreateWithFlags
  0.00%  7.2930us         3  2.4310us  1.6910us  3.3160us  cudaEventRecord
  0.00%  4.6120us         2  2.3060us     249ns  4.3630us  cuDeviceGetCount
  0.00%  4.4720us         3  1.4900us  1.0010us  1.9320us  cudaEventDestroy
  0.00%  1.1100us         2     555ns     222ns     888ns  cuDeviceGet
  0.00%     619ns         1     619ns     619ns     619ns  cudaCreateChannelDesc
