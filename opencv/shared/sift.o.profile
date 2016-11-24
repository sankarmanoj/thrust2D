==6650== NVPROF is profiling process 6650, command: ./sift.o
==6650== Profiling application: ./sift.o
==6650== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.28%  198.93us         1  198.93us  198.93us  198.93us  void thrust::transform_kernel<unsigned char, siftTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
 32.93%  118.49us        12  9.8740us  1.2160us  75.835us  [CUDA memcpy HtoD]
  5.97%  21.470us         7  3.0670us  1.3440us  5.1200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.82%  20.959us         1  20.959us  20.959us  20.959us  [CUDA memcpy DtoH]

==6650== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.83%  153.95ms        16  9.6219ms  4.4910us  152.79ms  cudaMalloc
  0.28%  440.33us         2  220.17us  213.49us  226.84us  cudaGetDeviceProperties
  0.24%  374.47us         7  53.496us  5.9870us  145.57us  cudaFree
  0.16%  247.44us        90  2.7490us     111ns  96.973us  cuDeviceGetAttribute
  0.13%  204.42us         1  204.42us  204.42us  204.42us  cudaDeviceSynchronize
  0.13%  196.55us         1  196.55us  196.55us  196.55us  cuDeviceTotalMem
  0.07%  109.16us        10  10.915us  4.1460us  59.015us  cudaMemcpy
  0.06%  92.979us         3  30.993us  7.5350us  61.353us  cudaMemcpyAsync
  0.04%  61.517us         8  7.6890us  5.1220us  12.944us  cudaLaunch
  0.03%  41.694us        28  1.4890us  1.3350us  3.0190us  cudaFuncGetAttributes
  0.02%  26.447us         1  26.447us  26.447us  26.447us  cuDeviceGetName
  0.00%  7.5170us        21     357ns     201ns  1.4290us  cudaGetDevice
  0.00%  5.5950us         7     799ns     594ns  1.3130us  cudaEventCreateWithFlags
  0.00%  5.0640us         7     723ns     524ns  1.2980us  cudaEventRecord
  0.00%  4.4320us         7     633ns     488ns  1.1300us  cudaEventDestroy
  0.00%  2.9610us        11     269ns     196ns     846ns  cudaDeviceGetAttribute
  0.00%  2.5070us         8     313ns     178ns     913ns  cudaConfigureCall
  0.00%  2.2640us        11     205ns     115ns     304ns  cudaSetupArgument
  0.00%  1.5540us         2     777ns     335ns  1.2190us  cuDeviceGetCount
  0.00%     359ns         2     179ns     169ns     190ns  cuDeviceGet
