==3901== NVPROF is profiling process 3901, command: ./dilate.o
==3901== Profiling application: ./dilate.o
==3901== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.85%  90.949us         1  90.949us  90.949us  90.949us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 31.51%  87.235us         5  17.447us     768ns  82.851us  [CUDA memcpy HtoD]
 29.81%  82.531us         1  82.531us  82.531us  82.531us  [CUDA memcpy DtoH]
  4.81%  13.312us         3  4.4370us  3.6800us  5.4720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.02%  2.8160us         1  2.8160us  2.8160us  2.8160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3901== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.49%  568.22ms         8  71.027ms  7.8020us  566.16ms  cudaMalloc
  2.87%  17.274ms        90  191.93us     127ns  10.081ms  cuDeviceGetAttribute
  1.85%  11.104ms         1  11.104ms  11.104ms  11.104ms  cuDeviceGetName
  0.50%  3.0160ms         1  3.0160ms  3.0160ms  3.0160ms  cuDeviceTotalMem
  0.12%  702.77us         5  140.55us  7.8650us  651.78us  cudaMemcpy
  0.11%  643.77us         4  160.94us  10.075us  264.25us  cudaFree
  0.03%  165.65us         1  165.65us  165.65us  165.65us  cudaMemcpyAsync
  0.02%  109.45us         5  21.890us  13.462us  37.645us  cudaLaunch
  0.01%  61.555us        20  3.0770us  2.4930us  5.8660us  cudaFuncGetAttributes
  0.00%  11.671us        15     778ns     343ns  2.7120us  cudaGetDevice
  0.00%  9.2110us         5  1.8420us  1.3590us  2.5440us  cudaEventCreateWithFlags
  0.00%  7.8530us         5  1.5700us     357ns  5.3110us  cudaSetupArgument
  0.00%  7.7800us         5  1.5560us  1.2720us  2.1390us  cudaEventRecord
  0.00%  5.5280us         5  1.1050us     889ns  1.3990us  cudaEventDestroy
  0.00%  5.1770us        11     470ns     277ns  1.1940us  cudaDeviceGetAttribute
  0.00%  3.6290us         5     725ns     430ns  1.3180us  cudaConfigureCall
  0.00%  2.7050us         2  1.3520us     537ns  2.1680us  cuDeviceGetCount
  0.00%     619ns         2     309ns     216ns     403ns  cuDeviceGet
