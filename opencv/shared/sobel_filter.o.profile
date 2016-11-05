==7027== NVPROF is profiling process 7027, command: ./sobel_filter.o
==7027== Profiling application: ./sobel_filter.o
==7027== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.18%  437.85us         2  218.93us  217.50us  220.35us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 13.42%  97.649us        28  3.4870us     575ns  73.909us  [CUDA memcpy HtoD]
 10.56%  76.852us         1  76.852us  76.852us  76.852us  [CUDA memcpy DtoH]
  5.15%  37.498us         1  37.498us  37.498us  37.498us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.74%  34.458us         2  17.229us  17.053us  17.405us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.92%  28.507us         8  3.5630us     960ns  5.2150us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.51%  11.006us         2  5.5030us  5.4390us  5.5670us  [CUDA memcpy DtoD]
  0.52%  3.7750us         1  3.7750us  3.7750us  3.7750us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7027== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.81%  407.93ms        18  22.663ms  4.6560us  404.90ms  cudaMalloc
  0.92%  3.8227ms         2  1.9113ms  845.03us  2.9777ms  cudaGetDeviceProperties
  0.61%  2.5644ms         7  366.34us  4.5310us  2.1243ms  cudaFree
  0.21%  864.86us         2  432.43us  222.40us  642.45us  cudaDeviceSynchronize
  0.19%  795.43us        90  8.8380us     121ns  316.89us  cuDeviceGetAttribute
  0.08%  313.04us        12  26.086us  4.8510us  195.30us  cudaMemcpy
  0.05%  209.97us         1  209.97us  209.97us  209.97us  cuDeviceTotalMem
  0.04%  182.49us        14  13.034us  5.5520us  28.259us  cudaLaunch
  0.03%  138.69us        19  7.2990us  2.1420us  97.311us  cudaMemcpyAsync
  0.02%  93.061us        50  1.8610us  1.4420us  4.6180us  cudaFuncGetAttributes
  0.01%  50.214us         1  50.214us  50.214us  50.214us  cuDeviceGetName
  0.00%  19.606us        38     515ns     214ns  2.6990us  cudaGetDevice
  0.00%  15.280us        12  1.2730us     614ns  1.8930us  cudaEventCreateWithFlags
  0.00%  12.177us        12  1.0140us     619ns  1.5630us  cudaEventRecord
  0.00%  11.922us        12     993ns     522ns  1.8700us  cudaEventDestroy
  0.00%  9.9920us        22     454ns     140ns  4.0250us  cudaSetupArgument
  0.00%  6.4190us        14     458ns     193ns  1.0730us  cudaConfigureCall
  0.00%  5.6170us        19     295ns     208ns     992ns  cudaDeviceGetAttribute
  0.00%  2.8170us         2  1.4080us     888ns  1.9290us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  2.0860us         2  1.0430us     468ns  1.6180us  cuDeviceGetCount
  0.00%  1.0310us         2     515ns     345ns     686ns  cudaGetLastError
  0.00%     482ns         2     241ns     219ns     263ns  cuDeviceGet
