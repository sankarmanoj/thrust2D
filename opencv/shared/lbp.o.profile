==9528== NVPROF is profiling process 9528, command: ./lbp.o
==9528== Profiling application: ./lbp.o
==9528== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.94%  86.944us         6  14.490us  1.1840us  80.832us  [CUDA memcpy HtoD]
 33.11%  82.400us         1  82.400us  82.400us  82.400us  [CUDA memcpy DtoH]
 27.80%  69.184us         1  69.184us  69.184us  69.184us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, lbpFunctor)
  3.02%  7.5200us         2  3.7600us  3.4880us  4.0320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.12%  2.7840us         1  2.7840us  2.7840us  2.7840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9528== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.56%  1.16583s         8  145.73ms  7.6120us  1.15817s  cudaMalloc
  1.82%  21.734ms        90  241.49us     105ns  16.094ms  cuDeviceGetAttribute
  0.29%  3.4459ms         3  1.1486ms  15.644us  1.7447ms  cudaFree
  0.15%  1.8068ms         1  1.8068ms  1.8068ms  1.8068ms  cudaGetDeviceProperties
  0.06%  691.87us         6  115.31us  6.1770us  598.79us  cudaMemcpy
  0.05%  551.28us         4  137.82us  14.498us  490.17us  cudaLaunch
  0.04%  476.69us         1  476.69us  476.69us  476.69us  cuDeviceTotalMem
  0.03%  305.43us         1  305.43us  305.43us  305.43us  cuDeviceGetName
  0.01%  114.83us         1  114.83us  114.83us  114.83us  cudaMemcpyAsync
  0.00%  25.592us        12  2.1320us  1.4550us  4.5450us  cudaFuncGetAttributes
  0.00%  6.2910us         3  2.0970us  1.7270us  2.6090us  cudaEventCreateWithFlags
  0.00%  5.8630us         9     651ns     211ns  1.9200us  cudaGetDevice
  0.00%  4.9670us         7     709ns     117ns  3.4710us  cudaSetupArgument
  0.00%  4.1620us         3  1.3870us  1.3290us  1.4520us  cudaEventRecord
  0.00%  3.7880us         3  1.2620us  1.1700us  1.3620us  cudaEventDestroy
  0.00%  3.4040us        11     309ns     213ns     840ns  cudaDeviceGetAttribute
  0.00%  3.2310us         4     807ns     574ns     993ns  cudaConfigureCall
  0.00%  2.3280us         2  1.1640us     656ns  1.6720us  cuDeviceGetCount
  0.00%     422ns         2     211ns     160ns     262ns  cuDeviceGet
