==12772== NVPROF is profiling process 12772, command: ./scharr_filter.o
==12772== Profiling application: ./scharr_filter.o
==12772== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 31.41%  154.72us         2  77.357us  77.150us  77.565us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 25.18%  124.03us        30  4.1340us     544ns  107.23us  [CUDA memcpy HtoD]
 22.09%  108.80us         1  108.80us  108.80us  108.80us  [CUDA memcpy DtoH]
  8.69%  42.783us         1  42.783us  42.783us  42.783us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.92%  39.007us         2  19.503us  19.168us  19.839us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.07%  20.032us         6  3.3380us     992ns  5.3120us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.65%  3.2000us         1  3.2000us  3.2000us  3.2000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12772== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.01%  234.61ms        18  13.034ms  4.8860us  233.43ms  cudaMalloc
  0.31%  739.10us        12  61.591us  3.7670us  629.52us  cudaMemcpy
  0.16%  387.87us         2  193.93us  192.63us  195.23us  cudaGetDeviceProperties
  0.10%  225.96us        19  11.892us  1.9410us  153.80us  cudaMemcpyAsync
  0.09%  224.36us         7  32.051us  3.9890us  76.496us  cudaFree
  0.09%  217.32us        12  18.109us  6.7200us  56.278us  cudaLaunch
  0.08%  189.36us        90  2.1040us     100ns  75.555us  cuDeviceGetAttribute
  0.07%  176.44us         1  176.44us  176.44us  176.44us  cuDeviceTotalMem
  0.04%  98.542us        40  2.4630us  1.3580us  7.1620us  cudaFuncGetAttributes
  0.01%  28.735us        10  2.8730us     991ns  6.8030us  cudaEventCreateWithFlags
  0.01%  16.205us         1  16.205us  16.205us  16.205us  cuDeviceGetName
  0.00%  11.666us        30     388ns     201ns  1.2700us  cudaGetDevice
  0.00%  8.8840us        10     888ns     642ns  1.8420us  cudaEventRecord
  0.00%  7.8130us        12     651ns     170ns  4.1690us  cudaConfigureCall
  0.00%  7.7580us        10     775ns     573ns  1.1620us  cudaEventDestroy
  0.00%  5.8040us        18     322ns     112ns  2.4320us  cudaSetupArgument
  0.00%  3.3230us        11     302ns     197ns     910ns  cudaDeviceGetAttribute
  0.00%  1.6530us         2     826ns     450ns  1.2030us  cuDeviceGetCount
  0.00%     587ns         1     587ns     587ns     587ns  cudaGetLastError
  0.00%     371ns         2     185ns     156ns     215ns  cuDeviceGet
