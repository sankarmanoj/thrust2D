==6250== NVPROF is profiling process 6250, command: ./sobel_filter.o
==6250== Profiling application: ./sobel_filter.o
==6250== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.24%  439.49us         2  219.74us  217.89us  221.60us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.29%  104.27us        28  3.7230us     576ns  73.557us  [CUDA memcpy HtoD]
 10.42%  76.021us         1  76.021us  76.021us  76.021us  [CUDA memcpy DtoH]
  5.23%  38.138us         1  38.138us  38.138us  38.138us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.74%  34.556us         2  17.278us  16.958us  17.598us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.32%  24.188us         8  3.0230us     992ns  4.8960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.43%  10.430us         2  5.2150us  5.1510us  5.2790us  [CUDA memcpy DtoD]
  0.34%  2.4630us         1  2.4630us  2.4630us  2.4630us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6250== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 90.79%  547.46ms        18  30.414ms  4.5500us  538.18ms  cudaMalloc
  6.64%  40.044ms         2  20.022ms  1.6706ms  38.374ms  cudaGetDeviceProperties
  1.49%  8.9653ms        90  99.614us     103ns  7.2542ms  cuDeviceGetAttribute
  0.70%  4.2485ms         1  4.2485ms  4.2485ms  4.2485ms  cuDeviceTotalMem
  0.11%  634.69us        19  33.404us  2.0950us  557.66us  cudaMemcpyAsync
  0.07%  447.12us         2  223.56us  222.58us  224.54us  cudaDeviceSynchronize
  0.05%  311.17us        12  25.930us  5.0260us  183.23us  cudaMemcpy
  0.05%  274.26us         7  39.180us  3.9840us  98.669us  cudaFree
  0.04%  262.10us        14  18.721us  5.7340us  30.590us  cudaLaunch
  0.02%  140.55us         1  140.55us  140.55us  140.55us  cuDeviceGetName
  0.02%  102.10us        50  2.0420us  1.3980us  4.8270us  cudaFuncGetAttributes
  0.00%  24.675us        38     649ns     215ns  3.0050us  cudaGetDevice
  0.00%  17.626us        12  1.4680us     599ns  2.2910us  cudaEventCreateWithFlags
  0.00%  14.719us        12  1.2260us     520ns  3.3080us  cudaEventRecord
  0.00%  11.431us        12     952ns     431ns  1.5790us  cudaEventDestroy
  0.00%  10.941us        22     497ns     116ns  4.1250us  cudaSetupArgument
  0.00%  10.331us        14     737ns     171ns  3.0400us  cudaConfigureCall
  0.00%  5.4900us        19     288ns     205ns     959ns  cudaDeviceGetAttribute
  0.00%  3.0710us         2  1.5350us  1.2990us  1.7720us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  2.2370us         2  1.1180us     740ns  1.4970us  cuDeviceGetCount
  0.00%  1.0330us         3     344ns     338ns     353ns  cudaGetLastError
  0.00%     556ns         2     278ns     256ns     300ns  cuDeviceGet
