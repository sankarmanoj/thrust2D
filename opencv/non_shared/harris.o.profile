==3333== NVPROF is profiling process 3333, command: ./harris.o
==3333== Profiling application: ./harris.o
==3333== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.75%  251.88us        19  13.257us     320ns  240.68us  [CUDA memcpy DtoH]
 29.97%  172.53us        23  7.5010us     704ns  155.53us  [CUDA memcpy HtoD]
 18.41%  105.98us         1  105.98us  105.98us  105.98us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.87%  45.326us         4  11.331us  2.3370us  15.013us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3333== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.06%  903.34ms         8  112.92ms  16.755us  888.88ms  cudaMalloc
  1.44%  13.301ms        90  147.79us     134ns  13.079ms  cuDeviceGetAttribute
  0.20%  1.8024ms         4  450.59us  85.730us  1.0113ms  cudaFree
  0.17%  1.5594ms         5  311.88us  23.801us  769.15us  cudaMemcpy
  0.06%  551.27us        37  14.899us  3.0870us  279.35us  cudaMemcpyAsync
  0.03%  237.25us         5  47.450us  22.597us  59.780us  cudaLaunch
  0.02%  180.79us         1  180.79us  180.79us  180.79us  cuDeviceTotalMem
  0.01%  78.935us        20  3.9460us  2.0290us  12.039us  cudaFuncGetAttributes
  0.01%  48.634us         1  48.634us  48.634us  48.634us  cuDeviceGetName
  0.00%  17.426us        15  1.1610us     305ns  4.2870us  cudaGetDevice
  0.00%  17.103us         5  3.4200us  1.6650us  4.9250us  cudaEventCreateWithFlags
  0.00%  13.289us         5  2.6570us  1.3000us  3.5270us  cudaEventRecord
  0.00%  10.140us         5  2.0280us     343ns  6.4620us  cudaSetupArgument
  0.00%  9.9920us         5  1.9980us  1.1380us  2.7980us  cudaEventDestroy
  0.00%  7.8560us         5  1.5710us     805ns  3.4290us  cudaConfigureCall
  0.00%  5.9540us        11     541ns     269ns  1.8760us  cudaDeviceGetAttribute
  0.00%  5.0920us         2  2.5460us     290ns  4.8020us  cuDeviceGetCount
  0.00%     685ns         2     342ns     277ns     408ns  cuDeviceGet
