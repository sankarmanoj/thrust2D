==28516== NVPROF is profiling process 28516, command: ./pyrdown.o
==28516== Profiling application: ./pyrdown.o
==28516== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.03%  76.225us         4  19.056us  1.2160us  72.577us  [CUDA memcpy HtoD]
 13.29%  18.752us         1  18.752us  18.752us  18.752us  [CUDA memcpy DtoH]
 11.64%  16.416us         2  8.2080us  8.0000us  8.4160us  [CUDA memcpy DtoA]
  5.85%  8.2560us         1  8.2560us  8.2560us  8.2560us  thrust::convolutionRowsKernel(float*, int, int)
  5.85%  8.2560us         1  8.2560us  8.2560us  8.2560us  thrust::convolutionColumnsKernel(float*, int, int)
  5.19%  7.3280us         1  7.3280us  7.3280us  7.3280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.15%  5.8560us         2  2.9280us  1.5040us  4.3520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==28516== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.86%  172.13ms         5  34.427ms  5.6850us  171.42ms  cudaMalloc
  0.33%  567.91us        90  6.3100us     346ns  216.13us  cuDeviceGetAttribute
  0.32%  563.79us         1  563.79us  563.79us  563.79us  cuDeviceTotalMem
  0.19%  335.53us         1  335.53us  335.53us  335.53us  cudaMallocArray
  0.07%  124.81us         2  62.406us  7.6820us  117.13us  cudaFree
  0.07%  118.77us         3  39.589us  5.9960us  102.78us  cudaMemcpy
  0.03%  56.436us         5  11.287us  5.6000us  19.285us  cudaLaunch
  0.03%  53.064us         1  53.064us  53.064us  53.064us  cuDeviceGetName
  0.03%  50.919us         1  50.919us  50.919us  50.919us  cudaMemcpyAsync
  0.02%  39.738us         2  19.869us  8.8620us  30.876us  cudaMemcpyToArray
  0.01%  20.795us        12  1.7320us  1.4010us  3.6790us  cudaFuncGetAttributes
  0.00%  6.9120us         1  6.9120us  6.9120us  6.9120us  cudaMemcpyToSymbol
  0.00%  5.3540us         9     594ns     122ns  3.8870us  cudaSetupArgument
  0.00%  4.8700us         2  2.4350us     500ns  4.3700us  cudaGetChannelDesc
  0.00%  4.6510us         2  2.3250us  1.4740us  3.1770us  cudaBindTextureToArray
  0.00%  3.5970us         9     399ns     216ns  1.1740us  cudaGetDevice
  0.00%  3.4170us         2  1.7080us     495ns  2.9220us  cuDeviceGetCount
  0.00%  3.2890us         3  1.0960us     865ns  1.4630us  cudaEventCreateWithFlags
  0.00%  3.1130us        11     283ns     208ns     759ns  cudaDeviceGetAttribute
  0.00%  3.1090us         3  1.0360us     778ns  1.5230us  cudaEventRecord
  0.00%  2.2240us         3     741ns     640ns     887ns  cudaEventDestroy
  0.00%  1.8240us         5     364ns     164ns     862ns  cudaConfigureCall
  0.00%  1.6530us         2     826ns     646ns  1.0070us  cudaUnbindTexture
  0.00%  1.1750us         2     587ns     370ns     805ns  cuDeviceGet
  0.00%     136ns         1     136ns     136ns     136ns  cudaCreateChannelDesc
