==10752== NVPROF is profiling process 10752, command: ./sobel_filter.o
==10752== Profiling application: ./sobel_filter.o
==10752== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.38%  438.82us         2  219.41us  218.60us  220.23us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 12.95%  94.146us        28  3.3620us     544ns  73.858us  [CUDA memcpy HtoD]
 10.17%  73.921us         1  73.921us  73.921us  73.921us  [CUDA memcpy DtoH]
  5.20%  37.793us         1  37.793us  37.793us  37.793us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.76%  34.625us         2  17.312us  17.057us  17.568us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.20%  30.530us         8  3.8160us     992ns  5.1520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.84%  13.345us         2  6.6720us  5.4730us  7.8720us  [CUDA memcpy DtoD]
  0.49%  3.5840us         1  3.5840us  3.5840us  3.5840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10752== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.71%  587.58ms        18  32.644ms  4.2700us  584.06ms  cudaMalloc
  2.25%  13.786ms        90  153.18us     130ns  7.7358ms  cuDeviceGetAttribute
  1.00%  6.1470ms         7  878.15us  5.1790us  2.6651ms  cudaFree
  0.42%  2.5714ms         1  2.5714ms  2.5714ms  2.5714ms  cuDeviceTotalMem
  0.40%  2.4326ms         2  1.2163ms  1.0884ms  1.3441ms  cudaGetDeviceProperties
  0.08%  485.76us         2  242.88us  224.35us  261.41us  cudaDeviceSynchronize
  0.06%  388.56us        12  32.380us  4.9780us  256.80us  cudaMemcpy
  0.03%  166.97us        14  11.926us  5.5080us  28.183us  cudaLaunch
  0.02%  116.67us        19  6.1400us  2.0410us  75.167us  cudaMemcpyAsync
  0.01%  90.003us        50  1.8000us  1.3910us  4.3520us  cudaFuncGetAttributes
  0.01%  85.602us         1  85.602us  85.602us  85.602us  cuDeviceGetName
  0.00%  15.825us        38     416ns     214ns  1.5680us  cudaGetDevice
  0.00%  15.409us        12  1.2840us     624ns  3.3950us  cudaEventCreateWithFlags
  0.00%  11.072us        12     922ns     534ns  1.6660us  cudaEventRecord
  0.00%  9.2950us        22     422ns     112ns  4.5070us  cudaSetupArgument
  0.00%  8.9020us        12     741ns     485ns  1.1380us  cudaEventDestroy
  0.00%  5.5340us        19     291ns     206ns  1.0210us  cudaDeviceGetAttribute
  0.00%  4.8830us        14     348ns     172ns     996ns  cudaConfigureCall
  0.00%  2.9610us         2  1.4800us  1.0740us  1.8870us  cuDeviceGetCount
  0.00%  2.1380us         2  1.0690us  1.0160us  1.1220us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     752ns         2     376ns     323ns     429ns  cudaGetLastError
  0.00%     721ns         2     360ns     284ns     437ns  cuDeviceGet
