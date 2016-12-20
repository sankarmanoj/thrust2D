==9884== NVPROF is profiling process 9884, command: ./sift.o 1631
==9884== Profiling application: ./sift.o 1631
==9884== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.18%  1.5493ms         1  1.5493ms  1.5493ms  1.5493ms  void thrust::transform_kernel<unsigned char, siftTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
 30.71%  1.2797ms         1  1.2797ms  1.2797ms  1.2797ms  [CUDA memcpy DtoH]
 26.95%  1.1229ms        12  93.578us     672ns  941.12us  [CUDA memcpy HtoD]
  5.16%  214.98us         7  30.710us  1.0880us  62.976us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9884== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 88.70%  446.99ms        16  27.937ms  6.6120us  445.01ms  cudaMalloc
  4.49%  22.639ms        90  251.54us     134ns  10.004ms  cuDeviceGetAttribute
  3.66%  18.438ms         2  9.2188ms  307.77us  18.130ms  cudaGetDeviceProperties
  1.45%  7.2957ms         1  7.2957ms  7.2957ms  7.2957ms  cuDeviceTotalMem
  0.61%  3.0909ms         1  3.0909ms  3.0909ms  3.0909ms  cuDeviceGetName
  0.34%  1.7182ms        10  171.82us  6.4050us  1.5367ms  cudaMemcpy
  0.31%  1.5488ms         1  1.5488ms  1.5488ms  1.5488ms  cudaDeviceSynchronize
  0.30%  1.4901ms         3  496.69us  45.362us  1.0786ms  cudaMemcpyAsync
  0.09%  441.14us         7  63.020us  9.5300us  180.04us  cudaFree
  0.02%  125.72us         8  15.714us  9.6200us  31.436us  cudaLaunch
  0.02%  84.099us        28  3.0030us  2.5340us  6.3760us  cudaFuncGetAttributes
  0.00%  13.245us        21     630ns     375ns  2.1490us  cudaGetDevice
  0.00%  11.489us         7  1.6410us  1.2380us  2.8260us  cudaEventCreateWithFlags
  0.00%  9.2590us         7  1.3220us  1.0290us  2.1850us  cudaEventRecord
  0.00%  7.3350us         7  1.0470us     772ns  1.5770us  cudaEventDestroy
  0.00%  6.0430us        11     549ns     382ns  1.3120us  cudaDeviceGetAttribute
  0.00%  5.9950us         8     749ns     335ns  2.0170us  cudaConfigureCall
  0.00%  4.1660us        11     378ns     211ns     758ns  cudaSetupArgument
  0.00%  3.2820us         2  1.6410us     622ns  2.6600us  cuDeviceGetCount
  0.00%  1.3220us         2     661ns     334ns     988ns  cuDeviceGet
