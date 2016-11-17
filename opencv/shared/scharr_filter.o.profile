==3513== NVPROF is profiling process 3513, command: ./scharr_filter.o
==3513== Profiling application: ./scharr_filter.o
==3513== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 30.14%  105.32us        28  3.7610us     544ns  90.112us  [CUDA memcpy HtoD]
 26.21%  91.585us         1  91.585us  91.585us  91.585us  [CUDA memcpy DtoH]
 25.99%  90.817us         1  90.817us  90.817us  90.817us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 11.15%  38.972us         2  19.486us  19.246us  19.726us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.61%  19.597us         6  3.2660us     960ns  4.3230us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.91%  3.1700us         1  3.1700us  3.1700us  3.1700us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3513== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.34%  260.33ms        16  16.271ms  3.9310us  259.63ms  cudaMalloc
  0.21%  548.14us        10  54.814us  3.0880us  494.49us  cudaMemcpy
  0.12%  319.17us         7  45.595us  6.4520us  136.45us  cudaFree
  0.08%  204.48us         1  204.48us  204.48us  204.48us  cuDeviceTotalMem
  0.07%  172.11us        90  1.9120us      97ns  77.480us  cuDeviceGetAttribute
  0.06%  156.39us         1  156.39us  156.39us  156.39us  cudaGetDeviceProperties
  0.04%  115.24us        19  6.0650us  1.8510us  77.394us  cudaMemcpyAsync
  0.03%  87.293us        10  8.7290us  5.4720us  13.734us  cudaLaunch
  0.02%  56.097us        36  1.5580us  1.3340us  3.5310us  cudaFuncGetAttributes
  0.01%  17.007us         1  17.007us  17.007us  17.007us  cuDeviceGetName
  0.00%  10.154us        27     376ns     199ns  1.5240us  cudaGetDevice
  0.00%  8.3630us         9     929ns     585ns  1.5970us  cudaEventCreateWithFlags
  0.00%  6.9060us         9     767ns     511ns  1.4850us  cudaEventRecord
  0.00%  6.1230us         9     680ns     478ns  1.0480us  cudaEventDestroy
  0.00%  4.7650us        13     366ns     112ns  2.5300us  cudaSetupArgument
  0.00%  3.1780us        11     288ns     199ns     792ns  cudaDeviceGetAttribute
  0.00%  2.9550us        10     295ns     181ns     681ns  cudaConfigureCall
  0.00%  1.8390us         2     919ns     526ns  1.3130us  cuDeviceGetCount
  0.00%     385ns         2     192ns     178ns     207ns  cuDeviceGet
  0.00%     372ns         1     372ns     372ns     372ns  cudaGetLastError
