==12710== NVPROF is profiling process 12710, command: ./pyrdown.o
==12710== Profiling application: ./pyrdown.o
==12710== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 76.80%  1.5841ms        19  83.372us     320ns  1.5753ms  [CUDA memcpy DtoH]
 13.85%  285.59us         1  285.59us  285.59us  285.59us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  5.91%  121.95us        26  4.6900us     544ns  107.52us  [CUDA memcpy HtoD]
  2.17%  44.798us         4  11.199us  1.6320us  19.391us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.12%  23.135us         1  23.135us  23.135us  23.135us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.14%  2.9760us         1  2.9760us  2.9760us  2.9760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12710== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.12%  406.07ms        12  33.839ms  4.0030us  405.42ms  cudaMalloc
  0.55%  2.2580ms         8  282.26us  3.1620us  2.1657ms  cudaMemcpy
  0.07%  292.39us        37  7.9020us  1.9220us  113.78us  cudaMemcpyAsync
  0.05%  210.87us         5  42.173us  6.5560us  116.48us  cudaFree
  0.05%  206.53us        90  2.2940us     146ns  76.298us  cuDeviceGetAttribute
  0.04%  173.43us         1  173.43us  173.43us  173.43us  cuDeviceTotalMem
  0.03%  141.78us         1  141.78us  141.78us  141.78us  cudaGetDeviceProperties
  0.03%  108.75us         7  15.536us  8.4430us  33.647us  cudaLaunch
  0.02%  82.685us         1  82.685us  82.685us  82.685us  cudaDeviceSynchronize
  0.01%  45.152us         1  45.152us  45.152us  45.152us  cuDeviceGetName
  0.01%  42.955us        24  1.7890us  1.3570us  4.5370us  cudaFuncGetAttributes
  0.00%  12.155us        11  1.1050us     205ns  9.1040us  cudaDeviceGetAttribute
  0.00%  8.2840us        18     460ns     202ns  1.8080us  cudaGetDevice
  0.00%  7.4190us         6  1.2360us     903ns  2.1670us  cudaEventCreateWithFlags
  0.00%  5.6210us         6     936ns     669ns  1.6120us  cudaEventRecord
  0.00%  4.6630us         6     777ns     609ns  1.0150us  cudaEventDestroy
  0.00%  4.6420us        10     464ns     104ns  2.6040us  cudaSetupArgument
  0.00%  2.8120us         7     401ns     218ns     923ns  cudaConfigureCall
  0.00%  1.8560us         2     928ns     556ns  1.3000us  cuDeviceGetCount
  0.00%     631ns         2     315ns     242ns     389ns  cuDeviceGet
