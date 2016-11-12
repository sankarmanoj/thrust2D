==29120== NVPROF is profiling process 29120, command: ./gaussian_filter.o
==29120== Profiling application: ./gaussian_filter.o
==29120== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.46%  162.05us         1  162.05us  162.05us  162.05us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, convolutionFunctor)
 28.27%  105.41us        25  4.2160us     640ns  77.152us  [CUDA memcpy HtoD]
 24.64%  91.872us        19  4.8350us     320ns  77.056us  [CUDA memcpy DtoH]
  2.63%  9.7920us         3  3.2640us  1.3760us  4.7680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.00%  3.7440us         1  3.7440us  3.7440us  3.7440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29120== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.87%  646.67ms        10  64.667ms  7.1890us  627.67ms  cudaMalloc
  2.43%  16.558ms         4  4.1395ms  24.572us  15.431ms  cudaFree
  1.59%  10.824ms        90  120.26us     145ns  8.8610ms  cuDeviceGetAttribute
  0.88%  6.0286ms         1  6.0286ms  6.0286ms  6.0286ms  cudaGetDeviceProperties
  0.08%  525.68us         7  75.097us  5.5630us  390.77us  cudaMemcpy
  0.07%  483.72us        37  13.073us  2.7580us  169.16us  cudaMemcpyAsync
  0.03%  210.76us         1  210.76us  210.76us  210.76us  cuDeviceTotalMem
  0.03%  178.91us         5  35.781us  9.8800us  47.180us  cudaLaunch
  0.01%  46.480us        16  2.9050us  1.8560us  7.0050us  cudaFuncGetAttributes
  0.01%  46.334us         1  46.334us  46.334us  46.334us  cuDeviceGetName
  0.00%  13.135us        12  1.0940us     291ns  3.3810us  cudaGetDevice
  0.00%  10.519us         8  1.3140us     160ns  7.7530us  cudaSetupArgument
  0.00%  8.5410us         4  2.1350us  1.0250us  3.0670us  cudaEventCreateWithFlags
  0.00%  7.3390us         4  1.8340us     928ns  2.4320us  cudaEventRecord
  0.00%  6.2380us         5  1.2470us     284ns  2.0620us  cudaConfigureCall
  0.00%  5.1280us         4  1.2820us     813ns  1.6530us  cudaEventDestroy
  0.00%  4.6010us        11     418ns     242ns  1.3110us  cudaDeviceGetAttribute
  0.00%  3.9720us         2  1.9860us     543ns  3.4290us  cuDeviceGetCount
  0.00%     656ns         2     328ns     188ns     468ns  cuDeviceGet
  0.00%     537ns         1     537ns     537ns     537ns  cudaGetLastError
