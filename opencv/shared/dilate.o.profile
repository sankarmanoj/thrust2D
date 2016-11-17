==25396== NVPROF is profiling process 25396, command: ./dilate.o
==25396== Profiling application: ./dilate.o
==25396== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.07%  201.07us         6  33.512us     576ns  197.65us  [CUDA memcpy HtoD]
 31.10%  117.83us         1  117.83us  117.83us  117.83us  [CUDA memcpy DtoH]
 12.76%  48.331us         1  48.331us  48.331us  48.331us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  2.18%  8.2620us         2  4.1310us  3.9070us  4.3550us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.90%  3.3950us         1  3.3950us  3.3950us  3.3950us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25396== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.60%  807.39ms         8  100.92ms  7.9450us  804.61ms  cudaMalloc
  1.59%  13.176ms         1  13.176ms  13.176ms  13.176ms  cudaGetDeviceProperties
  0.54%  4.4528ms         3  1.4843ms  46.014us  2.4881ms  cudaFree
  0.10%  833.57us         6  138.93us  8.0110us  682.25us  cudaMemcpy
  0.06%  529.91us         1  529.91us  529.91us  529.91us  cudaMemcpyAsync
  0.05%  377.51us        90  4.1940us     134ns  160.30us  cuDeviceGetAttribute
  0.02%  196.24us         1  196.24us  196.24us  196.24us  cuDeviceTotalMem
  0.02%  160.84us         4  40.210us  15.372us  63.329us  cudaLaunch
  0.01%  45.125us         1  45.125us  45.125us  45.125us  cuDeviceGetName
  0.00%  37.250us        12  3.1040us  2.2090us  6.8860us  cudaFuncGetAttributes
  0.00%  8.8610us         9     984ns     323ns  3.3140us  cudaGetDevice
  0.00%  7.6130us         3  2.5370us  1.7120us  2.9610us  cudaEventCreateWithFlags
  0.00%  6.5220us         7     931ns     215ns  4.0140us  cudaSetupArgument
  0.00%  5.9620us         3  1.9870us  1.2210us  2.3990us  cudaEventRecord
  0.00%  5.5360us         2  2.7680us     524ns  5.0120us  cuDeviceGetCount
  0.00%  5.5340us        11     503ns     320ns  1.5630us  cudaDeviceGetAttribute
  0.00%  4.8230us         4  1.2050us     403ns  2.0010us  cudaConfigureCall
  0.00%  4.2920us         3  1.4300us  1.0990us  1.7530us  cudaEventDestroy
  0.00%     587ns         2     293ns     253ns     334ns  cuDeviceGet
