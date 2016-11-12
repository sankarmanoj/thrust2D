==21890== NVPROF is profiling process 21890, command: ./gaussian_filter.o
==21890== Profiling application: ./gaussian_filter.o
==21890== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 71.23%  2.5156ms         1  2.5156ms  2.5156ms  2.5156ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 14.85%  524.41us       728     720ns     544ns  94.825us  [CUDA memcpy HtoD]
 13.42%  473.77us       723     655ns     320ns  98.121us  [CUDA memcpy DtoH]
  0.41%  14.370us         4  3.5920us  2.3680us  4.9600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.10%  3.3930us         1  3.3930us  3.3930us  3.3930us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==21890== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.58%  735.93ms        10  73.593ms  5.3710us  734.16ms  cudaMalloc
  2.58%  19.866ms        90  220.73us     143ns  13.166ms  cuDeviceGetAttribute
  1.15%  8.8221ms      1445  6.1050us  1.8330us  580.70us  cudaMemcpyAsync
  0.37%  2.8783ms         6  479.71us  4.9960us  2.8294ms  cudaMemcpy
  0.19%  1.4801ms         5  296.03us  33.842us  1.0380ms  cudaFree
  0.07%  547.93us         1  547.93us  547.93us  547.93us  cuDeviceTotalMem
  0.03%  245.94us         1  245.94us  245.94us  245.94us  cuDeviceGetName
  0.02%  130.64us         6  21.772us  7.5210us  31.647us  cudaLaunch
  0.01%  48.045us        24  2.0010us  1.3410us  5.2630us  cudaFuncGetAttributes
  0.00%  11.450us        18     636ns     204ns  2.5270us  cudaGetDevice
  0.00%  9.3680us         6  1.5610us     907ns  2.1370us  cudaEventCreateWithFlags
  0.00%  8.3100us         6  1.3850us     650ns  1.9940us  cudaEventRecord
  0.00%  6.2340us         6  1.0390us     647ns  1.4040us  cudaEventDestroy
  0.00%  5.9830us         6     997ns     175ns  2.9140us  cudaSetupArgument
  0.00%  3.6420us         6     607ns     270ns     982ns  cudaConfigureCall
  0.00%  3.5600us        11     323ns     209ns     883ns  cudaDeviceGetAttribute
  0.00%  2.6610us         2  1.3300us     455ns  2.2060us  cuDeviceGetCount
  0.00%     707ns         2     353ns     230ns     477ns  cuDeviceGet
