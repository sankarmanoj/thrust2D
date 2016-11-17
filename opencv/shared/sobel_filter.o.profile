==25631== NVPROF is profiling process 25631, command: ./sobel_filter.o
==25631== Profiling application: ./sobel_filter.o
==25631== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.80%  190.18us         1  190.18us  190.18us  190.18us  [CUDA memcpy DtoH]
 28.09%  162.89us         2  81.445us  80.996us  81.894us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 21.26%  123.27us        30  4.1090us     544ns  105.79us  [CUDA memcpy HtoD]
  7.29%  42.276us         1  42.276us  42.276us  42.276us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.73%  39.041us         2  19.520us  19.056us  19.985us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.27%  18.962us         6  3.1600us     961ns  4.4200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.55%  3.2020us         1  3.2020us  3.2020us  3.2020us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25631== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.59%  358.00ms        18  19.889ms  4.4170us  357.24ms  cudaMalloc
  0.77%  2.7945ms        90  31.050us     100ns  2.6266ms  cuDeviceGetAttribute
  0.23%  818.61us        12  68.217us  3.3860us  747.62us  cudaMemcpy
  0.08%  296.89us         2  148.44us  131.45us  165.44us  cudaGetDeviceProperties
  0.07%  269.65us         7  38.521us  5.0150us  138.59us  cudaFree
  0.07%  248.80us         1  248.80us  248.80us  248.80us  cuDeviceGetName
  0.07%  239.32us         1  239.32us  239.32us  239.32us  cuDeviceTotalMem
  0.05%  190.90us        19  10.047us  2.0840us  148.75us  cudaMemcpyAsync
  0.04%  134.14us        12  11.178us  6.1750us  33.087us  cudaLaunch
  0.02%  69.999us        40  1.7490us  1.3750us  5.8980us  cudaFuncGetAttributes
  0.00%  11.480us        30     382ns     203ns  1.5490us  cudaGetDevice
  0.00%  11.474us        10  1.1470us     649ns  2.2610us  cudaEventCreateWithFlags
  0.00%  8.4600us        10     846ns     533ns  1.7900us  cudaEventRecord
  0.00%  6.9570us        10     695ns     448ns  1.2420us  cudaEventDestroy
  0.00%  6.7840us        18     376ns     101ns  3.2620us  cudaSetupArgument
  0.00%  5.0030us         2  2.5010us  2.4420us  2.5610us  cuDeviceGetCount
  0.00%  3.9640us        12     330ns     158ns  1.0570us  cudaConfigureCall
  0.00%  3.7350us        11     339ns     201ns  1.1910us  cudaDeviceGetAttribute
  0.00%     873ns         1     873ns     873ns     873ns  cudaGetLastError
  0.00%     805ns         2     402ns     349ns     456ns  cuDeviceGet
