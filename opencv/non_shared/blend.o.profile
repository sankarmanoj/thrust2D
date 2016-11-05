==6213== NVPROF is profiling process 6213, command: ./blend.o
==6213== Profiling application: ./blend.o
==6213== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.55%  158.09us         5  31.617us     608ns  78.260us  [CUDA memcpy HtoD]
 28.26%  83.412us         1  83.412us  83.412us  83.412us  [CUDA memcpy DtoH]
 13.88%  40.986us         1  40.986us  40.986us  40.986us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.30%  12.703us         3  4.2340us  3.9990us  4.5120us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6213== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.13%  422.15ms         6  70.358ms  5.5800us  420.88ms  cudaMalloc
  3.19%  14.007ms        90  155.63us     107ns  6.7287ms  cuDeviceGetAttribute
  0.26%  1.1351ms         1  1.1351ms  1.1351ms  1.1351ms  cuDeviceGetName
  0.24%  1.0523ms         1  1.0523ms  1.0523ms  1.0523ms  cuDeviceTotalMem
  0.09%  387.68us         4  96.918us  11.044us  327.68us  cudaMemcpy
  0.04%  195.10us         3  65.034us  8.5360us  115.96us  cudaFree
  0.02%  104.11us         2  52.052us  47.186us  56.919us  cudaMemcpyAsync
  0.01%  47.823us         4  11.955us  9.8620us  14.711us  cudaLaunch
  0.01%  27.691us        16  1.7300us  1.4590us  2.9320us  cudaFuncGetAttributes
  0.00%  5.0660us        12     422ns     209ns  1.0270us  cudaGetDevice
  0.00%  4.5560us         4  1.1390us     945ns  1.3970us  cudaEventCreateWithFlags
  0.00%  4.0720us         4  1.0180us     251ns  2.9920us  cudaSetupArgument
  0.00%  3.4690us         4     867ns     808ns     913ns  cudaEventRecord
  0.00%  2.8940us         4     723ns     611ns     781ns  cudaEventDestroy
  0.00%  2.7760us        11     252ns     208ns     537ns  cudaDeviceGetAttribute
  0.00%  2.0270us         2  1.0130us     427ns  1.6000us  cuDeviceGetCount
  0.00%  1.5710us         4     392ns     250ns     547ns  cudaConfigureCall
  0.00%     576ns         2     288ns     182ns     394ns  cuDeviceGet
