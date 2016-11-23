==3324== NVPROF is profiling process 3324, command: ./lbp.o
==3324== Profiling application: ./lbp.o
==3324== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.21%  225.99us         1  225.99us  225.99us  225.99us  [CUDA memcpy DtoH]
 28.21%  176.08us         5  35.216us     704ns  172.60us  [CUDA memcpy HtoD]
 27.32%  170.52us         1  170.52us  170.52us  170.52us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.61%  47.502us         3  15.834us  15.140us  16.197us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.66%  4.0980us         1  4.0980us  4.0980us  4.0980us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3324== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.64%  1.12763s         8  140.95ms  15.638us  1.10995s  cudaMalloc
  0.68%  7.7909ms         4  1.9477ms  38.761us  6.4259ms  cudaFree
  0.46%  5.2099ms        90  57.887us     140ns  2.4805ms  cuDeviceGetAttribute
  0.09%  1.0726ms         5  214.53us  18.558us  917.53us  cudaMemcpy
  0.03%  394.70us         1  394.70us  394.70us  394.70us  cuDeviceGetName
  0.03%  393.70us         1  393.70us  393.70us  393.70us  cuDeviceTotalMem
  0.02%  278.07us         1  278.07us  278.07us  278.07us  cudaMemcpyAsync
  0.02%  232.04us         5  46.408us  27.757us  70.590us  cudaLaunch
  0.01%  71.880us        20  3.5940us  2.1180us  9.9690us  cudaFuncGetAttributes
  0.00%  20.031us        15  1.3350us     284ns  4.8000us  cudaGetDevice
  0.00%  15.103us         5  3.0200us  2.1550us  4.3110us  cudaEventCreateWithFlags
  0.00%  11.501us         5  2.3000us  1.6380us  3.2000us  cudaEventRecord
  0.00%  9.0570us         5  1.8110us     425ns  4.6780us  cudaSetupArgument
  0.00%  8.5030us         5  1.7000us  1.4000us  2.0570us  cudaEventDestroy
  0.00%  6.7890us         5  1.3570us  1.0150us  2.1790us  cudaConfigureCall
  0.00%  5.9610us        11     541ns     387ns  1.3980us  cudaDeviceGetAttribute
  0.00%  4.5190us         2  2.2590us  1.9880us  2.5310us  cuDeviceGetCount
  0.00%  1.6440us         1  1.6440us  1.6440us  1.6440us  cudaGetLastError
  0.00%     771ns         2     385ns     377ns     394ns  cuDeviceGet
