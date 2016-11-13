==10244== NVPROF is profiling process 10244, command: ./affine.o
==10244== Profiling application: ./affine.o
==10244== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 62.91%  183.27us         1  183.27us  183.27us  183.27us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 29.93%  87.199us         3  29.066us  23.180us  40.523us  [CUDA memcpy HtoD]
  7.16%  20.864us         2  10.432us  9.0560us  11.808us  [CUDA memset]

==10244== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 68.99%  134.43ms         6  22.405ms  5.4890us  134.33ms  cudaMallocManaged
 29.79%  58.041ms        12  4.8367ms  1.3380us  58.006ms  cudaDeviceSynchronize
  0.50%  969.03us         1  969.03us  969.03us  969.03us  cuDeviceTotalMem
  0.37%  727.99us        90  8.0880us     345ns  284.73us  cuDeviceGetAttribute
  0.17%  340.58us         3  113.53us  16.783us  274.51us  cudaMemPrefetchAsync
  0.06%  107.63us         2  53.816us  45.460us  62.173us  cudaMemset
  0.05%  95.723us         3  31.907us  25.505us  44.702us  cudaMemcpy
  0.04%  87.060us         1  87.060us  87.060us  87.060us  cuDeviceGetName
  0.02%  34.601us         1  34.601us  34.601us  34.601us  cudaLaunch
  0.00%  6.7990us         2  3.3990us  3.1740us  3.6250us  cuDeviceGetCount
  0.00%  6.4550us         4  1.6130us  1.3350us  2.4160us  cudaFuncGetAttributes
  0.00%  3.1200us         1  3.1200us  3.1200us  3.1200us  cudaEventRecord
  0.00%  2.7940us        11     254ns     196ns     645ns  cudaDeviceGetAttribute
  0.00%  2.4560us         1  2.4560us  2.4560us  2.4560us  cudaSetupArgument
  0.00%  1.9000us         2     950ns     886ns  1.0140us  cuDeviceGet
  0.00%  1.7350us         1  1.7350us  1.7350us  1.7350us  cudaEventCreateWithFlags
  0.00%  1.1380us         3     379ns     209ns     697ns  cudaGetDevice
  0.00%     941ns         1     941ns     941ns     941ns  cudaEventDestroy
  0.00%     885ns         1     885ns     885ns     885ns  cudaConfigureCall
