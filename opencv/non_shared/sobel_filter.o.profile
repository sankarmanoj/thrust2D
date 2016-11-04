==3569== NVPROF is profiling process 3569, command: ./sobel_filter.o
==3569== Profiling application: ./sobel_filter.o
==3569== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.62%  437.56us         2  218.78us  217.61us  219.95us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.18%  104.07us        28  3.7160us     576ns  72.709us  [CUDA memcpy HtoD]
 10.60%  77.765us         1  77.765us  77.765us  77.765us  [CUDA memcpy DtoH]
  5.18%  38.019us         1  38.019us  38.019us  38.019us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.71%  34.594us         2  17.297us  17.089us  17.505us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.72%  27.329us         8  3.4160us     960ns  4.8010us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.47%  10.753us         2  5.3760us  5.3120us  5.4410us  [CUDA memcpy DtoD]
  0.51%  3.7760us         1  3.7760us  3.7760us  3.7760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3569== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.67%  274.18ms        18  15.232ms  4.1460us  272.72ms  cudaMalloc
  0.31%  863.29us         1  863.29us  863.29us  863.29us  cuDeviceTotalMem
  0.26%  725.11us        90  8.0560us     503ns  273.59us  cuDeviceGetAttribute
  0.19%  537.39us         2  268.69us  265.34us  272.05us  cudaGetDeviceProperties
  0.16%  449.94us         2  224.97us  223.85us  226.09us  cudaDeviceSynchronize
  0.13%  359.84us        12  29.986us  4.7300us  289.14us  cudaMemcpy
  0.10%  290.37us         7  41.482us  4.0560us  114.77us  cudaFree
  0.05%  150.24us        19  7.9070us  2.0100us  110.62us  cudaMemcpyAsync
  0.04%  110.07us        14  7.8620us  5.5220us  13.827us  cudaLaunch
  0.03%  80.081us        50  1.6010us  1.4100us  3.4110us  cudaFuncGetAttributes
  0.03%  70.885us         1  70.885us  70.885us  70.885us  cuDeviceGetName
  0.00%  12.753us        38     335ns     203ns  1.3060us  cudaGetDevice
  0.00%  10.225us        12     852ns     613ns  1.4990us  cudaEventCreateWithFlags
  0.00%  8.6450us        12     720ns     519ns  1.2700us  cudaEventRecord
  0.00%  7.4430us        12     620ns     431ns  1.2740us  cudaEventDestroy
  0.00%  6.4980us        22     295ns     114ns  2.5420us  cudaSetupArgument
  0.00%  5.2600us         2  2.6300us  1.0430us  4.2170us  cuDeviceGetCount
  0.00%  4.6950us        19     247ns     203ns     643ns  cudaDeviceGetAttribute
  0.00%  3.8180us        14     272ns     172ns     795ns  cudaConfigureCall
  0.00%  1.5330us         2     766ns     656ns     877ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.5100us         2     755ns     556ns     954ns  cuDeviceGet
  0.00%  1.2260us         3     408ns     198ns     726ns  cudaGetLastError
