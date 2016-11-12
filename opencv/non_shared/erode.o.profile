==30001== NVPROF is profiling process 30001, command: ./erode.o
==30001== Profiling application: ./erode.o
==30001== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.24%  84.353us         1  84.353us  84.353us  84.353us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 31.94%  83.585us         5  16.717us  1.1840us  78.785us  [CUDA memcpy HtoD]
 29.35%  76.801us         1  76.801us  76.801us  76.801us  [CUDA memcpy DtoH]
  4.90%  12.832us         3  4.2770us  3.7440us  4.9920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.57%  4.0960us         1  4.0960us  4.0960us  4.0960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30001== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.88%  476.64ms         8  59.580ms  8.8360us  464.63ms  cudaMalloc
  1.79%  8.6957ms         4  2.1739ms  56.664us  3.9297ms  cudaFree
  0.09%  446.12us         5  89.223us  9.4850us  350.36us  cudaMemcpy
  0.08%  406.76us        90  4.5190us     137ns  157.23us  cuDeviceGetAttribute
  0.05%  221.61us         1  221.61us  221.61us  221.61us  cuDeviceTotalMem
  0.04%  201.73us         1  201.73us  201.73us  201.73us  cudaMemcpyAsync
  0.04%  174.79us         5  34.958us  13.551us  45.400us  cudaLaunch
  0.01%  66.213us        20  3.3100us  1.9450us  6.9390us  cudaFuncGetAttributes
  0.01%  39.511us         1  39.511us  39.511us  39.511us  cuDeviceGetName
  0.00%  15.160us        15  1.0100us     325ns  2.8540us  cudaGetDevice
  0.00%  11.643us         5  2.3280us  1.5390us  2.8920us  cudaEventCreateWithFlags
  0.00%  9.5620us         5  1.9120us  1.2660us  2.2250us  cudaEventRecord
  0.00%  8.5410us         5  1.7080us     375ns  5.6380us  cudaSetupArgument
  0.00%  6.8000us         5  1.3600us  1.0300us  1.4750us  cudaEventDestroy
  0.00%  5.5430us        11     503ns     352ns  1.3340us  cudaDeviceGetAttribute
  0.00%  5.1600us         5  1.0320us     457ns  1.4030us  cudaConfigureCall
  0.00%  2.2670us         2  1.1330us     449ns  1.8180us  cuDeviceGetCount
  0.00%     599ns         2     299ns     216ns     383ns  cuDeviceGet
