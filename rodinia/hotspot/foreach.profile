==30687== NVPROF is profiling process 30687, command: ./hotspot_foreach.out 1024 2 2 temp_1024 power_1024 result_foreach.out
==30687== Profiling application: ./hotspot_foreach.out 1024 2 2 temp_1024 power_1024 result_foreach.out
==30687== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.97%  881.84us         4  220.46us  1.2160us  456.97us  [CUDA memcpy HtoD]
 27.09%  498.12us         1  498.12us  498.12us  498.12us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<HotspotFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.87%  420.46us         1  420.46us  420.46us  420.46us  [CUDA memcpy DtoH]
  2.07%  38.017us         2  19.008us  18.753us  19.264us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30687== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.82%  229.12ms         4  57.281ms  6.0550us  228.42ms  cudaMalloc
  0.47%  1.1007ms         3  366.90us  10.331us  1.0727ms  cudaMemcpy
  0.39%  913.97us         2  456.98us  455.97us  458.00us  cudaMemcpyAsync
  0.10%  226.10us         2  113.05us  77.345us  148.75us  cudaFree
  0.09%  212.73us        90  2.3630us     104ns  81.847us  cuDeviceGetAttribute
  0.08%  178.95us         1  178.95us  178.95us  178.95us  cuDeviceTotalMem
  0.01%  32.908us         3  10.969us  9.4010us  14.094us  cudaLaunch
  0.01%  20.369us         1  20.369us  20.369us  20.369us  cuDeviceGetName
  0.01%  20.302us        12  1.6910us  1.4090us  3.2810us  cudaFuncGetAttributes
  0.00%  5.7460us         4  1.4360us     697ns  2.8850us  cudaEventRecord
  0.00%  4.3360us         9     481ns     201ns  1.5810us  cudaGetDevice
  0.00%  3.4540us         2  1.7270us     747ns  2.7070us  cudaEventCreate
  0.00%  3.3590us         3  1.1190us     844ns  1.5640us  cudaEventCreateWithFlags
  0.00%  3.2650us        11     296ns     203ns  1.0140us  cudaDeviceGetAttribute
  0.00%  2.1190us         3     706ns     598ns     853ns  cudaEventDestroy
  0.00%  1.5480us         2     774ns     136ns  1.4120us  cuDeviceGetCount
  0.00%  1.3470us         3     449ns     258ns     739ns  cudaSetupArgument
  0.00%  1.2760us         3     425ns     247ns     754ns  cudaConfigureCall
  0.00%     275ns         2     137ns      96ns     179ns  cuDeviceGet
