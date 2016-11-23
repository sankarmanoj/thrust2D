==23079== NVPROF is profiling process 23079, command: ./pyrup.o
==23079== Profiling application: ./pyrup.o
==23079== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.94%  88.704us         1  88.704us  88.704us  88.704us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 27.82%  48.449us        25  1.9370us  1.1840us  19.265us  [CUDA memcpy HtoD]
 11.48%  20.000us        19  1.0520us     320ns  5.1200us  [CUDA memcpy DtoH]
  6.27%  10.913us         5  2.1820us  1.4090us  3.0720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.57%  4.4800us         1  4.4800us  4.4800us  4.4800us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.92%  1.6000us         1  1.6000us  1.6000us  1.6000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==23079== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.21%  248.29ms        12  20.691ms  4.7610us  247.53ms  cudaMalloc
  0.23%  573.96us         1  573.96us  573.96us  573.96us  cuDeviceTotalMem
  0.23%  564.52us        90  6.2720us     357ns  214.95us  cuDeviceGetAttribute
  0.11%  286.39us        37  7.7400us  2.2550us  15.365us  cudaMemcpyAsync
  0.08%  191.00us         6  31.833us  4.7560us  96.391us  cudaFree
  0.06%  141.57us         7  20.224us  4.7880us  103.34us  cudaMemcpy
  0.03%  78.922us         8  9.8650us  5.7890us  23.740us  cudaLaunch
  0.02%  55.199us        32  1.7240us  1.4070us  7.4030us  cudaFuncGetAttributes
  0.02%  50.570us         1  50.570us  50.570us  50.570us  cuDeviceGetName
  0.00%  8.2880us        24     345ns     214ns  1.3970us  cudaGetDevice
  0.00%  7.0370us         8     879ns     592ns  1.6670us  cudaEventCreateWithFlags
  0.00%  6.1630us         8     770ns     555ns  1.5090us  cudaEventRecord
  0.00%  6.1240us         8     765ns     159ns  4.2330us  cudaSetupArgument
  0.00%  4.9730us         8     621ns     457ns  1.0500us  cudaEventDestroy
  0.00%  3.3350us        11     303ns     213ns     982ns  cudaDeviceGetAttribute
  0.00%  3.1660us         2  1.5830us     614ns  2.5520us  cuDeviceGetCount
  0.00%  2.6710us         8     333ns     187ns     923ns  cudaConfigureCall
  0.00%  1.0320us         2     516ns     395ns     637ns  cuDeviceGet
