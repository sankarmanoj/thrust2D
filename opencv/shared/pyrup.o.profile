==28590== NVPROF is profiling process 28590, command: ./pyrup.o
==28590== Profiling application: ./pyrup.o
==28590== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 70.13%  716.64us         1  716.64us  716.64us  716.64us  [CUDA memcpy DtoH]
  7.82%  79.904us         2  39.952us  39.936us  39.968us  [CUDA memcpy DtoA]
  7.56%  77.216us         5  15.443us  1.1840us  72.384us  [CUDA memcpy HtoD]
  4.10%  41.920us         1  41.920us  41.920us  41.920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.96%  40.480us         1  40.480us  40.480us  40.480us  thrust::convolutionRowsKernel(float*, int, int)
  3.88%  39.648us         1  39.648us  39.648us  39.648us  thrust::convolutionColumnsKernel(float*, int, int)
  2.16%  22.080us         2  11.040us  4.0320us  18.048us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.39%  4.0000us         1  4.0000us  4.0000us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==28590== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.55%  177.42ms         7  25.346ms  5.7460us  176.03ms  cudaMalloc
  0.61%  1.1027ms         4  275.68us  6.4390us  1.0672ms  cudaMemcpy
  0.20%  357.29us         1  357.29us  357.29us  357.29us  cudaMallocArray
  0.16%  294.41us         3  98.137us  70.159us  147.09us  cudaFree
  0.16%  291.84us        90  3.2420us     103ns  116.25us  cuDeviceGetAttribute
  0.11%  190.63us         1  190.63us  190.63us  190.63us  cuDeviceTotalMem
  0.06%  105.22us         1  105.22us  105.22us  105.22us  cudaDeviceSynchronize
  0.04%  70.932us         6  11.822us  8.4290us  19.354us  cudaLaunch
  0.03%  50.584us         1  50.584us  50.584us  50.584us  cudaMemcpyAsync
  0.02%  40.667us         2  20.333us  8.7700us  31.897us  cudaMemcpyToArray
  0.02%  27.073us        16  1.6920us  1.3960us  3.9400us  cudaFuncGetAttributes
  0.01%  26.350us         1  26.350us  26.350us  26.350us  cuDeviceGetName
  0.00%  8.3840us         1  8.3840us  8.3840us  8.3840us  cudaMemcpyToSymbol
  0.00%  6.9090us        10     690ns     116ns  4.9920us  cudaSetupArgument
  0.00%  5.2280us         4  1.3070us     859ns  1.9660us  cudaEventCreateWithFlags
  0.00%  4.9000us        12     408ns     217ns  1.3570us  cudaGetDevice
  0.00%  4.7560us         2  2.3780us  1.5810us  3.1750us  cudaBindTextureToArray
  0.00%  3.4900us         4     872ns     700ns  1.3280us  cudaEventRecord
  0.00%  3.0790us        11     279ns     204ns     769ns  cudaDeviceGetAttribute
  0.00%  2.6400us         4     660ns     509ns     900ns  cudaEventDestroy
  0.00%  2.0920us         6     348ns     185ns     854ns  cudaConfigureCall
  0.00%  1.6910us         2     845ns     670ns  1.0210us  cudaUnbindTexture
  0.00%  1.6320us         2     816ns     213ns  1.4190us  cuDeviceGetCount
  0.00%  1.5190us         2     759ns     472ns  1.0470us  cudaGetChannelDesc
  0.00%     327ns         2     163ns     130ns     197ns  cuDeviceGet
  0.00%     112ns         1     112ns     112ns     112ns  cudaCreateChannelDesc
