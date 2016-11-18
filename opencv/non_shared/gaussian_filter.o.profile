==8651== NVPROF is profiling process 8651, command: ./gaussian_filter.o
==8651== Profiling application: ./gaussian_filter.o
==8651== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.38%  2.5171ms         1  2.5171ms  2.5171ms  2.5171ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 21.50%  896.11us       728  1.2300us     544ns  87.263us  [CUDA memcpy HtoD]
 17.65%  735.92us       723  1.0170us     319ns  115.97us  [CUDA memcpy DtoH]
  0.38%  15.904us         4  3.9760us  1.5680us  5.4080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.08%  3.5200us         1  3.5200us  3.5200us  3.5200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8651== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.73%  564.51ms        10  56.451ms  7.5410us  558.68ms  cudaMalloc
  2.44%  14.404ms      1445  9.9680us  2.9730us  264.30us  cudaMemcpyAsync
  0.93%  5.4743ms         5  1.0949ms  37.053us  4.7541ms  cudaFree
  0.54%  3.1816ms         6  530.27us  8.8880us  3.0916ms  cudaMemcpy
  0.22%  1.2816ms        90  14.239us     102ns  501.26us  cuDeviceGetAttribute
  0.06%  382.15us         1  382.15us  382.15us  382.15us  cuDeviceTotalMem
  0.03%  194.43us         6  32.404us  10.230us  48.177us  cudaLaunch
  0.01%  83.542us         1  83.542us  83.542us  83.542us  cuDeviceGetName
  0.01%  71.400us        24  2.9750us  1.7370us  7.7960us  cudaFuncGetAttributes
  0.00%  17.039us        18     946ns     268ns  3.3560us  cudaGetDevice
  0.00%  13.246us         6  2.2070us  1.0580us  3.4600us  cudaEventCreateWithFlags
  0.00%  11.616us         6  1.9360us     921ns  2.8680us  cudaEventRecord
  0.00%  11.206us         6  1.8670us     269ns  7.1980us  cudaSetupArgument
  0.00%  9.1070us         6  1.5170us     894ns  2.1930us  cudaEventDestroy
  0.00%  6.1290us         6  1.0210us     311ns  1.6470us  cudaConfigureCall
  0.00%  5.8250us        11     529ns     267ns  2.1490us  cudaDeviceGetAttribute
  0.00%  1.9070us         2     953ns     450ns  1.4570us  cuDeviceGetCount
  0.00%     441ns         2     220ns     146ns     295ns  cuDeviceGet
