==13096== NVPROF is profiling process 13096, command: ./scharr_filter.o
==13096== Profiling application: ./scharr_filter.o
==13096== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.19%  150.81us         2  75.405us  74.461us  76.350us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 25.43%  115.55us        30  3.8510us     576ns  81.213us  [CUDA memcpy HtoD]
 18.13%  82.365us         1  82.365us  82.365us  82.365us  [CUDA memcpy DtoH]
  9.17%  41.663us         1  41.663us  41.663us  41.663us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.53%  38.783us         2  19.391us  19.072us  19.711us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.68%  21.246us         6  3.5410us     992ns  5.1510us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.88%  4.0000us         1  4.0000us  4.0000us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==13096== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.07%  216.74ms        18  12.041ms  4.0530us  215.21ms  cudaMalloc
  0.23%  502.94us         2  251.47us  246.10us  256.83us  cudaGetDeviceProperties
  0.16%  346.67us        12  28.888us  5.0440us  281.78us  cudaMemcpy
  0.15%  319.74us         7  45.676us  4.2100us  102.93us  cudaFree
  0.14%  316.06us        90  3.5110us      98ns  140.42us  cuDeviceGetAttribute
  0.09%  190.17us         1  190.17us  190.17us  190.17us  cuDeviceTotalMem
  0.05%  104.50us        19  5.4990us  1.9370us  67.158us  cudaMemcpyAsync
  0.04%  95.977us        12  7.9980us  5.1790us  12.637us  cudaLaunch
  0.03%  62.623us        40  1.5650us  1.3600us  3.2650us  cudaFuncGetAttributes
  0.01%  27.865us         1  27.865us  27.865us  27.865us  cuDeviceGetName
  0.01%  21.333us        10  2.1330us     477ns  14.835us  cudaEventRecord
  0.00%  10.059us        30     335ns     201ns  1.2500us  cudaGetDevice
  0.00%  8.8260us        10     882ns     584ns  1.4420us  cudaEventCreateWithFlags
  0.00%  6.6070us        18     367ns     111ns  3.2440us  cudaSetupArgument
  0.00%  6.3530us        10     635ns     377ns     968ns  cudaEventDestroy
  0.00%  3.5110us        12     292ns     161ns     937ns  cudaConfigureCall
  0.00%  2.9720us        11     270ns     199ns     775ns  cudaDeviceGetAttribute
  0.00%  1.5830us         2     791ns     229ns  1.3540us  cuDeviceGetCount
  0.00%     342ns         1     342ns     342ns     342ns  cudaGetLastError
  0.00%     299ns         2     149ns     130ns     169ns  cuDeviceGet
