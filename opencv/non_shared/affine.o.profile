==6531== NVPROF is profiling process 6531, command: ./affine.o
==6531== Profiling application: ./affine.o
==6531== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.11%  362.62us         2  181.31us  92.128us  270.50us  [CUDA memset]
 48.36%  343.07us         1  343.07us  343.07us  343.07us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.53%  3.7440us         3  1.2480us  1.2160us  1.3120us  [CUDA memcpy HtoD]

==6531== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.07%  166.19ms         3  55.396ms  8.9400us  166.11ms  cudaMallocManaged
  0.51%  872.24us         1  872.24us  872.24us  872.24us  cuDeviceTotalMem
  0.42%  706.00us        90  7.8440us     509ns  265.90us  cuDeviceGetAttribute
  0.37%  628.53us         2  314.26us  139.67us  488.86us  cudaMemset
  0.23%  391.86us         3  130.62us  4.7280us  381.15us  cudaMalloc
  0.22%  377.21us         7  53.887us  1.9560us  344.04us  cudaDeviceSynchronize
  0.11%  188.24us         1  188.24us  188.24us  188.24us  cudaLaunch
  0.04%  68.278us         1  68.278us  68.278us  68.278us  cuDeviceGetName
  0.01%  20.020us         3  6.6730us  4.9050us  9.0770us  cudaMemcpy
  0.00%  6.3870us         4  1.5960us  1.3350us  2.3390us  cudaFuncGetAttributes
  0.00%  4.3850us         2  2.1920us     965ns  3.4200us  cuDeviceGetCount
  0.00%  3.0240us        11     274ns     195ns     897ns  cudaDeviceGetAttribute
  0.00%  2.0520us         1  2.0520us  2.0520us  2.0520us  cudaSetupArgument
  0.00%  2.0350us         1  2.0350us  2.0350us  2.0350us  cudaEventCreateWithFlags
  0.00%  1.4700us         1  1.4700us  1.4700us  1.4700us  cudaEventRecord
  0.00%  1.4290us         2     714ns     573ns     856ns  cuDeviceGet
  0.00%  1.3240us         3     441ns     228ns     842ns  cudaGetDevice
  0.00%     911ns         1     911ns     911ns     911ns  cudaEventDestroy
  0.00%     723ns         1     723ns     723ns     723ns  cudaConfigureCall
