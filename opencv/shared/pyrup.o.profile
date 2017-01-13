==15019== NVPROF is profiling process 15019, command: ./pyrup.o 1631
==15019== Profiling application: ./pyrup.o 1631
==15019== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.89%  107.20ms         1  107.20ms  107.20ms  107.20ms  [CUDA memcpy DtoH]
 12.53%  22.060ms         5  4.4120ms  1.0240us  22.054ms  [CUDA memcpy HtoD]
  8.69%  15.307ms         2  7.6536ms  6.0405ms  9.2667ms  [CUDA memcpy DtoA]
  7.12%  12.542ms         1  12.542ms  12.542ms  12.542ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  6.18%  10.881ms         1  10.881ms  10.881ms  10.881ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  2.37%  4.1694ms         3  1.3898ms  568.77us  3.0147ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.22%  3.9093ms         1  3.9093ms  3.9093ms  3.9093ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==15019== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 77.07%  635.12ms         7  90.731ms  19.543us  623.23ms  cudaMalloc
 18.24%  150.29ms         4  37.572ms  66.114us  146.63ms  cudaMemcpy
  2.76%  22.752ms         1  22.752ms  22.752ms  22.752ms  cudaMemcpyAsync
  0.69%  5.7020ms        90  63.355us     146ns  4.2895ms  cuDeviceGetAttribute
  0.53%  4.3649ms         1  4.3649ms  4.3649ms  4.3649ms  cudaDeviceSynchronize
  0.50%  4.0930ms         1  4.0930ms  4.0930ms  4.0930ms  cudaMallocArray
  0.06%  464.25us         6  77.375us  10.285us  127.38us  cudaLaunch
  0.06%  454.78us         1  454.78us  454.78us  454.78us  cuDeviceTotalMem
  0.03%  284.71us         3  94.903us  60.280us  158.38us  cudaFree
  0.01%  115.47us         2  57.733us  17.442us  98.025us  cudaMemcpyToArray
  0.01%  97.776us        16  6.1110us  1.9930us  25.640us  cudaFuncGetAttributes
  0.01%  63.514us         1  63.514us  63.514us  63.514us  cudaMemcpyToSymbol
  0.01%  62.426us         1  62.426us  62.426us  62.426us  cuDeviceGetName
  0.00%  34.727us        12  2.8930us     277ns  10.470us  cudaGetDevice
  0.00%  24.742us         4  6.1850us  3.3680us  8.3320us  cudaEventCreateWithFlags
  0.00%  22.658us        12  1.8880us     150ns  10.200us  cudaSetupArgument
  0.00%  19.716us         4  4.9290us  3.1080us  6.2170us  cudaEventRecord
  0.00%  17.704us         2  8.8520us  4.6210us  13.083us  cudaCreateTextureObject
  0.00%  14.549us         6  2.4240us     326ns  4.2390us  cudaConfigureCall
  0.00%  12.981us         4  3.2450us  2.1840us  4.0300us  cudaEventDestroy
  0.00%  12.069us         2  6.0340us  3.3170us  8.7520us  cuDeviceGetCount
  0.00%  9.1810us        11     834ns     288ns  2.9690us  cudaDeviceGetAttribute
  0.00%  2.0360us         2  1.0180us     975ns  1.0610us  cuDeviceGet
  0.00%     584ns         1     584ns     584ns     584ns  cudaCreateChannelDesc
