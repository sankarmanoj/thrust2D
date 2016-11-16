==5752== NVPROF is profiling process 5752, command: ./pyrup.o
==5752== Profiling application: ./pyrup.o
==5752== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.71%  133.57us        27  4.9460us     576ns  115.90us  [CUDA memcpy HtoD]
 28.63%  78.496us         1  78.496us  78.496us  78.496us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 10.97%  30.080us        19  1.5830us     320ns  20.768us  [CUDA memcpy DtoH]
  6.26%  17.152us         1  17.152us  17.152us  17.152us  void thrust::for_each_kernel<float, pyrupTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrupTransformFunctor)
  4.13%  11.328us         4  2.8320us  1.5040us  4.2240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.31%  3.5840us         1  3.5840us  3.5840us  3.5840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5752== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.95%  890.56ms        13  68.505ms  4.9250us  889.33ms  cudaMalloc
  1.06%  9.6010ms        90  106.68us     129ns  4.4511ms  cuDeviceGetAttribute
  0.62%  5.5999ms         2  2.7999ms  1.3569ms  4.2430ms  cudaGetDeviceProperties
  0.17%  1.5117ms        37  40.858us  3.8170us  755.55us  cudaMemcpyAsync
  0.09%  858.66us         9  95.406us  7.5980us  558.38us  cudaMemcpy
  0.03%  271.89us         5  54.378us  6.6240us  188.39us  cudaFree
  0.03%  259.71us         7  37.101us  7.6400us  116.02us  cudaLaunch
  0.03%  235.86us         1  235.86us  235.86us  235.86us  cuDeviceTotalMem
  0.02%  189.63us         1  189.63us  189.63us  189.63us  cuDeviceGetName
  0.01%  67.189us        20  3.3590us  1.4000us  22.838us  cudaFuncGetAttributes
  0.00%  18.104us        12  1.5080us     113ns  14.970us  cudaSetupArgument
  0.00%  14.126us        15     941ns     204ns  5.0630us  cudaGetDevice
  0.00%  12.706us         5  2.5410us     852ns  5.2200us  cudaEventCreateWithFlags
  0.00%  10.355us         5  2.0710us     679ns  5.2080us  cudaEventRecord
  0.00%  8.0270us         7  1.1460us     229ns  3.7300us  cudaConfigureCall
  0.00%  8.0060us        11     727ns     306ns  1.4510us  cudaDeviceGetAttribute
  0.00%  7.5600us         5  1.5120us     561ns  3.8060us  cudaEventDestroy
  0.00%  3.2630us         2  1.6310us     421ns  2.8420us  cuDeviceGetCount
  0.00%  1.1040us         2     552ns     227ns     877ns  cuDeviceGet
