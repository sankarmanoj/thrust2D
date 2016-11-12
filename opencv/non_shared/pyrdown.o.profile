==30096== NVPROF is profiling process 30096, command: ./pyrdown.o
==30096== Profiling application: ./pyrdown.o
==30096== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 78.60%  2.1867ms        19  115.09us     320ns  2.1720ms  [CUDA memcpy DtoH]
 14.98%  416.68us         1  416.68us  416.68us  416.68us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.84%  106.79us        25  4.2710us     576ns  80.833us  [CUDA memcpy HtoD]
  1.71%  47.488us         5  9.4970us  3.1040us  18.048us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.76%  21.024us         1  21.024us  21.024us  21.024us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.12%  3.3920us         1  3.3920us  3.3920us  3.3920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30096== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.72%  586.35ms        12  48.863ms  5.9920us  584.31ms  cudaMalloc
  0.63%  3.7187ms         7  531.24us  5.6450us  3.6138ms  cudaMemcpy
  0.30%  1.7930ms        90  19.921us     127ns  1.2916ms  cuDeviceGetAttribute
  0.11%  648.14us         6  108.02us  11.459us  236.70us  cudaFree
  0.10%  618.73us        37  16.722us  2.1510us  302.51us  cudaMemcpyAsync
  0.04%  259.93us         1  259.93us  259.93us  259.93us  cuDeviceTotalMem
  0.03%  194.43us         8  24.303us  7.8760us  52.993us  cudaLaunch
  0.03%  161.91us         1  161.91us  161.91us  161.91us  cuDeviceGetName
  0.01%  78.819us        32  2.4630us  1.4200us  8.4650us  cudaFuncGetAttributes
  0.00%  21.015us         1  21.015us  21.015us  21.015us  cudaDeviceSynchronize
  0.00%  19.987us        24     832ns     214ns  4.5120us  cudaGetDevice
  0.00%  12.736us         8  1.5920us     886ns  2.9530us  cudaEventCreateWithFlags
  0.00%  11.141us         8  1.3920us     718ns  2.2820us  cudaEventRecord
  0.00%  10.241us         8  1.2800us     242ns  6.8080us  cudaSetupArgument
  0.00%  9.0500us         8  1.1310us     631ns  1.9500us  cudaEventDestroy
  0.00%  8.3630us         8  1.0450us     244ns  3.0230us  cudaConfigureCall
  0.00%  4.0550us        11     368ns     207ns  1.4340us  cudaDeviceGetAttribute
  0.00%  2.0000us         2  1.0000us     282ns  1.7180us  cuDeviceGetCount
  0.00%     534ns         2     267ns     128ns     406ns  cuDeviceGet
