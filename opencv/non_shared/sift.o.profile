==3477== NVPROF is profiling process 3477, command: ./sift.o
==3477== Profiling application: ./sift.o
==3477== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 74.36%  1.9109ms        11  173.72us     704ns  1.5587ms  [CUDA memcpy HtoD]
 13.00%  334.18us         1  334.18us  334.18us  334.18us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.71%  172.37us         1  172.37us  172.37us  172.37us  [CUDA memcpy DtoH]
  5.08%  130.50us         5  26.100us  1.3440us  84.921us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.85%  21.831us         3  7.2770us  1.4090us  16.837us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3477== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.82%  207.38ms        16  12.962ms  4.7990us  205.68ms  cudaMalloc
  3.18%  6.9644ms         8  870.55us  10.812us  2.2413ms  cudaFree
  1.20%  2.6210ms         3  873.66us  160.27us  1.9679ms  cudaMemcpyAsync
  0.49%  1.0696ms         9  118.84us  5.3780us  910.26us  cudaMemcpy
  0.09%  192.52us        90  2.1390us      93ns  73.021us  cuDeviceGetAttribute
  0.08%  164.46us         1  164.46us  164.46us  164.46us  cuDeviceTotalMem
  0.07%  156.40us         9  17.377us  7.0720us  66.844us  cudaLaunch
  0.04%  77.359us        36  2.1480us  1.4020us  10.574us  cudaFuncGetAttributes
  0.01%  20.099us         1  20.099us  20.099us  20.099us  cuDeviceGetName
  0.01%  16.694us        27     618ns     206ns  5.4230us  cudaGetDevice
  0.01%  13.127us         9  1.4580us     880ns  3.6090us  cudaEventCreateWithFlags
  0.00%  9.9120us         9  1.1010us     617ns  2.7090us  cudaEventRecord
  0.00%  8.9640us         9     996ns     184ns  4.2670us  cudaSetupArgument
  0.00%  8.0020us         9     889ns     612ns  1.5300us  cudaEventDestroy
  0.00%  5.8070us         9     645ns     241ns  2.8220us  cudaConfigureCall
  0.00%  3.9390us        11     358ns     208ns  1.1340us  cudaDeviceGetAttribute
  0.00%  1.8600us         2     930ns     200ns  1.6600us  cuDeviceGetCount
  0.00%     359ns         2     179ns     121ns     238ns  cuDeviceGet
