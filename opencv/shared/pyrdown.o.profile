==16684== NVPROF is profiling process 16684, command: ./pyrdown.o
==16684== Profiling application: ./pyrdown.o
==16684== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.74%  124.47us        25  4.9780us     512ns  103.48us  [CUDA memcpy HtoD]
 30.08%  76.826us         1  76.826us  76.826us  76.826us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 15.74%  40.189us        19  2.1150us     288ns  29.790us  [CUDA memcpy DtoH]
  4.21%  10.750us         4  2.6870us  1.2480us  4.4150us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.24%  3.1670us         1  3.1670us  3.1670us  3.1670us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16684== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.88%  945.75ms        11  85.978ms  5.3580us  937.10ms  cudaMalloc
  0.62%  5.9284ms         1  5.9284ms  5.9284ms  5.9284ms  cudaGetDeviceProperties
  0.19%  1.7734ms         5  354.68us  6.8940us  1.0149ms  cudaFree
  0.11%  1.0789ms        37  29.159us  3.9820us  762.34us  cudaMemcpyAsync
  0.09%  872.82us         6  145.47us  13.773us  486.36us  cudaLaunch
  0.05%  463.37us         7  66.195us  8.6840us  240.59us  cudaMemcpy
  0.02%  218.11us        91  2.3960us     129ns  78.065us  cuDeviceGetAttribute
  0.02%  187.95us         1  187.95us  187.95us  187.95us  cuDeviceTotalMem
  0.01%  62.405us        20  3.1200us  1.4000us  12.135us  cudaFuncGetAttributes
  0.00%  40.427us         1  40.427us  40.427us  40.427us  cuDeviceGetName
  0.00%  22.724us        15  1.5140us     211ns  8.5220us  cudaGetDevice
  0.00%  19.799us         5  3.9590us  1.0690us  6.0580us  cudaEventCreateWithFlags
  0.00%  15.829us         8  1.9780us     116ns  9.3580us  cudaSetupArgument
  0.00%  13.462us         5  2.6920us     661ns  4.6150us  cudaEventRecord
  0.00%  9.0490us         5  1.8090us     902ns  2.7180us  cudaEventDestroy
  0.00%  8.3180us         6  1.3860us     353ns  2.8900us  cudaConfigureCall
  0.00%  7.5040us         3  2.5010us     657ns  5.6270us  cuDeviceGetCount
  0.00%  7.0960us        11     645ns     265ns  3.0160us  cudaDeviceGetAttribute
  0.00%  2.5790us         3     859ns     247ns  1.6190us  cuDeviceGet
