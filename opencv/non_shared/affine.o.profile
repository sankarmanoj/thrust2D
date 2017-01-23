==7999== NVPROF is profiling process 7999, command: ./affine.o
==7999== Profiling application: ./affine.o
==7999== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.37%  39.968us         1  39.968us  39.968us  39.968us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 28.01%  30.784us         5  6.1560us     608ns  26.624us  [CUDA memcpy HtoD]
 23.18%  25.471us         1  25.471us  25.471us  25.471us  [CUDA memcpy DtoH]
 12.43%  13.664us         2  6.8320us  5.5360us  8.1280us  [CUDA memset]

==7999== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.41%  516.51ms         3  172.17ms  13.239us  516.48ms  cudaMallocPitch
  0.37%  1.9366ms         3  645.52us  5.8310us  1.9198ms  cudaMalloc
  0.09%  445.92us        90  4.9540us     127ns  158.04us  cuDeviceGetAttribute
  0.04%  219.51us         1  219.51us  219.51us  219.51us  cuDeviceTotalMem
  0.03%  178.46us         3  59.487us  12.438us  107.54us  cudaMemcpy2D
  0.02%  80.989us         2  40.494us  34.674us  46.315us  cudaMemset2D
  0.01%  67.889us         3  22.629us  9.5140us  47.942us  cudaMemcpy
  0.01%  42.737us         1  42.737us  42.737us  42.737us  cuDeviceGetName
  0.01%  34.263us         1  34.263us  34.263us  34.263us  cudaDeviceSynchronize
  0.00%  24.882us         1  24.882us  24.882us  24.882us  cudaLaunch
  0.00%  14.094us         4  3.5230us  2.6350us  6.0520us  cudaFuncGetAttributes
  0.00%  5.5000us        11     500ns     262ns  1.0360us  cudaDeviceGetAttribute
  0.00%  5.3480us         1  5.3480us  5.3480us  5.3480us  cudaSetupArgument
  0.00%  3.6570us         1  3.6570us  3.6570us  3.6570us  cudaEventCreateWithFlags
  0.00%  2.8920us         3     964ns     387ns  2.0490us  cudaGetDevice
  0.00%  2.5000us         1  2.5000us  2.5000us  2.5000us  cudaEventRecord
  0.00%  2.4030us         2  1.2010us     408ns  1.9950us  cuDeviceGetCount
  0.00%  1.8080us         1  1.8080us  1.8080us  1.8080us  cudaEventDestroy
  0.00%  1.6570us         1  1.6570us  1.6570us  1.6570us  cudaConfigureCall
  0.00%     709ns         2     354ns     185ns     524ns  cuDeviceGet
