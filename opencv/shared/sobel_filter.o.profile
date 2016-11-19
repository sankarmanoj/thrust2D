==16720== NVPROF is profiling process 16720, command: ./sobel_filter.o
==16720== Profiling application: ./sobel_filter.o
==16720== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.33%  254.13us         1  254.13us  254.13us  254.13us  [CUDA memcpy DtoH]
 22.32%  100.70us        26  3.8730us     544ns  84.922us  [CUDA memcpy HtoD]
 18.21%  82.170us         1  82.170us  82.170us  82.170us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  2.47%  11.135us         4  2.7830us     991ns  4.1920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.67%  3.0400us         1  3.0400us  3.0400us  3.0400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16720== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.12%  996.89ms        12  83.074ms  7.1080us  982.20ms  cudaMalloc
  4.03%  43.119ms         5  8.6237ms  6.5620us  41.446ms  cudaFree
  1.57%  16.816ms         1  16.816ms  16.816ms  16.816ms  cudaGetDeviceProperties
  0.92%  9.8957ms        91  108.74us     138ns  4.7085ms  cuDeviceGetAttribute
  0.18%  1.9220ms         8  240.25us  15.742us  1.1520ms  cudaMemcpy
  0.05%  517.75us        20  25.887us  1.4510us  455.82us  cudaFuncGetAttributes
  0.04%  445.00us         1  445.00us  445.00us  445.00us  cuDeviceTotalMem
  0.03%  323.41us         6  53.900us  42.476us  73.125us  cudaLaunch
  0.02%  253.98us        19  13.367us  3.2630us  180.75us  cudaMemcpyAsync
  0.02%  238.40us         1  238.40us  238.40us  238.40us  cuDeviceGetName
  0.00%  16.772us        15  1.1180us     227ns  4.6630us  cudaGetDevice
  0.00%  16.736us         5  3.3470us  2.2430us  5.5180us  cudaEventCreateWithFlags
  0.00%  15.164us         5  3.0320us  1.3860us  8.1180us  cudaEventDestroy
  0.00%  14.718us         5  2.9430us  1.5540us  5.9560us  cudaEventRecord
  0.00%  11.021us         9  1.2240us     193ns  5.6350us  cudaSetupArgument
  0.00%  8.5380us         6  1.4230us     929ns  2.1290us  cudaConfigureCall
  0.00%  6.0100us        11     546ns     326ns  1.7810us  cudaDeviceGetAttribute
  0.00%  3.6050us         3  1.2010us     220ns  2.7160us  cuDeviceGetCount
  0.00%  3.2670us         1  3.2670us  3.2670us  3.2670us  cudaGetLastError
  0.00%  1.4080us         3     469ns     200ns     687ns  cuDeviceGet
