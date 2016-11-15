==12761== NVPROF is profiling process 12761, command: ./pyrdown.o
==12761== Profiling application: ./pyrdown.o
==12761== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 89.01%  88.481ms         1  88.481ms  88.481ms  88.481ms  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  4.78%  4.7528ms         1  4.7528ms  4.7528ms  4.7528ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.12%  4.0936ms         4  1.0234ms  169.80us  1.5760ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.18%  1.1771ms        19  61.951us     320ns  1.1679ms  [CUDA memcpy DtoH]
  0.79%  782.50us         1  782.50us  782.50us  782.50us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.12%  115.65us        26  4.4480us     544ns  101.77us  [CUDA memcpy HtoD]

==12761== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.66%  4.23671s        12  353.06ms  4.5610us  4.23605s  cudaMalloc
  2.08%  90.184ms         8  11.273ms  3.2460us  90.130ms  cudaMemcpy
  0.22%  9.6813ms         7  1.3830ms  1.6930us  4.7560ms  cudaDeviceSynchronize
  0.02%  702.54us         7  100.36us  9.5490us  382.03us  cudaLaunch
  0.01%  283.24us        37  7.6550us  2.2020us  109.76us  cudaMemcpyAsync
  0.01%  221.65us        90  2.4620us      96ns  84.931us  cuDeviceGetAttribute
  0.00%  188.78us         5  37.756us  6.3210us  97.816us  cudaFree
  0.00%  166.87us         1  166.87us  166.87us  166.87us  cuDeviceTotalMem
  0.00%  138.80us         1  138.80us  138.80us  138.80us  cudaGetDeviceProperties
  0.00%  52.664us        24  2.1940us  1.3580us  8.1060us  cudaFuncGetAttributes
  0.00%  19.095us         1  19.095us  19.095us  19.095us  cuDeviceGetName
  0.00%  9.2850us        18     515ns     205ns  1.5820us  cudaGetDevice
  0.00%  8.8660us         6  1.4770us     832ns  2.1900us  cudaEventCreateWithFlags
  0.00%  6.7250us         6  1.1200us     709ns  1.6450us  cudaEventRecord
  0.00%  4.8490us        10     484ns     105ns  2.7290us  cudaSetupArgument
  0.00%  4.8240us         6     804ns     630ns  1.0720us  cudaEventDestroy
  0.00%  3.5350us        11     321ns     196ns  1.0250us  cudaDeviceGetAttribute
  0.00%  3.2660us         7     466ns     250ns     870ns  cudaConfigureCall
  0.00%  1.1450us         2     572ns     152ns     993ns  cuDeviceGetCount
  0.00%     296ns         2     148ns     100ns     196ns  cuDeviceGet
