==8051== NVPROF is profiling process 8051, command: ./pyrup.o
==8051== Profiling application: ./pyrup.o
==8051== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 49.14%  52.992us         1  52.992us  52.992us  52.992us  void thrust::transform_kernel<unsigned char, convolutionFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 24.04%  25.920us         6  4.3200us     576ns  21.152us  [CUDA memcpy HtoD]
 19.44%  20.959us         1  20.959us  20.959us  20.959us  [CUDA memcpy DtoH]
  4.15%  4.4800us         1  4.4800us  4.4800us  4.4800us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.23%  3.4880us         1  3.4880us  3.4880us  3.4880us  [CUDA memset]

==8051== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.63%  499.09ms         1  499.09ms  499.09ms  499.09ms  cudaMemcpyToSymbol
  0.49%  2.4982ms         5  499.65us  6.1570us  2.4678ms  cudaMalloc
  0.30%  1.5029ms        90  16.698us     119ns  671.47us  cuDeviceGetAttribute
  0.16%  830.51us         3  276.84us  5.4800us  817.69us  cudaMallocPitch
  0.16%  823.83us         1  823.83us  823.83us  823.83us  cudaGetDeviceProperties
  0.12%  622.48us         2  311.24us  24.655us  597.82us  cudaMemcpy2D
  0.08%  412.08us         1  412.08us  412.08us  412.08us  cuDeviceTotalMem
  0.02%  84.616us         1  84.616us  84.616us  84.616us  cuDeviceGetName
  0.01%  52.333us         5  10.466us  5.0600us  26.119us  cudaMemcpy
  0.01%  28.067us         2  14.033us  9.6850us  18.382us  cudaLaunch
  0.00%  24.910us         1  24.910us  24.910us  24.910us  cudaMemset2D
  0.00%  12.759us         4  3.1890us  2.7290us  4.3320us  cudaFuncGetAttributes
  0.00%  4.5010us        11     409ns     310ns     578ns  cudaDeviceGetAttribute
  0.00%  2.4560us         5     491ns     217ns     789ns  cudaSetupArgument
  0.00%  2.2150us         1  2.2150us  2.2150us  2.2150us  cudaEventRecord
  0.00%  2.1350us         1  2.1350us  2.1350us  2.1350us  cudaEventCreateWithFlags
  0.00%  1.9280us         3     642ns     408ns  1.0650us  cudaGetDevice
  0.00%  1.8510us         2     925ns     462ns  1.3890us  cuDeviceGetCount
  0.00%  1.4190us         2     709ns     349ns  1.0700us  cudaConfigureCall
  0.00%  1.2230us         1  1.2230us  1.2230us  1.2230us  cudaEventDestroy
  0.00%     551ns         2     275ns     208ns     343ns  cuDeviceGet
