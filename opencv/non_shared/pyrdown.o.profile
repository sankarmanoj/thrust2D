==8266== NVPROF is profiling process 8266, command: ./pyrdown.o
==8266== Profiling application: ./pyrdown.o
==8266== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 64.89%  2.8581ms         1  2.8581ms  2.8581ms  2.8581ms  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 26.81%  1.1807ms        51  23.151us     319ns  1.0766ms  [CUDA memcpy DtoH]
  5.45%  239.89us        56  4.2830us     543ns  162.07us  [CUDA memcpy HtoD]
  0.94%  41.196us         1  41.196us  41.196us  41.196us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.93%  41.036us         1  41.036us  41.036us  41.036us  [CUDA memcpy DtoD]
  0.92%  40.365us         4  10.091us  1.6310us  18.200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.08%  3.3260us         1  3.3260us  3.3260us  3.3260us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8266== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.27%  915.18ms        10  91.518ms  12.032us  894.70ms  cudaMalloc
  1.83%  17.371ms         1  17.371ms  17.371ms  17.371ms  cudaGetDeviceProperties
  0.86%  8.1368ms         4  2.0342ms  15.925us  5.5018ms  cudaFree
  0.31%  2.9170ms         2  1.4585ms  23.707us  2.8933ms  cudaDeviceSynchronize
  0.29%  2.7842ms         7  397.75us  23.798us  2.5558ms  cudaMemcpy
  0.21%  2.0404ms       101  20.202us  3.4970us  436.62us  cudaMemcpyAsync
  0.15%  1.4513ms         7  207.32us  47.217us  586.17us  cudaLaunch
  0.02%  219.61us        90  2.4400us     130ns  73.167us  cuDeviceGetAttribute
  0.02%  183.15us         1  183.15us  183.15us  183.15us  cuDeviceTotalMem
  0.01%  124.10us        25  4.9630us  1.9530us  16.825us  cudaFuncGetAttributes
  0.01%  56.069us         1  56.069us  56.069us  56.069us  cuDeviceGetName
  0.00%  35.155us        19  1.8500us     283ns  8.0580us  cudaGetDevice
  0.00%  26.034us         6  4.3390us  3.2570us  6.2790us  cudaEventCreateWithFlags
  0.00%  18.277us         6  3.0460us  2.6400us  4.0260us  cudaEventRecord
  0.00%  15.283us         7  2.1830us     939ns  5.4980us  cudaConfigureCall
  0.00%  14.254us        11  1.2950us     143ns  7.6760us  cudaSetupArgument
  0.00%  14.105us         6  2.3500us  1.9130us  2.9630us  cudaEventDestroy
  0.00%  11.200us        15     746ns     318ns  2.0780us  cudaDeviceGetAttribute
  0.00%  5.6400us         2  2.8200us     391ns  5.2490us  cuDeviceGetCount
  0.00%  4.2140us         1  4.2140us  4.2140us  4.2140us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.2260us         1  1.2260us  1.2260us  1.2260us  cudaGetLastError
  0.00%     717ns         2     358ns     230ns     487ns  cuDeviceGet
