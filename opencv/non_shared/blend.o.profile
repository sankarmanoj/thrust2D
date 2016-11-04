==3329== NVPROF is profiling process 3329, command: ./blend.o
==3329== Profiling application: ./blend.o
==3329== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.46%  168.20us         5  33.640us  1.2160us  84.421us  [CUDA memcpy HtoD]
 27.12%  82.246us         1  82.246us  82.246us  82.246us  [CUDA memcpy DtoH]
 13.52%  40.994us         1  40.994us  40.994us  40.994us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.90%  11.840us         3  3.9460us  3.0400us  4.7360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3329== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.18%  346.69ms         6  57.782ms  8.0250us  345.69ms  cudaMalloc
  0.37%  1.2778ms         3  425.92us  18.207us  1.1660ms  cudaFree
  0.12%  413.24us        90  4.5910us     149ns  162.45us  cuDeviceGetAttribute
  0.10%  356.71us         2  178.36us  175.82us  180.89us  cudaMemcpyAsync
  0.10%  336.74us         4  84.185us  9.2390us  289.88us  cudaMemcpy
  0.06%  223.22us         1  223.22us  223.22us  223.22us  cuDeviceTotalMem
  0.03%  110.51us         4  27.628us  18.035us  42.732us  cudaLaunch
  0.01%  49.857us        16  3.1160us  2.2480us  6.5450us  cudaFuncGetAttributes
  0.01%  41.989us         1  41.989us  41.989us  41.989us  cuDeviceGetName
  0.00%  10.950us        12     912ns     347ns  2.4200us  cudaGetDevice
  0.00%  9.5170us         4  2.3790us  1.5140us  3.1560us  cudaEventCreateWithFlags
  0.00%  8.0420us         4  2.0100us  1.5790us  2.6120us  cudaEventRecord
  0.00%  7.7970us         4  1.9490us     356ns  5.6660us  cudaSetupArgument
  0.00%  5.5560us         4  1.3890us  1.0830us  1.7100us  cudaEventDestroy
  0.00%  5.3180us        11     483ns     284ns  1.1920us  cudaDeviceGetAttribute
  0.00%  3.8340us         4     958ns     456ns  1.4380us  cudaConfigureCall
  0.00%  2.0920us         2  1.0460us     523ns  1.5690us  cuDeviceGetCount
  0.00%     616ns         2     308ns     229ns     387ns  cuDeviceGet
