==10791== NVPROF is profiling process 10791, command: ./scharr_filter.o
==10791== Profiling application: ./scharr_filter.o
==10791== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.02%  435.75us         2  217.88us  217.19us  218.56us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.07%  102.15us        28  3.6480us     576ns  73.922us  [CUDA memcpy HtoD]
 10.18%  73.889us         1  73.889us  73.889us  73.889us  [CUDA memcpy DtoH]
  5.23%  37.953us         1  37.953us  37.953us  37.953us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.72%  34.241us         2  17.120us  17.057us  17.184us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.82%  27.745us         8  3.4680us     960ns  5.0240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.45%  10.496us         2  5.2480us  5.0560us  5.4400us  [CUDA memcpy DtoD]
  0.52%  3.7440us         1  3.7440us  3.7440us  3.7440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10791== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.87%  575.13ms        18  31.952ms  4.9000us  561.75ms  cudaMalloc
  3.38%  20.492ms        90  227.69us     105ns  10.939ms  cuDeviceGetAttribute
  1.05%  6.3401ms         2  3.1701ms  944.41us  5.3957ms  cudaGetDeviceProperties
  0.20%  1.2312ms        14  87.939us  6.5630us  515.82us  cudaLaunch
  0.16%  977.93us         1  977.93us  977.93us  977.93us  cuDeviceTotalMem
  0.10%  590.68us        50  11.813us  1.4080us  474.80us  cudaFuncGetAttributes
  0.07%  445.59us         2  222.79us  222.74us  222.84us  cudaDeviceSynchronize
  0.06%  353.67us        12  29.472us  5.2470us  189.36us  cudaMemcpy
  0.05%  286.69us         7  40.955us  4.0770us  111.96us  cudaFree
  0.03%  168.80us        19  8.8840us  2.1040us  93.116us  cudaMemcpyAsync
  0.02%  103.96us         1  103.96us  103.96us  103.96us  cuDeviceGetName
  0.00%  27.430us        38     721ns     222ns  2.8530us  cudaGetDevice
  0.00%  20.755us        12  1.7290us     645ns  3.8910us  cudaEventCreateWithFlags
  0.00%  14.757us        12  1.2290us     524ns  1.8260us  cudaEventRecord
  0.00%  13.607us        12  1.1330us     461ns  1.8640us  cudaEventDestroy
  0.00%  10.728us        22     487ns     117ns  4.0520us  cudaSetupArgument
  0.00%  9.5850us        14     684ns     166ns  1.3310us  cudaConfigureCall
  0.00%  5.6020us        19     294ns     203ns     942ns  cudaDeviceGetAttribute
  0.00%  2.3910us         2  1.1950us  1.1270us  1.2640us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.9660us         2     983ns     442ns  1.5240us  cuDeviceGetCount
  0.00%     653ns         2     326ns     315ns     338ns  cudaGetLastError
  0.00%     540ns         2     270ns     201ns     339ns  cuDeviceGet
