==7063== NVPROF is profiling process 7063, command: ./harris.o
==7063== Profiling application: ./harris.o
==7063== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.94%  337.57us        24  14.065us     544ns  324.07us  [CUDA memcpy HtoD]
 33.87%  309.54us        19  16.291us     320ns  300.61us  [CUDA memcpy DtoH]
 28.27%  258.34us         1  258.34us  258.34us  258.34us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, HarrisIntensityFunctor)
  0.91%  8.3200us         3  2.7730us  1.0880us  3.7120us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7063== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.40%  735.78ms         8  91.973ms  6.1690us  735.33ms  cudaMalloc
  0.19%  1.3823ms         6  230.38us  6.2940us  1.2577ms  cudaMemcpy
  0.13%  989.82us        37  26.752us  3.8510us  696.36us  cudaMemcpyAsync
  0.07%  492.81us         3  164.27us  26.345us  305.55us  cudaFree
  0.06%  432.39us        90  4.8040us     130ns  152.78us  cuDeviceGetAttribute
  0.04%  269.10us         4  67.274us  20.543us  102.19us  cudaLaunch
  0.03%  256.99us         1  256.99us  256.99us  256.99us  cudaGetDeviceProperties
  0.03%  241.96us         1  241.96us  241.96us  241.96us  cuDeviceTotalMem
  0.02%  138.45us         1  138.45us  138.45us  138.45us  cuDeviceGetName
  0.01%  67.260us        12  5.6050us  2.2420us  28.973us  cudaFuncGetAttributes
  0.01%  59.691us         3  19.897us  1.9250us  51.805us  cudaEventCreateWithFlags
  0.00%  14.894us         7  2.1270us     158ns  11.355us  cudaSetupArgument
  0.00%  13.444us         3  4.4810us  1.7340us  6.7790us  cudaEventRecord
  0.00%  11.712us         2  5.8560us  5.8400us  5.8720us  cuDeviceGetCount
  0.00%  11.498us         9  1.2770us     339ns  4.1350us  cudaGetDevice
  0.00%  8.8330us         4  2.2080us     410ns  3.7390us  cudaConfigureCall
  0.00%  8.4180us        11     765ns     292ns  3.9090us  cudaDeviceGetAttribute
  0.00%  7.5550us         3  2.5180us     941ns  3.7700us  cudaEventDestroy
  0.00%  1.9400us         2     970ns     700ns  1.2400us  cuDeviceGet
  0.00%     663ns         1     663ns     663ns     663ns  cudaGetLastError
