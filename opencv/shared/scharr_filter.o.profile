==14042== NVPROF is profiling process 14042, command: ./scharr_filter.o
==14042== Profiling application: ./scharr_filter.o
==14042== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.08%  139.87us        26  5.3790us     543ns  125.63us  [CUDA memcpy HtoD]
 35.45%  133.72us         1  133.72us  133.72us  133.72us  [CUDA memcpy DtoH]
 23.75%  89.597us         1  89.597us  89.597us  89.597us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  2.81%  10.592us         4  2.6480us     960ns  4.2240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.92%  3.4560us         1  3.4560us  3.4560us  3.4560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==14042== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.00%  447.67ms        12  37.305ms  4.2620us  447.26ms  cudaMalloc
  4.32%  20.357ms        91  223.71us     102ns  7.9241ms  cuDeviceGetAttribute
  0.29%  1.3716ms         1  1.3716ms  1.3716ms  1.3716ms  cuDeviceTotalMem
  0.14%  642.88us         8  80.360us  3.1800us  598.73us  cudaMemcpy
  0.10%  475.56us         1  475.56us  475.56us  475.56us  cuDeviceGetName
  0.04%  209.75us        19  11.039us  1.9390us  169.66us  cudaMemcpyAsync
  0.04%  193.91us         5  38.781us  5.2220us  134.16us  cudaFree
  0.04%  178.41us         1  178.41us  178.41us  178.41us  cudaGetDeviceProperties
  0.01%  60.858us         6  10.143us  7.1050us  14.375us  cudaLaunch
  0.01%  33.566us        20  1.6780us  1.4210us  3.7530us  cudaFuncGetAttributes
  0.00%  6.5580us        15     437ns     224ns  1.6080us  cudaGetDevice
  0.00%  5.3410us         5  1.0680us     828ns  1.6310us  cudaEventCreateWithFlags
  0.00%  4.8670us         5     973ns     714ns  1.7560us  cudaEventRecord
  0.00%  4.4050us         9     489ns     117ns  2.8390us  cudaSetupArgument
  0.00%  3.9930us         5     798ns     591ns  1.2440us  cudaEventDestroy
  0.00%  3.5260us        11     320ns     223ns     864ns  cudaDeviceGetAttribute
  0.00%  3.1050us         3  1.0350us     272ns  2.5360us  cuDeviceGetCount
  0.00%  2.8610us         3     953ns     171ns  2.1190us  cuDeviceGet
  0.00%  2.2690us         6     378ns     247ns     779ns  cudaConfigureCall
  0.00%     435ns         1     435ns     435ns     435ns  cudaGetLastError
