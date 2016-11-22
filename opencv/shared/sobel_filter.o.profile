==28919== NVPROF is profiling process 28919, command: ./sobel_filter.o
==28919== Profiling application: ./sobel_filter.o
==28919== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 25.42%  80.128us         7  11.446us  1.1840us  72.864us  [CUDA memcpy HtoD]
 23.45%  73.920us         1  73.920us  73.920us  73.920us  [CUDA memcpy DtoH]
 11.69%  36.832us         4  9.2080us  7.9040us  10.528us  [CUDA memcpy DtoA]
 11.50%  36.256us         1  36.256us  36.256us  36.256us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 10.88%  34.304us         2  17.152us  16.864us  17.440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.49%  20.448us         4  5.1120us  4.5120us  5.6000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.30%  16.704us         2  8.3520us  7.9040us  8.8000us  thrust::convolutionColumnsKernel(float*, int, int)
  5.26%  16.576us         2  8.2880us  7.9680us  8.6080us  thrust::convolutionRowsKernel(float*, int, int)

==28919== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.06%  208.77ms        10  20.877ms  4.3600us  207.70ms  cudaMalloc
  0.32%  664.45us         2  332.23us  329.71us  334.74us  cudaMallocArray
  0.14%  286.71us        90  3.1850us     150ns  110.54us  cuDeviceGetAttribute
  0.13%  265.58us         1  265.58us  265.58us  265.58us  cuDeviceTotalMem
  0.11%  227.49us         5  45.497us  5.4940us  200.48us  cudaMemcpy
  0.09%  198.48us         4  49.620us  6.3760us  102.91us  cudaFree
  0.04%  92.963us        11  8.4510us  4.3020us  13.933us  cudaLaunch
  0.03%  61.271us         4  15.317us  7.7950us  31.749us  cudaMemcpyToArray
  0.02%  44.246us         1  44.246us  44.246us  44.246us  cudaMemcpyAsync
  0.02%  42.131us        28  1.5040us  1.3330us  3.0680us  cudaFuncGetAttributes
  0.01%  26.119us         1  26.119us  26.119us  26.119us  cuDeviceGetName
  0.01%  15.026us         2  7.5130us  6.8980us  8.1280us  cudaMemcpyToSymbol
  0.00%  7.4790us        19     393ns     109ns  3.2030us  cudaSetupArgument
  0.00%  7.2810us         4  1.8200us  1.2830us  2.8680us  cudaBindTextureToArray
  0.00%  6.8020us        21     323ns     199ns  1.1900us  cudaGetDevice
  0.00%  6.1060us         7     872ns     491ns  1.6410us  cudaEventCreateWithFlags
  0.00%  5.1900us         7     741ns     424ns  1.2840us  cudaEventRecord
  0.00%  4.4270us         7     632ns     448ns     984ns  cudaEventDestroy
  0.00%  3.1980us        11     290ns     169ns     846ns  cudaConfigureCall
  0.00%  3.0890us        11     280ns     211ns     787ns  cudaDeviceGetAttribute
  0.00%  2.8420us         4     710ns     608ns     842ns  cudaUnbindTexture
  0.00%  2.2590us         4     564ns     438ns     803ns  cudaGetChannelDesc
  0.00%  1.5650us         2     782ns     212ns  1.3530us  cuDeviceGetCount
  0.00%     436ns         2     218ns     152ns     284ns  cuDeviceGet
  0.00%     388ns         2     194ns     128ns     260ns  cudaCreateChannelDesc
