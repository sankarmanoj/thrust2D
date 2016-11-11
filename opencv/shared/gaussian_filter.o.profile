==6923== NVPROF is profiling process 6923, command: ./gaussian_filter.o
==6923== Profiling application: ./gaussian_filter.o
==6923== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.96%  164.00ms         1  164.00ms  164.00ms  164.00ms  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, convolutionFunctor)
  1.44%  2.4171ms         4  604.28us  169.37us  751.56us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.45%  750.82us         1  750.82us  750.82us  750.82us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.08%  126.77us        58  2.1850us     544ns  94.929us  [CUDA memcpy HtoD]
  0.07%  113.21us        51  2.2190us     320ns  88.048us  [CUDA memcpy DtoH]

==6923== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.60%  3.67502s        12  306.25ms  4.3660us  3.67457s  cudaMalloc
  4.28%  164.39ms         8  20.549ms  3.1960us  164.27ms  cudaMemcpy
  0.08%  3.1788ms         5  635.77us  169.25us  754.76us  cudaDeviceSynchronize
  0.01%  538.94us       101  5.3360us  1.9070us  96.607us  cudaMemcpyAsync
  0.01%  295.23us         6  49.204us  7.3510us  245.17us  cudaLaunch
  0.01%  269.47us        90  2.9940us      99ns  84.412us  cuDeviceGetAttribute
  0.01%  214.35us         5  42.870us  7.8590us  116.12us  cudaFree
  0.00%  170.09us         1  170.09us  170.09us  170.09us  cudaGetDeviceProperties
  0.00%  165.49us         1  165.49us  165.49us  165.49us  cuDeviceTotalMem
  0.00%  32.054us        20  1.6020us  1.3200us  3.5560us  cudaFuncGetAttributes
  0.00%  19.797us         1  19.797us  19.797us  19.797us  cuDeviceGetName
  0.00%  6.2480us        15     416ns     199ns  1.6900us  cudaGetDevice
  0.00%  4.9960us         5     999ns     838ns  1.4120us  cudaEventCreateWithFlags
  0.00%  4.7370us         5     947ns     759ns  1.5320us  cudaEventRecord
  0.00%  3.9950us         9     443ns     111ns  2.5020us  cudaSetupArgument
  0.00%  3.7460us         5     749ns     651ns  1.0160us  cudaEventDestroy
  0.00%  3.1520us        11     286ns     198ns     810ns  cudaDeviceGetAttribute
  0.00%  2.3450us         6     390ns     226ns     770ns  cudaConfigureCall
  0.00%  1.4470us         2     723ns     251ns  1.1960us  cuDeviceGetCount
  0.00%     471ns         1     471ns     471ns     471ns  cudaGetLastError
  0.00%     333ns         2     166ns     135ns     198ns  cuDeviceGet
