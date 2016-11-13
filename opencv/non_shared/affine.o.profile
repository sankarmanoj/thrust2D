==11359== NVPROF is profiling process 11359, command: ./affine.o
==11359== Profiling application: ./affine.o
==11359== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.40%  170.12us         1  170.12us  170.12us  170.12us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 34.39%  100.17us         3  33.389us  30.561us  38.862us  [CUDA memcpy HtoD]
  7.21%  20.990us         2  10.495us  9.0870us  11.903us  [CUDA memset]

==11359== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.16%  135.58ms         6  22.596ms  5.3400us  135.47ms  cudaMallocManaged
  0.54%  749.90us         1  749.90us  749.90us  749.90us  cuDeviceTotalMem
  0.54%  749.66us        90  8.3290us     534ns  248.56us  cuDeviceGetAttribute
  0.26%  358.95us         3  119.65us  30.209us  280.25us  cudaMemPrefetchAsync
  0.17%  230.88us         2  115.44us  66.474us  164.40us  cudaMemset
  0.16%  217.16us         4  54.291us  2.2030us  208.70us  cudaDeviceSynchronize
  0.08%  108.89us         3  36.295us  32.573us  43.337us  cudaMemcpy
  0.04%  61.033us         1  61.033us  61.033us  61.033us  cuDeviceGetName
  0.03%  40.884us         1  40.884us  40.884us  40.884us  cudaLaunch
  0.00%  6.3550us         4  1.5880us  1.3400us  2.2710us  cudaFuncGetAttributes
  0.00%  4.5160us         2  2.2580us     920ns  3.5960us  cuDeviceGetCount
  0.00%  2.8150us         1  2.8150us  2.8150us  2.8150us  cudaEventCreateWithFlags
  0.00%  2.7420us        11     249ns     196ns     602ns  cudaDeviceGetAttribute
  0.00%  2.4470us         1  2.4470us  2.4470us  2.4470us  cudaSetupArgument
  0.00%  1.5990us         2     799ns     599ns  1.0000us  cuDeviceGet
  0.00%  1.4290us         1  1.4290us  1.4290us  1.4290us  cudaEventRecord
  0.00%  1.1510us         3     383ns     220ns     670ns  cudaGetDevice
  0.00%     954ns         1     954ns     954ns     954ns  cudaEventDestroy
  0.00%     662ns         1     662ns     662ns     662ns  cudaConfigureCall
