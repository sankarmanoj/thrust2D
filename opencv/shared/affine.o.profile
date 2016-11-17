==9429== NVPROF is profiling process 9429, command: ./affine.o
==9429== Profiling application: ./affine.o
==9429== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.08%  94.112us        11  8.5550us     640ns  82.336us  [CUDA memcpy HtoD]
 30.71%  82.400us         1  82.400us  82.400us  82.400us  [CUDA memcpy DtoH]
 29.38%  78.816us         1  78.816us  78.816us  78.816us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
  4.83%  12.960us         3  4.3200us  1.5040us  5.9200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9429== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.70%  1.40640s         7  200.91ms  8.0860us  1.39441s  cudaMalloc
  2.26%  33.272ms         1  33.272ms  33.272ms  33.272ms  cudaGetDeviceProperties
  1.25%  18.299ms        90  203.32us     102ns  8.8074ms  cuDeviceGetAttribute
  0.55%  8.1145ms         3  2.7048ms  25.364us  5.3971ms  cudaFree
  0.13%  1.8908ms         5  378.16us  8.7290us  952.70us  cudaMemcpy
  0.06%  860.00us         1  860.00us  860.00us  860.00us  cuDeviceTotalMem
  0.02%  328.57us         1  328.57us  328.57us  328.57us  cuDeviceGetName
  0.01%  137.74us         1  137.74us  137.74us  137.74us  cudaDeviceSynchronize
  0.01%  114.65us         4  28.661us  21.953us  39.502us  cudaLaunch
  0.01%  90.602us         7  12.943us  2.9910us  70.538us  cudaMemcpyAsync
  0.00%  37.935us        12  3.1610us  1.4470us  8.2310us  cudaFuncGetAttributes
  0.00%  8.3410us         9     926ns     211ns  2.8740us  cudaGetDevice
  0.00%  7.9560us         3  2.6520us  1.8550us  3.8490us  cudaEventCreateWithFlags
  0.00%  5.4150us         6     902ns     121ns  3.5670us  cudaSetupArgument
  0.00%  5.1050us         3  1.7010us  1.2630us  1.9920us  cudaEventRecord
  0.00%  4.6300us         3  1.5430us  1.2440us  1.8010us  cudaEventDestroy
  0.00%  3.8710us        11     351ns     216ns  1.2310us  cudaDeviceGetAttribute
  0.00%  3.6870us         4     921ns     759ns  1.0640us  cudaConfigureCall
  0.00%  1.7150us         2     857ns     343ns  1.3720us  cuDeviceGetCount
  0.00%     405ns         2     202ns     145ns     260ns  cuDeviceGet
