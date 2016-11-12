==10519== NVPROF is profiling process 10519, command: ./affine.o
==10519== Profiling application: ./affine.o
==10519== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.01%  114.24us         1  114.24us  114.24us  114.24us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, AffineTransformFunctor)
 30.12%  85.986us        11  7.8160us  1.1520us  73.921us  [CUDA memcpy HtoD]
 26.54%  75.777us         1  75.777us  75.777us  75.777us  [CUDA memcpy DtoH]
  3.33%  9.5040us         3  3.1680us  1.0880us  4.5440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10519== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.64%  526.95ms         7  75.279ms  10.033us  526.39ms  cudaMalloc
  0.08%  398.53us         1  398.53us  398.53us  398.53us  cudaGetDeviceProperties
  0.06%  307.19us        90  3.4130us     124ns  115.98us  cuDeviceGetAttribute
  0.05%  282.62us         5  56.523us  9.1350us  220.14us  cudaMemcpy
  0.04%  206.28us         1  206.28us  206.28us  206.28us  cuDeviceTotalMem
  0.03%  182.02us         3  60.674us  10.034us  142.43us  cudaFree
  0.03%  175.04us         7  25.006us  3.1680us  151.97us  cudaMemcpyAsync
  0.02%  119.02us         1  119.02us  119.02us  119.02us  cudaDeviceSynchronize
  0.02%  105.44us         4  26.359us  18.784us  34.609us  cudaLaunch
  0.01%  42.231us        12  3.5190us  2.1900us  11.095us  cudaFuncGetAttributes
  0.01%  30.742us         1  30.742us  30.742us  30.742us  cuDeviceGetName
  0.00%  8.0920us         6  1.3480us     218ns  6.3130us  cudaSetupArgument
  0.00%  7.4140us         9     823ns     340ns  2.2400us  cudaGetDevice
  0.00%  6.8400us         3  2.2800us  2.1870us  2.3690us  cudaEventCreateWithFlags
  0.00%  5.6350us         3  1.8780us  1.7250us  2.0050us  cudaEventRecord
  0.00%  5.0350us        11     457ns     337ns     995ns  cudaDeviceGetAttribute
  0.00%  4.8410us         3  1.6130us  1.2370us  1.9380us  cudaEventDestroy
  0.00%  3.6410us         4     910ns     630ns  1.1890us  cudaConfigureCall
  0.00%  2.3210us         2  1.1600us     449ns  1.8720us  cuDeviceGetCount
  0.00%     555ns         2     277ns     236ns     319ns  cuDeviceGet
  0.00%     516ns         1     516ns     516ns     516ns  cudaGetLastError
