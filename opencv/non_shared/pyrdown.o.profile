==6063== NVPROF is profiling process 6063, command: ./pyrdown.o
==6063== Profiling application: ./pyrdown.o
==6063== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 71.18%  2.6479ms         1  2.6479ms  2.6479ms  2.6479ms  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 21.84%  812.36us        51  15.928us     319ns  770.41us  [CUDA memcpy DtoH]
  3.54%  131.69us        56  2.3510us     575ns  73.461us  [CUDA memcpy HtoD]
  1.15%  42.745us         1  42.745us  42.745us  42.745us  [CUDA memcpy DtoD]
  1.11%  41.242us         1  41.242us  41.242us  41.242us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.10%  41.050us         4  10.262us  1.6000us  18.301us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.09%  3.1990us         1  3.1990us  3.1990us  3.1990us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6063== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.30%  846.78ms        10  84.678ms  11.692us  838.85ms  cudaMalloc
  0.69%  5.9257ms         4  1.4814ms  26.397us  3.9976ms  cudaFree
  0.32%  2.7186ms         2  1.3593ms  59.203us  2.6594ms  cudaDeviceSynchronize
  0.29%  2.4706ms         1  2.4706ms  2.4706ms  2.4706ms  cudaGetDeviceProperties
  0.19%  1.6021ms         7  228.88us  16.809us  1.4565ms  cudaMemcpy
  0.12%  995.35us       101  9.8540us  3.0180us  150.26us  cudaMemcpyAsync
  0.04%  306.70us        90  3.4070us     118ns  122.89us  cuDeviceGetAttribute
  0.03%  223.11us         7  31.873us  27.330us  36.271us  cudaLaunch
  0.02%  205.11us         1  205.11us  205.11us  205.11us  cuDeviceTotalMem
  0.01%  86.825us        25  3.4730us  2.1050us  6.6750us  cudaFuncGetAttributes
  0.00%  30.223us         1  30.223us  30.223us  30.223us  cuDeviceGetName
  0.00%  20.603us        19  1.0840us     379ns  3.0320us  cudaGetDevice
  0.00%  14.016us         6  2.3360us  2.0320us  2.8290us  cudaEventCreateWithFlags
  0.00%  11.615us         6  1.9350us  1.7300us  2.1060us  cudaEventRecord
  0.00%  9.4620us        11     860ns     172ns  5.4510us  cudaSetupArgument
  0.00%  9.4130us         6  1.5680us  1.3030us  1.9970us  cudaEventDestroy
  0.00%  8.5050us         7  1.2150us     958ns  1.4540us  cudaConfigureCall
  0.00%  7.4970us        15     499ns     266ns  1.4760us  cudaDeviceGetAttribute
  0.00%  2.2610us         2  1.1300us     357ns  1.9040us  cuDeviceGetCount
  0.00%  1.9250us         1  1.9250us  1.9250us  1.9250us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     817ns         1     817ns     817ns     817ns  cudaGetLastError
  0.00%     613ns         2     306ns     224ns     389ns  cuDeviceGet
