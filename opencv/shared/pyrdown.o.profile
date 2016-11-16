==12977== NVPROF is profiling process 12977, command: ./pyrdown.o
==12977== Profiling application: ./pyrdown.o
==12977== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.78%  653.39us        19  34.388us     320ns  639.31us  [CUDA memcpy DtoH]
 25.24%  280.60us         1  280.60us  280.60us  280.60us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  9.82%  109.18us        26  4.1990us     576ns  81.245us  [CUDA memcpy HtoD]
  3.85%  42.846us         4  10.711us  1.5680us  19.807us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.98%  22.047us         1  22.047us  22.047us  22.047us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.32%  3.5840us         1  3.5840us  3.5840us  3.5840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12977== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.28%  705.14ms        12  58.761ms  5.3250us  692.69ms  cudaMalloc
  1.70%  12.448ms        90  138.31us     101ns  5.9571ms  cuDeviceGetAttribute
  1.07%  7.8116ms         5  1.5623ms  6.8230us  7.3802ms  cudaFree
  0.30%  2.1608ms         1  2.1608ms  2.1608ms  2.1608ms  cuDeviceGetName
  0.22%  1.6323ms         1  1.6323ms  1.6323ms  1.6323ms  cudaGetDeviceProperties
  0.18%  1.3342ms         8  166.78us  3.8270us  1.2103ms  cudaMemcpy
  0.12%  912.67us        37  24.666us  3.7410us  577.85us  cudaMemcpyAsync
  0.09%  626.17us         1  626.17us  626.17us  626.17us  cuDeviceTotalMem
  0.02%  133.75us         7  19.107us  7.8010us  26.856us  cudaLaunch
  0.01%  62.339us         1  62.339us  62.339us  62.339us  cudaDeviceSynchronize
  0.01%  52.689us        24  2.1950us  1.4020us  5.4190us  cudaFuncGetAttributes
  0.00%  11.650us        18     647ns     215ns  2.0170us  cudaGetDevice
  0.00%  10.133us         6  1.6880us     696ns  2.4910us  cudaEventCreateWithFlags
  0.00%  7.8560us         6  1.3090us     597ns  1.8940us  cudaEventDestroy
  0.00%  7.7110us         6  1.2850us     732ns  1.7660us  cudaEventRecord
  0.00%  7.1640us        10     716ns     115ns  4.5320us  cudaSetupArgument
  0.00%  5.1920us        11     472ns     358ns  1.1020us  cudaDeviceGetAttribute
  0.00%  4.9470us         7     706ns     223ns  1.1410us  cudaConfigureCall
  0.00%  1.9880us         2     994ns     378ns  1.6100us  cuDeviceGetCount
  0.00%     419ns         2     209ns     171ns     248ns  cuDeviceGet
