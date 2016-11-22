==28836== NVPROF is profiling process 28836, command: ./scharr_filter.o
==28836== Profiling application: ./scharr_filter.o
==28836== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 25.81%  80.192us         7  11.456us  1.2160us  72.896us  [CUDA memcpy HtoD]
 23.79%  73.921us         1  73.921us  73.921us  73.921us  [CUDA memcpy DtoH]
 11.93%  37.056us         4  9.2640us  7.8720us  10.848us  [CUDA memcpy DtoA]
 11.59%  36.000us         1  36.000us  36.000us  36.000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 11.07%  34.400us         2  17.200us  16.992us  17.408us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.46%  16.960us         4  4.2400us  3.6160us  4.8000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.20%  16.160us         2  8.0800us  7.9040us  8.2560us  thrust::convolutionRowsKernel(float*, int, int)
  5.16%  16.032us         2  8.0160us  7.7120us  8.3200us  thrust::convolutionColumnsKernel(float*, int, int)

==28836== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.77%  214.66ms        10  21.466ms  4.7380us  213.61ms  cudaMalloc
  0.32%  690.79us         2  345.39us  341.97us  348.82us  cudaMallocArray
  0.26%  568.82us         1  568.82us  568.82us  568.82us  cuDeviceTotalMem
  0.25%  554.03us        90  6.1550us     353ns  215.49us  cuDeviceGetAttribute
  0.11%  232.25us         5  46.449us  5.0330us  205.59us  cudaMemcpy
  0.10%  219.19us         4  54.796us  7.2400us  117.52us  cudaFree
  0.04%  94.879us        11  8.6250us  4.7790us  13.346us  cudaLaunch
  0.03%  69.809us         1  69.809us  69.809us  69.809us  cudaMemcpyAsync
  0.03%  63.244us         4  15.811us  7.8540us  32.780us  cudaMemcpyToArray
  0.02%  49.120us         1  49.120us  49.120us  49.120us  cuDeviceGetName
  0.02%  48.390us        28  1.7280us  1.4050us  7.4600us  cudaFuncGetAttributes
  0.01%  14.823us         2  7.4110us  7.0280us  7.7950us  cudaMemcpyToSymbol
  0.00%  8.1520us        21     388ns     263ns  1.3860us  cudaGetDevice
  0.00%  7.5560us         4  1.8890us  1.3900us  2.9040us  cudaBindTextureToArray
  0.00%  6.7900us        19     357ns     118ns  3.6880us  cudaSetupArgument
  0.00%  6.1150us         7     873ns     517ns  1.4940us  cudaEventCreateWithFlags
  0.00%  5.8230us         4  1.4550us     460ns  4.3350us  cudaGetChannelDesc
  0.00%  5.1870us         7     741ns     478ns  1.3570us  cudaEventRecord
  0.00%  4.4330us         7     633ns     414ns  1.1020us  cudaEventDestroy
  0.00%  3.2540us         2  1.6270us     443ns  2.8110us  cuDeviceGetCount
  0.00%  3.2350us        11     294ns     220ns     785ns  cudaDeviceGetAttribute
  0.00%  3.0350us         4     758ns     655ns     858ns  cudaUnbindTexture
  0.00%  2.9270us        11     266ns     153ns     767ns  cudaConfigureCall
  0.00%     961ns         2     480ns     338ns     623ns  cuDeviceGet
  0.00%     314ns         2     157ns     124ns     190ns  cudaCreateChannelDesc
