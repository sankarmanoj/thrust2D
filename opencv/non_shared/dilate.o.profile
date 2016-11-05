==6169== NVPROF is profiling process 6169, command: ./dilate.o
==6169== Profiling application: ./dilate.o
==6169== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.56%  84.468us         1  84.468us  84.468us  84.468us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.34%  76.372us         5  15.274us     608ns  72.501us  [CUDA memcpy HtoD]
 29.68%  74.709us         1  74.709us  74.709us  74.709us  [CUDA memcpy DtoH]
  4.80%  12.094us         3  4.0310us  3.8710us  4.2550us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.61%  4.0630us         1  4.0630us  4.0630us  4.0630us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6169== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.24%  644.66ms         8  80.583ms  5.7030us  640.13ms  cudaMalloc
  0.49%  3.1697ms         4  792.41us  10.535us  2.2720ms  cudaFree
  0.09%  595.74us         5  119.15us  16.155us  439.14us  cudaMemcpy
  0.06%  381.05us        90  4.2330us     141ns  148.09us  cuDeviceGetAttribute
  0.06%  360.68us         1  360.68us  360.68us  360.68us  cudaMemcpyAsync
  0.03%  215.33us         1  215.33us  215.33us  215.33us  cuDeviceTotalMem
  0.01%  93.381us         5  18.676us  7.1910us  26.593us  cudaLaunch
  0.01%  43.361us        20  2.1680us  1.4150us  5.4970us  cudaFuncGetAttributes
  0.01%  32.767us         1  32.767us  32.767us  32.767us  cuDeviceGetName
  0.00%  9.1680us        15     611ns     215ns  2.1040us  cudaGetDevice
  0.00%  6.8960us         5  1.3790us     243ns  4.0140us  cudaSetupArgument
  0.00%  6.5260us         5  1.3050us     728ns  1.7680us  cudaEventCreateWithFlags
  0.00%  5.8580us         5  1.1710us     638ns  1.7980us  cudaEventRecord
  0.00%  4.8760us         5     975ns     541ns  1.2480us  cudaEventDestroy
  0.00%  3.4970us         5     699ns     167ns     972ns  cudaConfigureCall
  0.00%  3.1880us        11     289ns     206ns  1.0270us  cudaDeviceGetAttribute
  0.00%  2.1730us         2  1.0860us     250ns  1.9230us  cuDeviceGetCount
  0.00%     586ns         2     293ns     213ns     373ns  cuDeviceGet
