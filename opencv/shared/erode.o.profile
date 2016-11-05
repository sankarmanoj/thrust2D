==6949== NVPROF is profiling process 6949, command: ./erode.o
==6949== Profiling application: ./erode.o
==6949== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.63%  181.32us         1  181.32us  181.32us  181.32us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, erodeFunctor)
 24.76%  88.691us         6  14.781us  1.2160us  82.611us  [CUDA memcpy HtoD]
 20.65%  73.973us         1  73.973us  73.973us  73.973us  [CUDA memcpy DtoH]
  2.80%  10.046us         2  5.0230us  4.8630us  5.1830us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.15%  4.1270us         1  4.1270us  4.1270us  4.1270us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6949== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.39%  496.56ms         8  62.070ms  8.3890us  489.62ms  cudaMalloc
  4.21%  22.891ms        90  254.35us     122ns  13.495ms  cuDeviceGetAttribute
  2.28%  12.410ms         1  12.410ms  12.410ms  12.410ms  cudaGetDeviceProperties
  0.67%  3.6473ms         1  3.6473ms  3.6473ms  3.6473ms  cuDeviceGetName
  0.66%  3.5837ms         3  1.1946ms  36.046us  2.0009ms  cudaFree
  0.34%  1.8641ms         1  1.8641ms  1.8641ms  1.8641ms  cuDeviceTotalMem
  0.28%  1.5364ms         6  256.06us  19.350us  815.18us  cudaMemcpy
  0.09%  465.53us         9  51.725us     216ns  460.99us  cudaGetDevice
  0.03%  182.61us         1  182.61us  182.61us  182.61us  cudaMemcpyAsync
  0.02%  133.93us         4  33.482us  9.4900us  45.253us  cudaLaunch
  0.01%  29.073us        12  2.4220us  1.4250us  7.2600us  cudaFuncGetAttributes
  0.00%  9.1230us         7  1.3030us     118ns  7.5350us  cudaSetupArgument
  0.00%  6.1540us         3  2.0510us  1.0560us  3.1270us  cudaEventCreateWithFlags
  0.00%  5.1650us         3  1.7210us  1.0660us  2.3570us  cudaEventRecord
  0.00%  4.3830us         4  1.0950us     163ns  1.8340us  cudaConfigureCall
  0.00%  3.8160us         2  1.9080us  1.7600us  2.0560us  cuDeviceGetCount
  0.00%  3.6060us        11     327ns     205ns  1.1110us  cudaDeviceGetAttribute
  0.00%  3.5680us         3  1.1890us     687ns  1.6350us  cudaEventDestroy
  0.00%  1.0730us         2     536ns     512ns     561ns  cuDeviceGet
  0.00%     597ns         1     597ns     597ns     597ns  cudaGetLastError
