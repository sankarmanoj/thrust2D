==26351== NVPROF is profiling process 26351, command: ./dilate.o
==26351== Profiling application: ./dilate.o
==26351== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 31.63%  31.648us         6  5.2740us  1.2160us  25.568us  [CUDA memcpy HtoD]
 30.92%  30.945us         1  30.945us  30.945us  30.945us  [CUDA memcpy DtoH]
 26.57%  26.592us         1  26.592us  26.592us  26.592us  void thrust::transform_texture_kernel<unsigned char, dilateFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, dilateFunctor)
  8.67%  8.6730us         3  2.8910us  2.2400us  4.1920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.21%  2.2080us         1  2.2080us  2.2080us  2.2080us  [CUDA memcpy DtoD]

==26351== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.32%  316.61ms         8  39.576ms  4.7100us  316.14ms  cudaMalloc
  0.17%  533.82us         2  266.91us  248.30us  285.53us  cudaGetDeviceProperties
  0.15%  488.66us         1  488.66us  488.66us  488.66us  cudaMallocPitch
  0.09%  300.42us        90  3.3380us     161ns  113.42us  cuDeviceGetAttribute
  0.07%  230.81us         3  76.937us  6.4740us  189.80us  cudaFree
  0.06%  199.50us         1  199.50us  199.50us  199.50us  cuDeviceTotalMem
  0.06%  178.17us         6  29.694us  4.4780us  130.14us  cudaMemcpy
  0.02%  75.771us         4  18.942us  6.5100us  41.419us  cudaLaunch
  0.01%  38.355us         1  38.355us  38.355us  38.355us  cudaMemcpy2D
  0.01%  30.490us         1  30.490us  30.490us  30.490us  cuDeviceGetName
  0.01%  29.607us         1  29.607us  29.607us  29.607us  cudaMemcpyAsync
  0.01%  21.787us        12  1.8150us  1.3960us  4.6960us  cudaFuncGetAttributes
  0.00%  10.087us         1  10.087us  10.087us  10.087us  cudaCreateTextureObject
  0.00%  4.4340us         3  1.4780us     696ns  2.7090us  cudaEventCreateWithFlags
  0.00%  4.0700us         7     581ns     119ns  2.4680us  cudaSetupArgument
  0.00%  4.0460us         9     449ns     208ns  1.7160us  cudaGetDevice
  0.00%  3.4900us        11     317ns     203ns  1.0120us  cudaDeviceGetAttribute
  0.00%  3.3480us         3  1.1160us     635ns  1.8510us  cudaEventRecord
  0.00%  3.0850us         4     771ns     204ns  1.4190us  cudaConfigureCall
  0.00%  2.8560us         3     952ns     477ns  1.2930us  cudaEventDestroy
  0.00%  1.9780us         2     989ns     389ns  1.5890us  cuDeviceGetCount
  0.00%     525ns         2     262ns     239ns     286ns  cuDeviceGet
  0.00%     164ns         1     164ns     164ns     164ns  cudaCreateChannelDesc
