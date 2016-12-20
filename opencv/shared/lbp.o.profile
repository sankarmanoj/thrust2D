==9728== NVPROF is profiling process 9728, command: ./lbp.o 1631
==9728== Profiling application: ./lbp.o 1631
==9728== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.35%  2.0484ms         6  341.39us     736ns  2.0440ms  [CUDA memcpy HtoD]
 33.82%  1.5275ms         1  1.5275ms  1.5275ms  1.5275ms  [CUDA memcpy DtoH]
 11.27%  508.99us         1  508.99us  508.99us  508.99us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
  5.26%  237.76us         1  237.76us  237.76us  237.76us  [CUDA memcpy DtoD]
  4.30%  194.11us         3  64.704us  63.584us  65.440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9728== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.76%  599.09ms         8  74.887ms  11.539us  592.87ms  cudaMalloc
  1.90%  12.044ms         3  4.0145ms  761.54us  9.8089ms  cudaFree
  0.99%  6.2627ms         6  1.0438ms  8.6880us  3.6577ms  cudaMemcpy
  0.73%  4.6208ms         2  2.3104ms  416.65us  4.2041ms  cudaGetDeviceProperties
  0.71%  4.4591ms         1  4.4591ms  4.4591ms  4.4591ms  cudaMemcpyAsync
  0.41%  2.6011ms         1  2.6011ms  2.6011ms  2.6011ms  cudaMallocPitch
  0.36%  2.2602ms        90  25.112us     136ns  1.1701ms  cuDeviceGetAttribute
  0.06%  350.18us         4  87.545us  38.312us  121.60us  cudaLaunch
  0.03%  168.49us         1  168.49us  168.49us  168.49us  cuDeviceTotalMem
  0.02%  128.05us         1  128.05us  128.05us  128.05us  cudaMemcpy2D
  0.01%  67.826us        12  5.6520us  2.1240us  16.898us  cudaFuncGetAttributes
  0.01%  40.962us         1  40.962us  40.962us  40.962us  cudaCreateTextureObject
  0.01%  40.051us         1  40.051us  40.051us  40.051us  cuDeviceGetName
  0.00%  23.837us         9  2.6480us     321ns  8.6090us  cudaGetDevice
  0.00%  16.397us         3  5.4650us  4.7750us  6.1030us  cudaEventCreateWithFlags
  0.00%  14.573us         4  3.6430us  2.7060us  4.7030us  cudaConfigureCall
  0.00%  14.399us         3  4.7990us  4.1780us  5.5410us  cudaEventRecord
  0.00%  9.8660us        11     896ns     385ns  3.6700us  cudaDeviceGetAttribute
  0.00%  8.6570us         3  2.8850us  2.6670us  3.2800us  cudaEventDestroy
  0.00%  7.5110us         7  1.0730us     223ns  2.1240us  cudaSetupArgument
  0.00%  5.3240us         2  2.6620us  1.2710us  4.0530us  cuDeviceGetCount
  0.00%  1.7780us         2     889ns     594ns  1.1840us  cuDeviceGet
  0.00%     384ns         1     384ns     384ns     384ns  cudaCreateChannelDesc
