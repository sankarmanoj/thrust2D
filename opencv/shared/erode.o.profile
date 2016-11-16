==12683== NVPROF is profiling process 12683, command: ./erode.o
==12683== Profiling application: ./erode.o
==12683== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.82%  111.58us         6  18.596us     544ns  108.64us  [CUDA memcpy HtoD]
 37.76%  100.77us         1  100.77us  100.77us  100.77us  [CUDA memcpy DtoH]
 16.00%  42.686us         1  42.686us  42.686us  42.686us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
  3.27%  8.7360us         2  4.3680us  4.2880us  4.4480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.15%  3.0720us         1  3.0720us  3.0720us  3.0720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12683== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.37%  376.29ms         8  47.036ms  4.5190us  375.84ms  cudaMalloc
  0.65%  2.4846ms         3  828.20us  27.855us  2.2475ms  cudaFree
  0.50%  1.9242ms         1  1.9242ms  1.9242ms  1.9242ms  cuDeviceGetName
  0.18%  691.86us         6  115.31us  6.2780us  530.01us  cudaMemcpy
  0.11%  431.57us        90  4.7950us     132ns  194.39us  cuDeviceGetAttribute
  0.06%  240.47us         1  240.47us  240.47us  240.47us  cuDeviceTotalMem
  0.05%  192.31us         1  192.31us  192.31us  192.31us  cudaGetDeviceProperties
  0.04%  162.99us         1  162.99us  162.99us  162.99us  cudaMemcpyAsync
  0.02%  61.063us         4  15.265us  9.9460us  24.453us  cudaLaunch
  0.01%  35.204us        12  2.9330us  1.3990us  11.723us  cudaFuncGetAttributes
  0.00%  5.1560us         9     572ns     203ns  1.9070us  cudaGetDevice
  0.00%  4.1400us         3  1.3800us  1.0120us  1.7550us  cudaEventCreateWithFlags
  0.00%  3.8740us         7     553ns     104ns  2.6140us  cudaSetupArgument
  0.00%  3.3230us        11     302ns     200ns     862ns  cudaDeviceGetAttribute
  0.00%  3.1200us         3  1.0400us     774ns  1.4660us  cudaEventRecord
  0.00%  2.7380us         3     912ns     752ns  1.1140us  cudaEventDestroy
  0.00%  2.5020us         2  1.2510us     347ns  2.1550us  cuDeviceGetCount
  0.00%  2.0170us         4     504ns     325ns     885ns  cudaConfigureCall
  0.00%     718ns         2     359ns     236ns     482ns  cuDeviceGet
