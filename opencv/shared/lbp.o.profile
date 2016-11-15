==7141== NVPROF is profiling process 7141, command: ./lbp.o
==7141== Profiling application: ./lbp.o
==7141== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.58%  188.86us         1  188.86us  188.86us  188.86us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, lbpFunctor)
 27.82%  120.58us         1  120.58us  120.58us  120.58us  [CUDA memcpy DtoH]
 25.96%  112.51us         6  18.752us     544ns  109.50us  [CUDA memcpy HtoD]
  2.01%  8.7040us         2  4.3520us  3.8400us  4.8640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.63%  2.7520us         1  2.7520us  2.7520us  2.7520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7141== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.79%  748.04ms         8  93.506ms  6.5030us  741.12ms  cudaMalloc
  2.17%  16.802ms         1  16.802ms  16.802ms  16.802ms  cudaGetDeviceProperties
  0.49%  3.7911ms         3  1.2637ms  57.241us  3.1690ms  cudaFree
  0.22%  1.7178ms        90  19.086us     132ns  690.74us  cuDeviceGetAttribute
  0.22%  1.6949ms         6  282.48us  4.9120us  1.1271ms  cudaMemcpy
  0.03%  221.66us         1  221.66us  221.66us  221.66us  cuDeviceTotalMem
  0.03%  213.78us         1  213.78us  213.78us  213.78us  cudaMemcpyAsync
  0.02%  151.49us         4  37.872us  11.937us  53.455us  cudaLaunch
  0.01%  85.758us         1  85.758us  85.758us  85.758us  cuDeviceGetName
  0.01%  45.852us        12  3.8210us  2.2330us  9.0370us  cudaFuncGetAttributes
  0.00%  10.238us         9  1.1370us     333ns  4.6430us  cudaGetDevice
  0.00%  7.8310us         3  2.6100us  1.3380us  3.3900us  cudaEventCreateWithFlags
  0.00%  7.1840us        11     653ns     380ns  1.9190us  cudaDeviceGetAttribute
  0.00%  6.7070us         7     958ns     115ns  4.7610us  cudaSetupArgument
  0.00%  6.0990us         2  3.0490us  2.4800us  3.6190us  cuDeviceGetCount
  0.00%  5.9920us         3  1.9970us  1.1370us  2.6260us  cudaEventRecord
  0.00%  5.0410us         3  1.6800us  1.0600us  2.1780us  cudaEventDestroy
  0.00%  4.9630us         4  1.2400us     390ns  1.9340us  cudaConfigureCall
  0.00%  1.8620us         2     931ns     734ns  1.1280us  cuDeviceGet
  0.00%     332ns         1     332ns     332ns     332ns  cudaGetLastError
