==25627== NVPROF is profiling process 25627, command: ./gaussian_filter.o
==25627== Profiling application: ./gaussian_filter.o
==25627== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.22%  267.20us         1  267.20us  267.20us  267.20us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 29.26%  189.66us        25  7.5860us     544ns  174.68us  [CUDA memcpy HtoD]
 27.46%  178.01us        19  9.3680us     320ns  168.69us  [CUDA memcpy DtoH]
  1.51%  9.7680us         3  3.2560us  1.3770us  4.3880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.55%  3.5550us         1  3.5550us  3.5550us  3.5550us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25627== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.12%  273.68ms        10  27.368ms  5.1850us  273.25ms  cudaMalloc
  0.32%  894.46us         7  127.78us  4.6880us  842.73us  cudaMemcpy
  0.16%  455.23us        37  12.303us  1.9020us  246.67us  cudaMemcpyAsync
  0.10%  283.92us         4  70.980us  10.805us  212.59us  cudaFree
  0.09%  253.27us        90  2.8140us     135ns  92.157us  cuDeviceGetAttribute
  0.07%  197.77us         1  197.77us  197.77us  197.77us  cudaGetDeviceProperties
  0.06%  174.13us         1  174.13us  174.13us  174.13us  cuDeviceTotalMem
  0.03%  81.038us         5  16.207us  7.3010us  26.197us  cudaLaunch
  0.01%  37.408us        16  2.3380us  1.4190us  12.882us  cudaFuncGetAttributes
  0.01%  21.709us         1  21.709us  21.709us  21.709us  cuDeviceGetName
  0.00%  7.8590us         8     982ns     110ns  6.4290us  cudaSetupArgument
  0.00%  6.5630us        12     546ns     209ns  2.7840us  cudaGetDevice
  0.00%  5.6380us         4  1.4090us     773ns  2.4270us  cudaEventCreateWithFlags
  0.00%  5.2000us         4  1.3000us     654ns  2.9440us  cudaEventRecord
  0.00%  3.7940us        11     344ns     207ns  1.2610us  cudaDeviceGetAttribute
  0.00%  3.3070us         4     826ns     552ns  1.3620us  cudaEventDestroy
  0.00%  2.9540us         2  1.4770us     617ns  2.3370us  cuDeviceGetCount
  0.00%  2.3990us         5     479ns     245ns     813ns  cudaConfigureCall
  0.00%     930ns         2     465ns     219ns     711ns  cuDeviceGet
