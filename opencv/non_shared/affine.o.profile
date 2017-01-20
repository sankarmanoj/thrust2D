==18669== NVPROF is profiling process 18669, command: ./affine.o
==18669== Profiling application: ./affine.o
==18669== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.38%  4.3049ms         1  4.3049ms  4.3049ms  4.3049ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.85%  82.528us         1  82.528us  82.528us  82.528us  [CUDA memcpy DtoH]
  1.16%  52.032us         5  10.406us     896ns  46.048us  [CUDA memcpy HtoD]
  0.60%  26.976us         2  13.488us  12.768us  14.208us  [CUDA memset]

==18669== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.76%  2.65429s         3  884.76ms  16.199us  2.65425s  cudaMallocPitch
  0.16%  4.3059ms         2  2.1530ms  3.0840us  4.3028ms  cudaDeviceSynchronize
  0.02%  608.82us       166  3.6670us     157ns  134.82us  cuDeviceGetAttribute
  0.02%  548.72us         3  182.91us  27.006us  324.81us  cudaMemcpy2D
  0.02%  403.02us         1  403.02us  403.02us  403.02us  cudaLaunch
  0.01%  167.87us         3  55.957us  7.0480us  147.10us  cudaMalloc
  0.00%  74.835us         2  37.417us  35.358us  39.477us  cuDeviceTotalMem
  0.00%  61.878us         2  30.939us  18.287us  43.591us  cudaMemset2D
  0.00%  60.275us         2  30.137us  27.185us  33.090us  cuDeviceGetName
  0.00%  53.211us         3  17.737us  11.754us  28.430us  cudaMemcpy
  0.00%  17.083us         4  4.2700us  2.4100us  9.6930us  cudaFuncGetAttributes
  0.00%  8.9250us         1  8.9250us  8.9250us  8.9250us  cudaSetupArgument
  0.00%  6.4960us        11     590ns     335ns  2.1840us  cudaDeviceGetAttribute
  0.00%  3.9180us         3  1.3060us     379ns  3.0390us  cudaGetDevice
  0.00%  3.2620us         2  1.6310us     535ns  2.7270us  cuDeviceGetCount
  0.00%  3.0530us         1  3.0530us  3.0530us  3.0530us  cudaEventCreateWithFlags
  0.00%  2.7640us         1  2.7640us  2.7640us  2.7640us  cudaEventRecord
  0.00%  2.4390us         1  2.4390us  2.4390us  2.4390us  cudaEventDestroy
  0.00%  1.8350us         1  1.8350us  1.8350us  1.8350us  cudaConfigureCall
  0.00%  1.4680us         4     367ns     198ns     612ns  cuDeviceGet
