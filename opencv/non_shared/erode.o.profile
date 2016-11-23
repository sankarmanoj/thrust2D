==3328== NVPROF is profiling process 3328, command: ./erode.o
==3328== Profiling application: ./erode.o
==3328== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.71%  184.69us         1  184.69us  184.69us  184.69us  [CUDA memcpy DtoH]
 31.16%  144.94us         5  28.988us     705ns  141.39us  [CUDA memcpy HtoD]
 19.37%  90.075us         1  90.075us  90.075us  90.075us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.82%  41.035us         3  13.678us  12.195us  14.628us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.94%  4.3540us         1  4.3540us  4.3540us  4.3540us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3328== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.73%  1.11871s         8  139.84ms  8.8440us  1.11001s  cudaMalloc
  0.51%  5.7545ms         4  1.4386ms  24.517us  2.8344ms  cudaFree
  0.30%  3.4007ms        90  37.785us     130ns  2.3154ms  cuDeviceGetAttribute
  0.19%  2.2017ms         5  440.33us  2.8620us  2.1867ms  cudaEventCreateWithFlags
  0.09%  978.58us         5  195.72us  29.892us  804.39us  cudaMemcpy
  0.08%  853.12us         1  853.12us  853.12us  853.12us  cuDeviceTotalMem
  0.06%  631.31us         1  631.31us  631.31us  631.31us  cuDeviceGetName
  0.02%  222.69us         1  222.69us  222.69us  222.69us  cudaMemcpyAsync
  0.02%  204.23us         5  40.846us  34.199us  51.936us  cudaLaunch
  0.01%  79.931us        20  3.9960us  2.4520us  8.7410us  cudaFuncGetAttributes
  0.00%  24.179us         5  4.8350us  2.0830us  9.6250us  cudaEventRecord
  0.00%  23.072us        15  1.5380us     367ns  5.3490us  cudaGetDevice
  0.00%  16.935us         5  3.3870us  1.2740us  8.5230us  cudaEventDestroy
  0.00%  10.027us         2  5.0130us  4.5410us  5.4860us  cuDeviceGetCount
  0.00%  9.2890us         5  1.8570us     595ns  4.6670us  cudaSetupArgument
  0.00%  6.8240us        11     620ns     376ns  1.7600us  cudaDeviceGetAttribute
  0.00%  6.6480us         5  1.3290us     690ns  2.3760us  cudaConfigureCall
  0.00%  1.5640us         2     782ns     646ns     918ns  cuDeviceGet
