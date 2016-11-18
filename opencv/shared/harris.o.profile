==6758== NVPROF is profiling process 6758, command: ./harris.o
==6758== Profiling application: ./harris.o
==6758== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.77%  103.49us        24  4.3120us     576ns  80.864us  [CUDA memcpy HtoD]
 33.86%  97.984us        19  5.1570us     320ns  83.648us  [CUDA memcpy DtoH]
 27.27%  78.911us         1  78.911us  78.911us  78.911us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, HarrisIntensityFunctor)
  3.10%  8.9590us         3  2.9860us  1.4710us  4.3200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6758== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.73%  967.00ms         8  120.88ms  6.4450us  958.72ms  cudaMalloc
  3.79%  38.710ms         1  38.710ms  38.710ms  38.710ms  cudaGetDeviceProperties
  1.07%  10.898ms        90  121.09us     105ns  4.5523ms  cuDeviceGetAttribute
  0.22%  2.2129ms         1  2.2129ms  2.2129ms  2.2129ms  cuDeviceGetName
  0.08%  777.65us         3  259.22us  10.811us  463.93us  cudaFree
  0.04%  379.17us         1  379.17us  379.17us  379.17us  cuDeviceTotalMem
  0.04%  360.76us         6  60.126us  4.2160us  247.61us  cudaMemcpy
  0.03%  295.95us        37  7.9980us  1.9860us  58.116us  cudaMemcpyAsync
  0.01%  78.175us         4  19.543us  8.1520us  25.798us  cudaLaunch
  0.00%  23.971us        12  1.9970us  1.4730us  4.4320us  cudaFuncGetAttributes
  0.00%  5.1380us         9     570ns     212ns  1.8380us  cudaGetDevice
  0.00%  4.7070us         7     672ns     117ns  3.3890us  cudaSetupArgument
  0.00%  4.1610us         3  1.3870us     853ns  1.6710us  cudaEventCreateWithFlags
  0.00%  3.3370us         3  1.1120us     695ns  1.3310us  cudaEventRecord
  0.00%  3.1770us        11     288ns     208ns     806ns  cudaDeviceGetAttribute
  0.00%  2.7810us         3     927ns     640ns  1.0840us  cudaEventDestroy
  0.00%  2.7000us         4     675ns     196ns     891ns  cudaConfigureCall
  0.00%  1.7270us         2     863ns     236ns  1.4910us  cuDeviceGetCount
  0.00%     547ns         2     273ns     191ns     356ns  cuDeviceGet
