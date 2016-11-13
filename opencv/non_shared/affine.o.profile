==7809== NVPROF is profiling process 7809, command: ./affine.o
==7809== Profiling application: ./affine.o
==7809== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.84%  77.288us         5  15.457us  1.2160us  72.423us  [CUDA memcpy HtoD]
 32.38%  73.959us         1  73.959us  73.959us  73.959us  [CUDA memcpy DtoH]
 25.11%  57.350us         1  57.350us  57.350us  57.350us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.67%  19.810us         2  9.9050us  8.9930us  10.817us  [CUDA memset]

==7809== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.87%  161.08ms         6  26.846ms  3.8920us  160.70ms  cudaMalloc
  0.41%  672.69us        90  7.4740us     438ns  264.32us  cuDeviceGetAttribute
  0.41%  659.98us         1  659.98us  659.98us  659.98us  cuDeviceTotalMem
  0.15%  246.28us         6  41.046us  2.9740us  178.04us  cudaMemcpy
  0.08%  127.63us         7  18.232us  7.6610us  55.684us  cudaDeviceSynchronize
  0.05%  79.844us         1  79.844us  79.844us  79.844us  cuDeviceGetName
  0.01%  24.148us         2  12.074us  9.6560us  14.492us  cudaMemset
  0.01%  12.383us         1  12.383us  12.383us  12.383us  cudaLaunch
  0.00%  6.9390us         4  1.7340us  1.4120us  2.6770us  cudaFuncGetAttributes
  0.00%  4.9020us         2  2.4510us  2.1570us  2.7450us  cuDeviceGetCount
  0.00%  3.0430us        11     276ns     203ns     843ns  cudaDeviceGetAttribute
  0.00%  2.2170us         1  2.2170us  2.2170us  2.2170us  cudaSetupArgument
  0.00%  1.5760us         2     788ns     734ns     842ns  cuDeviceGet
  0.00%  1.4770us         1  1.4770us  1.4770us  1.4770us  cudaEventRecord
  0.00%  1.3150us         3     438ns     214ns     863ns  cudaGetDevice
  0.00%  1.2660us         1  1.2660us  1.2660us  1.2660us  cudaEventCreateWithFlags
  0.00%  1.0070us         1  1.0070us  1.0070us  1.0070us  cudaEventDestroy
  0.00%     562ns         1     562ns     562ns     562ns  cudaConfigureCall
