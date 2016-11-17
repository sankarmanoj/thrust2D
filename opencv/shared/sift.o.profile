==25571== NVPROF is profiling process 25571, command: ./sift.o
==25571== Profiling application: ./sift.o
==25571== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.00%  8.7600ms        12  730.00us     545ns  8.2882ms  [CUDA memcpy HtoD]
  6.44%  619.47us         1  619.47us  619.47us  619.47us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
  1.34%  129.36us         1  129.36us  129.36us  129.36us  [CUDA memcpy DtoH]
  0.94%  90.862us         4  22.715us  3.9080us  77.282us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.28%  26.807us         3  8.9350us  2.2740us  21.811us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25571== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.61%  380.35ms        16  23.772ms  6.5700us  378.78ms  cudaMalloc
  2.34%  9.4023ms         3  3.1341ms  335.63us  8.6877ms  cudaMemcpyAsync
  1.15%  4.6198ms         7  659.97us  6.9550us  2.3243ms  cudaFree
  0.84%  3.3869ms         1  3.3869ms  3.3869ms  3.3869ms  cuDeviceGetName
  0.33%  1.3444ms        10  134.44us  4.2550us  1.1579ms  cudaMemcpy
  0.23%  935.85us         1  935.85us  935.85us  935.85us  cudaGetDeviceProperties
  0.18%  716.13us        90  7.9570us     127ns  262.64us  cuDeviceGetAttribute
  0.16%  625.20us         1  625.20us  625.20us  625.20us  cudaDeviceSynchronize
  0.08%  332.90us         1  332.90us  332.90us  332.90us  cuDeviceTotalMem
  0.04%  147.83us         8  18.478us  11.657us  35.223us  cudaLaunch
  0.02%  75.440us        28  2.6940us  1.4060us  12.675us  cudaFuncGetAttributes
  0.00%  12.727us        21     606ns     223ns  3.0320us  cudaGetDevice
  0.00%  10.497us         7  1.4990us  1.1040us  2.2640us  cudaEventCreateWithFlags
  0.00%  8.5860us         2  4.2930us  2.3680us  6.2180us  cuDeviceGetCount
  0.00%  8.5260us         7  1.2180us     760ns  1.8580us  cudaEventRecord
  0.00%  6.4610us         7     923ns     711ns  1.1670us  cudaEventDestroy
  0.00%  5.9880us        11     544ns     308ns  1.8590us  cudaDeviceGetAttribute
  0.00%  5.9210us        11     538ns     167ns  3.2760us  cudaSetupArgument
  0.00%  5.1920us         8     649ns     348ns  1.4750us  cudaConfigureCall
  0.00%  2.0800us         2  1.0400us     776ns  1.3040us  cuDeviceGet
