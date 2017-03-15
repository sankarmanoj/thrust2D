==10248== NVPROF is profiling process 10248, command: ./dilate.o
==10248== Profiling application: ./dilate.o
==10248== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 42.56%  56.195us         6  9.3650us     544ns  32.193us  [CUDA memcpy HtoD]
 35.24%  46.530us         1  46.530us  46.530us  46.530us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.20%  29.314us         1  29.314us  29.314us  29.314us  [CUDA memcpy DtoH]

==10248== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 92.83%  225.07ms         4  56.268ms  3.1890us  225.06ms  cudaMallocPitch
  6.11%  14.823ms        90  164.69us     100ns  6.1863ms  cuDeviceGetAttribute
  0.55%  1.3446ms         1  1.3446ms  1.3446ms  1.3446ms  cuDeviceGetName
  0.21%  503.09us         1  503.09us  503.09us  503.09us  cuDeviceTotalMem
  0.15%  367.01us         4  91.753us  3.5380us  355.80us  cudaMalloc
  0.10%  237.93us         3  79.308us  37.719us  141.69us  cudaMemcpy2D
  0.01%  34.286us         4  8.5710us  3.0370us  24.171us  cudaMemcpy
  0.01%  31.015us         1  31.015us  31.015us  31.015us  cudaLaunch
  0.00%  8.7700us         4  2.1920us  1.3860us  4.5280us  cudaFuncGetAttributes
  0.00%  7.3970us        11     672ns     204ns  1.8500us  cudaDeviceGetAttribute
  0.00%  5.8460us         2  2.9230us  2.2200us  3.6260us  cuDeviceGetCount
  0.00%  4.7760us         3  1.5920us     220ns  4.2870us  cudaGetDevice
  0.00%  1.9180us         1  1.9180us  1.9180us  1.9180us  cudaEventCreateWithFlags
  0.00%  1.8660us         1  1.8660us  1.8660us  1.8660us  cudaSetupArgument
  0.00%  1.7420us         1  1.7420us  1.7420us  1.7420us  cudaEventRecord
  0.00%  1.3040us         2     652ns     431ns     873ns  cuDeviceGet
  0.00%  1.1680us         1  1.1680us  1.1680us  1.1680us  cudaConfigureCall
  0.00%  1.0840us         1  1.0840us  1.0840us  1.0840us  cudaEventDestroy
