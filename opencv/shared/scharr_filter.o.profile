==7282== NVPROF is profiling process 7282, command: ./scharr_filter.o
==7282== Profiling application: ./scharr_filter.o
==7282== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.30%  439.27us         2  219.63us  219.14us  220.13us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 16.48%  130.91us        28  4.6750us     544ns  115.59us  [CUDA memcpy HtoD]
 13.17%  104.64us         1  104.64us  104.64us  104.64us  [CUDA memcpy DtoH]
  4.85%  38.496us         1  38.496us  38.496us  38.496us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.46%  35.424us         2  17.712us  16.960us  18.464us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.57%  28.320us         8  3.5400us     960ns  5.3440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.86%  14.752us         2  7.3760us  5.6320us  9.1200us  [CUDA memcpy DtoD]
  0.32%  2.5280us         1  2.5280us  2.5280us  2.5280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7282== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.77%  342.76ms        18  19.042ms  4.0770us  339.05ms  cudaMalloc
  4.57%  16.718ms        90  185.76us     101ns  7.8759ms  cuDeviceGetAttribute
  0.53%  1.9501ms         1  1.9501ms  1.9501ms  1.9501ms  cuDeviceTotalMem
  0.38%  1.4061ms         1  1.4061ms  1.4061ms  1.4061ms  cuDeviceGetName
  0.20%  713.71us        12  59.475us  5.1930us  459.28us  cudaMemcpy
  0.18%  658.06us         7  94.008us  6.0300us  314.62us  cudaFree
  0.14%  499.46us         2  249.73us  222.59us  276.88us  cudaDeviceSynchronize
  0.08%  310.47us         2  155.24us  131.90us  178.57us  cudaGetDeviceProperties
  0.05%  184.31us        14  13.164us  6.2940us  36.400us  cudaLaunch
  0.05%  175.47us        19  9.2350us  1.8490us  138.16us  cudaMemcpyAsync
  0.03%  91.603us        50  1.8320us  1.3470us  8.0790us  cudaFuncGetAttributes
  0.00%  16.111us        38     423ns     205ns  2.2420us  cudaGetDevice
  0.00%  12.549us        12  1.0450us     664ns  1.9520us  cudaEventCreateWithFlags
  0.00%  11.550us        22     525ns     113ns  5.4380us  cudaSetupArgument
  0.00%  10.195us        12     849ns     467ns  1.6340us  cudaEventRecord
  0.00%  8.8430us        12     736ns     437ns  1.2430us  cudaEventDestroy
  0.00%  6.0340us        19     317ns     203ns  1.6220us  cudaDeviceGetAttribute
  0.00%  4.7030us         2  2.3510us     634ns  4.0690us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  4.6310us        14     330ns     161ns     977ns  cudaConfigureCall
  0.00%  3.0790us         2  1.5390us     528ns  2.5510us  cuDeviceGetCount
  0.00%     771ns         2     385ns     185ns     586ns  cuDeviceGet
  0.00%     676ns         2     338ns     247ns     429ns  cudaGetLastError
