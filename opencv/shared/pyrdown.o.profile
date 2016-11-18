==6751== NVPROF is profiling process 6751, command: ./pyrdown.o
==6751== Profiling application: ./pyrdown.o
==6751== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.32%  109.95us        25  4.3980us     960ns  81.216us  [CUDA memcpy HtoD]
 33.51%  79.552us         1  79.552us  79.552us  79.552us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 14.44%  34.272us        19  1.8030us     320ns  20.960us  [CUDA memcpy DtoH]
  4.49%  10.656us         4  2.6640us  1.4400us  4.0320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.24%  2.9440us         1  2.9440us  2.9440us  2.9440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6751== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.49%  1.19146s        11  108.31ms  4.3000us  1.18509s  cudaMalloc
  3.05%  38.931ms         5  7.7861ms  4.8590us  38.580ms  cudaFree
  2.22%  28.306ms        90  314.52us     189ns  11.998ms  cuDeviceGetAttribute
  0.81%  10.297ms         1  10.297ms  10.297ms  10.297ms  cudaGetDeviceProperties
  0.17%  2.1341ms         1  2.1341ms  2.1341ms  2.1341ms  cuDeviceTotalMem
  0.12%  1.5720ms         1  1.5720ms  1.5720ms  1.5720ms  cuDeviceGetName
  0.05%  588.40us         6  98.067us  6.1510us  493.90us  cudaLaunch
  0.04%  462.33us         5  92.466us     650ns  458.13us  cudaEventRecord
  0.03%  376.83us        37  10.184us  2.2130us  105.54us  cudaMemcpyAsync
  0.02%  240.73us         7  34.390us  5.1530us  150.36us  cudaMemcpy
  0.00%  47.167us        20  2.3580us  1.4150us  9.5870us  cudaFuncGetAttributes
  0.00%  9.1440us         5  1.8280us     743ns  3.2840us  cudaEventCreateWithFlags
  0.00%  8.9240us        15     594ns     217ns  1.7760us  cudaGetDevice
  0.00%  7.6310us         8     953ns     125ns  5.2600us  cudaSetupArgument
  0.00%  7.1850us         5  1.4370us     539ns  3.2990us  cudaEventDestroy
  0.00%  4.6940us         6     782ns     199ns  1.0610us  cudaConfigureCall
  0.00%  3.4450us         2  1.7220us  1.0940us  2.3510us  cuDeviceGetCount
  0.00%  3.2600us        11     296ns     206ns     939ns  cudaDeviceGetAttribute
  0.00%     892ns         2     446ns     367ns     525ns  cuDeviceGet
