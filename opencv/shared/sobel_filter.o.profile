==7295== NVPROF is profiling process 7295, command: ./sobel_filter.o
==7295== Profiling application: ./sobel_filter.o
==7295== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.04%  398.02us         2  199.01us  197.95us  200.06us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 15.94%  113.22us        28  4.0430us     512ns  98.656us  [CUDA memcpy HtoD]
 13.27%  94.240us         1  94.240us  94.240us  94.240us  [CUDA memcpy DtoH]
  4.93%  35.008us         1  35.008us  35.008us  35.008us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.40%  31.233us         2  15.616us  15.393us  15.840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.76%  26.688us         8  3.3360us     864ns  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.37%  9.6960us         2  4.8480us  4.6080us  5.0880us  [CUDA memcpy DtoD]
  0.31%  2.1760us         1  2.1760us  2.1760us  2.1760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7295== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.05%  278.82ms        18  15.490ms  5.6440us  277.93ms  cudaMalloc
  0.19%  534.94us        12  44.578us  6.6700us  433.78us  cudaMemcpy
  0.14%  403.27us         2  201.64us  201.09us  202.18us  cudaDeviceSynchronize
  0.14%  389.57us         7  55.652us  4.4090us  175.11us  cudaFree
  0.12%  345.54us         2  172.77us  166.86us  178.68us  cudaGetDeviceProperties
  0.07%  209.81us        90  2.3310us     152ns  76.300us  cuDeviceGetAttribute
  0.06%  180.27us         1  180.27us  180.27us  180.27us  cuDeviceTotalMem
  0.06%  170.85us        14  12.203us  7.8810us  27.233us  cudaLaunch
  0.06%  169.66us        19  8.9290us  3.1640us  109.07us  cudaMemcpyAsync
  0.05%  147.64us        50  2.9520us  2.4630us  5.7160us  cudaFuncGetAttributes
  0.01%  22.219us         1  22.219us  22.219us  22.219us  cuDeviceGetName
  0.01%  20.653us        38     543ns     361ns  1.7550us  cudaGetDevice
  0.01%  14.791us        12  1.2320us     979ns  1.9060us  cudaEventCreateWithFlags
  0.00%  13.511us        12  1.1250us     830ns  2.1710us  cudaEventRecord
  0.00%  11.791us        12     982ns     747ns  1.5660us  cudaEventDestroy
  0.00%  9.8590us        22     448ns     208ns  3.7780us  cudaSetupArgument
  0.00%  8.5540us        19     450ns     389ns  1.0890us  cudaDeviceGetAttribute
  0.00%  5.5980us        14     399ns     260ns  1.1730us  cudaConfigureCall
  0.00%  2.2990us         2  1.1490us  1.0270us  1.2720us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  2.0500us         2  1.0250us     629ns  1.4210us  cuDeviceGetCount
  0.00%     769ns         2     384ns     328ns     441ns  cudaGetLastError
  0.00%     738ns         2     369ns     291ns     447ns  cuDeviceGet
