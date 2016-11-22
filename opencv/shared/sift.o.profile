==25324== NVPROF is profiling process 25324, command: ./sift.o
==25324== Profiling application: ./sift.o
==25324== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 76.25%  542.25us         1  542.25us  542.25us  542.25us  void thrust::transform_kernel<unsigned char, siftTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
 17.85%  126.95us        12  10.578us  1.1840us  83.970us  [CUDA memcpy HtoD]
  2.95%  20.992us         7  2.9980us  1.4080us  5.5360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.95%  20.960us         1  20.960us  20.960us  20.960us  [CUDA memcpy DtoH]

==25324== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.38%  179.38ms        16  11.211ms  4.5770us  178.20ms  cudaMalloc
  2.21%  4.1191ms        90  45.767us     104ns  2.4611ms  cuDeviceGetAttribute
  0.63%  1.1663ms         2  583.13us  222.63us  943.62us  cudaGetDeviceProperties
  0.29%  547.64us         1  547.64us  547.64us  547.64us  cudaDeviceSynchronize
  0.14%  259.58us         7  37.082us  4.1480us  98.114us  cudaFree
  0.13%  232.70us         1  232.70us  232.70us  232.70us  cuDeviceTotalMem
  0.06%  117.01us         3  39.003us  9.1980us  83.643us  cudaMemcpyAsync
  0.06%  109.53us        10  10.952us  4.2050us  57.430us  cudaMemcpy
  0.03%  61.535us         8  7.6910us  5.0700us  13.107us  cudaLaunch
  0.02%  45.037us         1  45.037us  45.037us  45.037us  cuDeviceGetName
  0.02%  43.565us        28  1.5550us  1.4020us  2.9640us  cudaFuncGetAttributes
  0.00%  7.2570us        21     345ns     211ns  1.3760us  cudaGetDevice
  0.00%  6.1660us         7     880ns     592ns  1.4850us  cudaEventCreateWithFlags
  0.00%  5.1820us         7     740ns     542ns  1.3430us  cudaEventRecord
  0.00%  4.2640us         7     609ns     476ns     975ns  cudaEventDestroy
  0.00%  3.4890us        11     317ns     216ns     850ns  cudaDeviceGetAttribute
  0.00%  2.5340us         8     316ns     195ns     816ns  cudaConfigureCall
  0.00%  2.4060us        11     218ns     119ns     333ns  cudaSetupArgument
  0.00%  1.7380us         2     869ns     357ns  1.3810us  cuDeviceGetCount
  0.00%     449ns         2     224ns     173ns     276ns  cuDeviceGet
