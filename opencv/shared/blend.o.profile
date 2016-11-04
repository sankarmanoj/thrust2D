==4762== NVPROF is profiling process 4762, command: ./blend.o
==4762== Profiling application: ./blend.o
==4762== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.25%  171.89us         8  21.485us  1.1840us  85.798us  [CUDA memcpy HtoD]
 23.29%  79.653us         1  79.653us  79.653us  79.653us  void thrust::transform_kernel<float, blendFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, int, int, int, int, int, blendFunctor)
 23.11%  79.045us         1  79.045us  79.045us  79.045us  [CUDA memcpy DtoH]
  3.36%  11.489us         3  3.8290us  3.6800us  4.0970us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4762== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.52%  810.97ms         9  90.108ms  5.0470us  806.74ms  cudaMalloc
  2.22%  18.661ms         1  18.661ms  18.661ms  18.661ms  cudaGetDeviceProperties
  0.64%  5.3372ms        90  59.302us     116ns  3.6046ms  cuDeviceGetAttribute
  0.46%  3.8454ms         3  1.2818ms  24.180us  2.9476ms  cudaFree
  0.05%  431.96us         7  61.708us  8.6140us  282.35us  cudaMemcpy
  0.04%  304.34us         2  152.17us  127.90us  176.44us  cudaMemcpyAsync
  0.03%  281.23us         1  281.23us  281.23us  281.23us  cuDeviceTotalMem
  0.02%  139.15us         4  34.787us  27.111us  45.716us  cudaLaunch
  0.01%  122.90us         1  122.90us  122.90us  122.90us  cuDeviceGetName
  0.00%  36.048us        12  3.0040us  1.7320us  7.4220us  cudaFuncGetAttributes
  0.00%  11.207us         9  1.2450us     247ns  3.6940us  cudaGetDevice
  0.00%  9.3320us        12     777ns     144ns  5.5100us  cudaSetupArgument
  0.00%  8.4610us         3  2.8200us  2.3400us  3.3900us  cudaEventCreateWithFlags
  0.00%  6.0990us         3  2.0330us  1.8980us  2.2930us  cudaEventRecord
  0.00%  5.0710us         3  1.6900us  1.3930us  2.0790us  cudaEventDestroy
  0.00%  4.7460us         4  1.1860us     774ns  1.3740us  cudaConfigureCall
  0.00%  4.5250us        11     411ns     232ns  1.6180us  cudaDeviceGetAttribute
  0.00%  2.5970us         2  1.2980us     735ns  1.8620us  cuDeviceGetCount
  0.00%     523ns         1     523ns     523ns     523ns  cudaGetLastError
  0.00%     455ns         2     227ns     206ns     249ns  cuDeviceGet
