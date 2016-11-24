==5481== NVPROF is profiling process 5481, command: ./lbp.o
==5481== Profiling application: ./lbp.o
==5481== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.29%  56.667us         1  56.667us  56.667us  56.667us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 21.78%  24.062us         5  4.8120us  1.2160us  19.198us  [CUDA memcpy HtoD]
 17.26%  19.071us         1  19.071us  19.071us  19.071us  [CUDA memcpy DtoH]
  9.67%  10.688us         4  2.6720us  2.1440us  4.1280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5481== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.41%  529.48ms         8  66.184ms  7.0570us  526.39ms  cudaMalloc
  1.43%  7.7474ms        90  86.081us     123ns  4.1649ms  cuDeviceGetAttribute
  0.46%  2.5161ms         1  2.5161ms  2.5161ms  2.5161ms  cuDeviceGetName
  0.41%  2.2280ms         4  556.99us  8.6330us  2.1697ms  cudaFree
  0.09%  470.45us        15  31.363us     289ns  460.37us  cudaGetDevice
  0.08%  446.33us         1  446.33us  446.33us  446.33us  cuDeviceTotalMem
  0.06%  332.23us         5  66.446us  8.0160us  148.92us  cudaMemcpy
  0.03%  145.69us         5  29.138us  11.027us  39.015us  cudaLaunch
  0.01%  60.848us        20  3.0420us  1.8890us  7.2440us  cudaFuncGetAttributes
  0.01%  55.324us         1  55.324us  55.324us  55.324us  cudaMemcpyAsync
  0.00%  10.933us         5  2.1860us  1.1920us  2.8700us  cudaEventCreateWithFlags
  0.00%  9.2520us         5  1.8500us  1.0270us  2.1870us  cudaEventRecord
  0.00%  8.6950us         5  1.7390us     391ns  5.6010us  cudaSetupArgument
  0.00%  6.8440us         5  1.3680us  1.0240us  1.5960us  cudaEventDestroy
  0.00%  5.6070us         2  2.8030us  2.5330us  3.0740us  cuDeviceGetCount
  0.00%  5.5240us        11     502ns     266ns  1.3990us  cudaDeviceGetAttribute
  0.00%  5.4340us         5  1.0860us     412ns  1.5160us  cudaConfigureCall
  0.00%  2.3950us         1  2.3950us  2.3950us  2.3950us  cudaGetLastError
  0.00%     981ns         2     490ns     422ns     559ns  cuDeviceGet
