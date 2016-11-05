==6070== NVPROF is profiling process 6070, command: ./sift.o
==6070== Profiling application: ./sift.o
==6070== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.53%  678.90us         1  678.90us  678.90us  678.90us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 39.47%  519.92us        11  47.265us     640ns  406.40us  [CUDA memcpy HtoD]
  5.86%  77.204us         1  77.204us  77.204us  77.204us  [CUDA memcpy DtoH]
  2.46%  32.346us         5  6.4690us  1.3440us  18.205us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.68%  8.9920us         3  2.9970us  1.3760us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6070== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.81%  878.97ms        16  54.935ms  5.6910us  840.66ms  cudaMalloc
  0.68%  6.0926ms         8  761.58us  5.8560us  2.4360ms  cudaFree
  0.19%  1.6827ms        90  18.696us     121ns  826.16us  cuDeviceGetAttribute
  0.14%  1.2035ms         9  133.72us  5.2240us  1.0866ms  cudaMemcpy
  0.08%  690.48us         3  230.16us  44.086us  499.84us  cudaMemcpyAsync
  0.05%  467.55us         1  467.55us  467.55us  467.55us  cuDeviceTotalMem
  0.02%  216.96us         9  24.107us  8.2680us  43.350us  cudaLaunch
  0.01%  95.288us        36  2.6460us  1.3960us  6.4990us  cudaFuncGetAttributes
  0.01%  62.351us         1  62.351us  62.351us  62.351us  cuDeviceGetName
  0.00%  19.530us        27     723ns     209ns  2.4870us  cudaGetDevice
  0.00%  14.333us         9  1.5920us     780ns  2.2850us  cudaEventCreateWithFlags
  0.00%  12.761us         9  1.4170us     712ns  2.1860us  cudaEventRecord
  0.00%  9.5730us         9  1.0630us     564ns  1.6670us  cudaEventDestroy
  0.00%  7.6940us         9     854ns     269ns  3.6160us  cudaSetupArgument
  0.00%  7.6550us         9     850ns     232ns  1.4740us  cudaConfigureCall
  0.00%  3.7240us        11     338ns     203ns  1.0280us  cudaDeviceGetAttribute
  0.00%  2.1670us         2  1.0830us     518ns  1.6490us  cuDeviceGetCount
  0.00%     819ns         2     409ns     250ns     569ns  cuDeviceGet
