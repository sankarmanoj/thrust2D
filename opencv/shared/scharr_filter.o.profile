==7056== NVPROF is profiling process 7056, command: ./scharr_filter.o
==7056== Profiling application: ./scharr_filter.o
==7056== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.30%  441.79us         2  220.89us  218.78us  223.01us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.27%  104.59us        28  3.7350us     576ns  72.597us  [CUDA memcpy HtoD]
 10.08%  73.876us         1  73.876us  73.876us  73.876us  [CUDA memcpy DtoH]
  5.18%  37.946us         1  37.946us  37.946us  37.946us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.69%  34.364us         2  17.182us  16.862us  17.502us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.73%  27.325us         8  3.4150us     992ns  4.8320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.41%  10.366us         2  5.1830us  5.1510us  5.2150us  [CUDA memcpy DtoD]
  0.33%  2.4320us         1  2.4320us  2.4320us  2.4320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7056== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.14%  275.66ms        18  15.314ms  4.4220us  274.26ms  cudaMalloc
  0.19%  531.17us         2  265.58us  259.16us  272.00us  cudaGetDeviceProperties
  0.16%  454.60us         2  227.30us  225.26us  229.34us  cudaDeviceSynchronize
  0.11%  308.81us        90  3.4310us     100ns  118.23us  cuDeviceGetAttribute
  0.10%  273.05us         7  39.006us  4.0440us  113.37us  cudaFree
  0.10%  271.37us        12  22.614us  4.6670us  202.50us  cudaMemcpy
  0.07%  190.30us         1  190.30us  190.30us  190.30us  cuDeviceTotalMem
  0.04%  108.14us        14  7.7240us  5.1640us  14.973us  cudaLaunch
  0.03%  86.412us        19  4.5480us  1.8790us  49.731us  cudaMemcpyAsync
  0.03%  75.117us        50  1.5020us  1.3290us  2.9000us  cudaFuncGetAttributes
  0.01%  26.192us         1  26.192us  26.192us  26.192us  cuDeviceGetName
  0.00%  12.149us        38     319ns     204ns  1.1950us  cudaGetDevice
  0.00%  9.7040us        12     808ns     593ns  1.3960us  cudaEventCreateWithFlags
  0.00%  8.2470us        12     687ns     482ns  1.1600us  cudaEventRecord
  0.00%  7.5380us        22     342ns     115ns  3.4740us  cudaSetupArgument
  0.00%  6.8470us        12     570ns     422ns     897ns  cudaEventDestroy
  0.00%  4.5760us        19     240ns     197ns     661ns  cudaDeviceGetAttribute
  0.00%  3.4940us        14     249ns     148ns     627ns  cudaConfigureCall
  0.00%  1.3700us         2     685ns     581ns     789ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.1960us         2     598ns     165ns  1.0310us  cuDeviceGetCount
  0.00%     579ns         2     289ns     206ns     373ns  cudaGetLastError
  0.00%     287ns         2     143ns     105ns     182ns  cuDeviceGet
