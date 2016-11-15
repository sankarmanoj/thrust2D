==8587== NVPROF is profiling process 8587, command: ./pyrdown.o
==8587== Profiling application: ./pyrdown.o
==8587== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 66.57%  1.1791ms        19  62.059us     320ns  1.1704ms  [CUDA memcpy DtoH]
 23.17%  410.42us         1  410.42us  410.42us  410.42us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.41%  113.53us        25  4.5410us     544ns  100.06us  [CUDA memcpy HtoD]
  2.47%  43.807us         5  8.7610us  1.3440us  17.568us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.20%  21.215us         1  21.215us  21.215us  21.215us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.18%  3.1040us         1  3.1040us  3.1040us  3.1040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8587== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.54%  219.94ms        12  18.328ms  5.0800us  219.31ms  cudaMalloc
  0.92%  2.0446ms         7  292.08us  5.3460us  1.9948ms  cudaMemcpy
  0.13%  282.54us        37  7.6360us  2.0750us  114.66us  cudaMemcpyAsync
  0.11%  237.69us         6  39.615us  8.3260us  109.68us  cudaFree
  0.10%  229.19us        90  2.5460us      99ns  97.498us  cuDeviceGetAttribute
  0.07%  153.10us         1  153.10us  153.10us  153.10us  cuDeviceTotalMem
  0.04%  86.135us         8  10.766us  6.7790us  14.561us  cudaLaunch
  0.04%  79.560us         1  79.560us  79.560us  79.560us  cudaDeviceSynchronize
  0.03%  57.369us        32  1.7920us  1.3500us  7.7010us  cudaFuncGetAttributes
  0.01%  20.911us         1  20.911us  20.911us  20.911us  cuDeviceGetName
  0.01%  18.590us        24     774ns     202ns  9.6780us  cudaGetDevice
  0.01%  15.033us         8  1.8790us     565ns  10.035us  cudaEventDestroy
  0.00%  7.7810us         8     972ns     636ns  1.4670us  cudaEventCreateWithFlags
  0.00%  7.1320us         8     891ns     686ns  1.5890us  cudaEventRecord
  0.00%  5.0380us         8     629ns     158ns  3.1100us  cudaSetupArgument
  0.00%  3.3120us        11     301ns     200ns     969ns  cudaDeviceGetAttribute
  0.00%  2.9970us         8     374ns     175ns     985ns  cudaConfigureCall
  0.00%  1.1250us         2     562ns     198ns     927ns  cuDeviceGetCount
  0.00%     326ns         2     163ns     136ns     190ns  cuDeviceGet
