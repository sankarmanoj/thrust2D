==25681== NVPROF is profiling process 25681, command: ./dilate.o
==25681== Profiling application: ./dilate.o
==25681== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.92%  61.985us         1  61.985us  61.985us  61.985us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 23.86%  25.984us         5  5.1960us  1.2160us  21.120us  [CUDA memcpy HtoD]
 19.22%  20.928us         1  20.928us  20.928us  20.928us  [CUDA memcpy DtoH]

==25681== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.33%  181.85ms         4  45.462ms  4.4750us  181.83ms  cudaMallocPitch
  0.27%  502.12us         4  125.53us  5.2080us  485.62us  cudaMalloc
  0.16%  295.92us        90  3.2870us     102ns  117.44us  cuDeviceGetAttribute
  0.10%  189.48us         1  189.48us  189.48us  189.48us  cuDeviceTotalMem
  0.08%  142.51us         2  71.257us  31.474us  111.04us  cudaMemcpy2D
  0.02%  27.771us         1  27.771us  27.771us  27.771us  cuDeviceGetName
  0.01%  25.938us         4  6.4840us  4.2520us  12.017us  cudaMemcpy
  0.01%  15.269us         1  15.269us  15.269us  15.269us  cudaLaunch
  0.01%  11.543us         4  2.8850us  2.5330us  3.8950us  cudaFuncGetAttributes
  0.00%  5.0020us        11     454ns     349ns  1.0450us  cudaDeviceGetAttribute
  0.00%  4.6360us         1  4.6360us  4.6360us  4.6360us  cudaSetupArgument
  0.00%  1.9070us         3     635ns     356ns  1.1270us  cudaGetDevice
  0.00%  1.6880us         1  1.6880us  1.6880us  1.6880us  cudaEventCreateWithFlags
  0.00%  1.6320us         1  1.6320us  1.6320us  1.6320us  cudaEventRecord
  0.00%  1.4490us         2     724ns     204ns  1.2450us  cuDeviceGetCount
  0.00%  1.1900us         1  1.1900us  1.1900us  1.1900us  cudaEventDestroy
  0.00%     922ns         1     922ns     922ns     922ns  cudaConfigureCall
  0.00%     340ns         2     170ns     129ns     211ns  cuDeviceGet
