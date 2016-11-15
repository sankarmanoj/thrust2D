==7137== NVPROF is profiling process 7137, command: ./pyrup.o
==7137== Profiling application: ./pyrup.o
==7137== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 61.06%  600.19us         1  600.19us  600.19us  600.19us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 24.94%  245.19us        56  4.3780us     544ns  214.27us  [CUDA memcpy HtoD]
 11.65%  114.53us        51  2.2450us     320ns  89.152us  [CUDA memcpy DtoH]
  1.05%  10.368us         4  2.5920us  1.3440us  3.7440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.51%  5.0240us         1  5.0240us  5.0240us  5.0240us  [CUDA memcpy DtoD]
  0.49%  4.8320us         1  4.8320us  4.8320us  4.8320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.29%  2.8160us         1  2.8160us  2.8160us  2.8160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7137== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.05%  765.71ms        10  76.571ms  7.5480us  757.49ms  cudaMalloc
  1.05%  8.2127ms         1  8.2127ms  8.2127ms  8.2127ms  cudaGetDeviceProperties
  0.28%  2.2082ms       101  21.862us  3.1380us  988.21us  cudaMemcpyAsync
  0.17%  1.3206ms         7  188.65us  8.8420us  818.10us  cudaMemcpy
  0.15%  1.1526ms        90  12.806us     136ns  669.44us  cuDeviceGetAttribute
  0.09%  677.36us         4  169.34us  35.849us  478.96us  cudaFree
  0.08%  658.31us         2  329.15us  13.884us  644.42us  cudaDeviceSynchronize
  0.04%  296.37us         7  42.339us  10.741us  61.217us  cudaLaunch
  0.03%  263.87us         1  263.87us  263.87us  263.87us  cuDeviceTotalMem
  0.02%  182.46us         1  182.46us  182.46us  182.46us  cuDeviceGetName
  0.01%  107.41us        25  4.2960us  2.1220us  12.334us  cudaFuncGetAttributes
  0.00%  26.504us        19  1.3940us     305ns  4.5080us  cudaGetDevice
  0.00%  20.230us         6  3.3710us  1.1580us  5.3740us  cudaEventCreateWithFlags
  0.00%  16.712us         6  2.7850us     995ns  4.2060us  cudaEventRecord
  0.00%  15.336us        15  1.0220us     347ns  6.1190us  cudaDeviceGetAttribute
  0.00%  15.279us        11  1.3890us     162ns  6.8670us  cudaSetupArgument
  0.00%  12.921us         2  6.4600us  3.4000us  9.5210us  cuDeviceGetCount
  0.00%  12.884us         6  2.1470us     936ns  3.4100us  cudaEventDestroy
  0.00%  10.002us         7  1.4280us     300ns  3.2220us  cudaConfigureCall
  0.00%  2.8300us         1  2.8300us  2.8300us  2.8300us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  2.4160us         2  1.2080us     579ns  1.8370us  cuDeviceGet
  0.00%     860ns         1     860ns     860ns     860ns  cudaGetLastError
