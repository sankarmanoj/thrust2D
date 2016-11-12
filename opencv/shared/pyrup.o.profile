==10760== NVPROF is profiling process 10760, command: ./pyrup.o
==10760== Profiling application: ./pyrup.o
==10760== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 73.03%  598.86us         1  598.86us  598.86us  598.86us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 16.92%  138.79us        56  2.4780us     544ns  76.577us  [CUDA memcpy HtoD]
  7.13%  58.433us        51  1.1450us     320ns  18.912us  [CUDA memcpy DtoH]
  1.40%  11.456us         4  2.8640us  1.4720us  5.3440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.62%  5.1200us         1  5.1200us  5.1200us  5.1200us  [CUDA memcpy DtoD]
  0.59%  4.8320us         1  4.8320us  4.8320us  4.8320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.31%  2.5280us         1  2.5280us  2.5280us  2.5280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10760== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.50%  520.42ms        10  52.042ms  7.8250us  517.87ms  cudaMalloc
  1.06%  5.7145ms         1  5.7145ms  5.7145ms  5.7145ms  cudaGetDeviceProperties
  0.93%  5.0313ms        90  55.903us     113ns  3.5642ms  cuDeviceGetAttribute
  0.41%  2.2298ms         1  2.2298ms  2.2298ms  2.2298ms  cuDeviceTotalMem
  0.39%  2.0994ms         4  524.85us  6.4850us  2.0437ms  cudaFree
  0.20%  1.0862ms         1  1.0862ms  1.0862ms  1.0862ms  cuDeviceGetName
  0.19%  998.86us       101  9.8890us  3.1310us  124.48us  cudaMemcpyAsync
  0.12%  655.06us         2  327.53us  4.5360us  650.53us  cudaDeviceSynchronize
  0.10%  537.52us        25  21.500us  1.8690us  462.55us  cudaFuncGetAttributes
  0.04%  231.84us         7  33.120us  17.009us  73.749us  cudaMemcpy
  0.04%  195.56us         7  27.937us  10.724us  45.337us  cudaLaunch
  0.00%  16.728us        19     880ns     270ns  3.2230us  cudaGetDevice
  0.00%  11.820us         6  1.9700us  1.2080us  2.3420us  cudaEventCreateWithFlags
  0.00%  10.164us        11     924ns     197ns  5.6850us  cudaSetupArgument
  0.00%  10.134us         6  1.6890us  1.1220us  1.9320us  cudaEventRecord
  0.00%  8.2230us         6  1.3700us  1.0090us  1.7330us  cudaEventDestroy
  0.00%  7.4580us        15     497ns     336ns  1.2780us  cudaDeviceGetAttribute
  0.00%  7.1990us         7  1.0280us     354ns  2.1930us  cudaConfigureCall
  0.00%  2.2650us         2  1.1320us     437ns  1.8280us  cuDeviceGetCount
  0.00%  1.8580us         1  1.8580us  1.8580us  1.8580us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     699ns         1     699ns     699ns     699ns  cudaGetLastError
  0.00%     615ns         2     307ns     253ns     362ns  cuDeviceGet
