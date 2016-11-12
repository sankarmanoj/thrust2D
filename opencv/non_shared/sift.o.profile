==30031== NVPROF is profiling process 30031, command: ./sift.o
==30031== Profiling application: ./sift.o
==30031== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.89%  766.31us        11  69.664us  1.2160us  622.41us  [CUDA memcpy HtoD]
 43.26%  678.15us         1  678.15us  678.15us  678.15us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.80%  75.233us         1  75.233us  75.233us  75.233us  [CUDA memcpy DtoH]
  2.34%  36.704us         5  7.3400us  1.7280us  18.624us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.71%  11.072us         3  3.6900us  1.9840us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30031== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.74%  786.18ms        16  49.137ms  6.9420us  760.35ms  cudaMalloc
  2.29%  18.646ms         8  2.3307ms  8.8820us  6.3619ms  cudaFree
  0.46%  3.7733ms        90  41.925us     129ns  2.0542ms  cuDeviceGetAttribute
  0.20%  1.5858ms         9  176.20us  6.3080us  1.3996ms  cudaMemcpy
  0.12%  1.0133ms         3  337.76us  72.762us  753.26us  cudaMemcpyAsync
  0.09%  724.30us         1  724.30us  724.30us  724.30us  cuDeviceGetName
  0.04%  316.08us         1  316.08us  316.08us  316.08us  cuDeviceTotalMem
  0.03%  232.40us         9  25.821us  8.2320us  39.972us  cudaLaunch
  0.01%  108.38us        36  3.0100us  1.4210us  7.4900us  cudaFuncGetAttributes
  0.00%  33.766us        27  1.2500us     224ns  11.474us  cudaGetDevice
  0.00%  17.676us         9  1.9640us  1.0630us  3.3250us  cudaEventCreateWithFlags
  0.00%  14.559us         9  1.6170us     915ns  2.3160us  cudaEventRecord
  0.00%  11.104us         9  1.2330us     762ns  1.6070us  cudaEventDestroy
  0.00%  9.2770us         9  1.0300us     261ns  4.4300us  cudaSetupArgument
  0.00%  8.6360us         9     959ns     294ns  2.0150us  cudaConfigureCall
  0.00%  3.6010us        11     327ns     203ns  1.0960us  cudaDeviceGetAttribute
  0.00%  2.0710us         2  1.0350us     304ns  1.7670us  cuDeviceGetCount
  0.00%     490ns         2     245ns     173ns     317ns  cuDeviceGet
