==8797== NVPROF is profiling process 8797, command: ./pyrup.o
==8797== Profiling application: ./pyrup.o
==8797== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.22%  106.02us         1  106.02us  106.02us  106.02us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 38.48%  101.44us        25  4.0570us     576ns  73.118us  [CUDA memcpy HtoD]
 12.75%  33.600us        19  1.7680us     320ns  18.784us  [CUDA memcpy DtoH]
  5.65%  14.880us         5  2.9760us  1.3760us  4.8640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.99%  5.2470us         1  5.2470us  5.2470us  5.2470us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.91%  2.4000us         1  2.4000us  2.4000us  2.4000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8797== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.34%  330.60ms        12  27.550ms  4.8400us  329.51ms  cudaMalloc
  0.20%  678.90us        90  7.5430us     119ns  311.83us  cuDeviceGetAttribute
  0.12%  409.85us         1  409.85us  409.85us  409.85us  cuDeviceTotalMem
  0.10%  324.05us        37  8.7580us  2.1410us  53.034us  cudaMemcpyAsync
  0.09%  286.74us         6  47.790us  5.3550us  131.63us  cudaFree
  0.08%  280.03us         7  40.004us  4.9630us  239.07us  cudaMemcpy
  0.03%  87.189us         8  10.898us  5.8960us  27.451us  cudaLaunch
  0.02%  52.520us        32  1.6410us  1.4030us  3.8650us  cudaFuncGetAttributes
  0.01%  34.801us         1  34.801us  34.801us  34.801us  cuDeviceGetName
  0.00%  8.5690us        24     357ns     214ns  1.1560us  cudaGetDevice
  0.00%  7.6530us         8     956ns     599ns  1.8320us  cudaEventCreateWithFlags
  0.00%  6.4710us         8     808ns     522ns  1.6970us  cudaEventRecord
  0.00%  5.8310us         8     728ns     196ns  3.7430us  cudaSetupArgument
  0.00%  4.9960us         8     624ns     417ns     939ns  cudaEventDestroy
  0.00%  3.0080us        11     273ns     207ns     741ns  cudaDeviceGetAttribute
  0.00%  2.8120us         8     351ns     195ns     903ns  cudaConfigureCall
  0.00%  2.0620us         2  1.0310us     257ns  1.8050us  cuDeviceGetCount
  0.00%     521ns         2     260ns     178ns     343ns  cuDeviceGet
