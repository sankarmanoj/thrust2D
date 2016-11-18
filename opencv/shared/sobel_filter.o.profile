==6693== NVPROF is profiling process 6693, command: ./sobel_filter.o
==6693== Profiling application: ./sobel_filter.o
==6693== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.74%  102.62us        26  3.9470us     544ns  80.896us  [CUDA memcpy HtoD]
 30.78%  88.384us         1  88.384us  88.384us  88.384us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 28.82%  82.751us         1  82.751us  82.751us  82.751us  [CUDA memcpy DtoH]
  3.78%  10.848us         4  2.7120us     992ns  4.3520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.88%  2.5280us         1  2.5280us  2.5280us  2.5280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6693== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.25%  1.03754s        12  86.462ms  4.3990us  1.03152s  cudaMalloc
  5.57%  61.967ms        90  688.52us     106ns  50.374ms  cuDeviceGetAttribute
  0.82%  9.1712ms         1  9.1712ms  9.1712ms  9.1712ms  cudaGetDeviceProperties
  0.13%  1.4261ms         5  285.22us  4.4350us  792.18us  cudaFree
  0.10%  1.0766ms         1  1.0766ms  1.0766ms  1.0766ms  cuDeviceTotalMem
  0.07%  769.09us         1  769.09us  769.09us  769.09us  cuDeviceGetName
  0.03%  372.73us         8  46.590us  5.1510us  260.67us  cudaMemcpy
  0.01%  149.28us        19  7.8560us  1.9050us  110.30us  cudaMemcpyAsync
  0.01%  105.23us         6  17.537us  7.3310us  32.522us  cudaLaunch
  0.00%  37.672us        20  1.8830us  1.4450us  4.7390us  cudaFuncGetAttributes
  0.00%  7.5630us        15     504ns     208ns  1.8250us  cudaGetDevice
  0.00%  6.7390us         9     748ns     125ns  4.5310us  cudaSetupArgument
  0.00%  6.2800us         5  1.2560us     823ns  1.9810us  cudaEventCreateWithFlags
  0.00%  5.3440us         5  1.0680us     664ns  1.8090us  cudaEventRecord
  0.00%  4.6230us         5     924ns     577ns  1.4710us  cudaEventDestroy
  0.00%  3.4090us         6     568ns     189ns     906ns  cudaConfigureCall
  0.00%  3.3540us        11     304ns     234ns     762ns  cudaDeviceGetAttribute
  0.00%  2.2210us         2  1.1100us     388ns  1.8330us  cuDeviceGetCount
  0.00%     472ns         1     472ns     472ns     472ns  cudaGetLastError
  0.00%     423ns         2     211ns     163ns     260ns  cuDeviceGet
