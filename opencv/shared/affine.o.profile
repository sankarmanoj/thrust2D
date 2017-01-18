==6570== NVPROF is profiling process 6570, command: ./affine.o
==6570== Profiling application: ./affine.o
==6570== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.66%  12.661ms         1  12.661ms  12.661ms  12.661ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.63%  344.21us         1  344.21us  344.21us  344.21us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<printFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.33%  43.614us         5  8.7220us     704ns  40.062us  [CUDA memcpy HtoD]
  0.31%  40.639us         1  40.639us  40.639us  40.639us  [CUDA memcpy DtoH]
  0.07%  8.7040us         2  4.3520us  3.6480us  5.0560us  [CUDA memset]

==6570== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.90%  1.38136s         3  460.45ms  5.5860us  1.38135s  cudaMallocPitch
  0.93%  13.023ms         2  6.5115ms  355.78us  12.667ms  cudaDeviceSynchronize
  0.07%  951.40us         2  475.70us  475.39us  476.02us  cudaLaunch
  0.02%  340.33us         3  113.44us  2.5520us  332.59us  cudaMalloc
  0.02%  331.59us         3  110.53us  23.893us  274.99us  cudaMemcpy2D
  0.02%  216.01us        90  2.4000us      96ns  84.274us  cuDeviceGetAttribute
  0.01%  186.66us         1  186.66us  186.66us  186.66us  cudaGetDeviceProperties
  0.01%  160.61us         1  160.61us  160.61us  160.61us  cuDeviceTotalMem
  0.00%  34.027us         8  4.2530us  1.3440us  11.752us  cudaFuncGetAttributes
  0.00%  31.372us         2  15.686us  11.127us  20.245us  cudaMemset2D
  0.00%  20.610us         3  6.8700us  4.3330us  10.786us  cudaMemcpy
  0.00%  19.504us         1  19.504us  19.504us  19.504us  cuDeviceGetName
  0.00%  4.1170us         2  2.0580us  1.5610us  2.5560us  cudaEventCreateWithFlags
  0.00%  3.3050us        11     300ns     203ns     772ns  cudaDeviceGetAttribute
  0.00%  2.5480us         6     424ns     207ns  1.1090us  cudaGetDevice
  0.00%  2.5000us         2  1.2500us  1.2350us  1.2650us  cudaEventRecord
  0.00%  1.9710us         2     985ns     959ns  1.0120us  cudaEventDestroy
  0.00%  1.1950us         2     597ns     155ns  1.0400us  cuDeviceGetCount
  0.00%  1.1470us         2     573ns     349ns     798ns  cudaConfigureCall
  0.00%     793ns         2     396ns     350ns     443ns  cudaSetupArgument
  0.00%     271ns         2     135ns      95ns     176ns  cuDeviceGet
