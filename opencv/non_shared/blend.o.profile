==22927== NVPROF is profiling process 22927, command: ./blend.o
==22927== Profiling application: ./blend.o
==22927== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.60%  45.376us         5  9.0750us  1.2160us  21.472us  [CUDA memcpy HtoD]
 35.58%  40.768us         1  40.768us  40.768us  40.768us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 17.48%  20.032us         1  20.032us  20.032us  20.032us  [CUDA memcpy DtoH]
  7.34%  8.4160us         3  2.8050us  2.2080us  3.9680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==22927== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.66%  507.23ms         6  84.539ms  7.1640us  506.67ms  cudaMalloc
  1.11%  5.7314ms        90  63.681us     126ns  2.4917ms  cuDeviceGetAttribute
  0.06%  315.49us         1  315.49us  315.49us  315.49us  cuDeviceTotalMem
  0.05%  251.06us         1  251.06us  251.06us  251.06us  cuDeviceGetName
  0.04%  185.83us         3  61.942us  8.5720us  140.57us  cudaFree
  0.03%  129.49us         4  32.371us  8.2880us  92.105us  cudaMemcpy
  0.02%  110.44us         2  55.218us  54.637us  55.800us  cudaMemcpyAsync
  0.02%  82.154us         4  20.538us  11.200us  29.393us  cudaLaunch
  0.01%  47.057us        16  2.9410us  2.2370us  5.0310us  cudaFuncGetAttributes
  0.00%  9.0590us        12     754ns     320ns  2.0340us  cudaGetDevice
  0.00%  7.8750us         4  1.9680us  1.5800us  2.3690us  cudaEventCreateWithFlags
  0.00%  7.3130us         4  1.8280us     317ns  5.2530us  cudaSetupArgument
  0.00%  6.2480us         4  1.5620us  1.2030us  1.9520us  cudaEventRecord
  0.00%  4.8030us         4  1.2000us  1.0170us  1.4100us  cudaEventDestroy
  0.00%  4.7300us        11     430ns     299ns  1.0410us  cudaDeviceGetAttribute
  0.00%  2.6660us         4     666ns     354ns     956ns  cudaConfigureCall
  0.00%  1.6600us         2     830ns     269ns  1.3910us  cuDeviceGetCount
  0.00%     388ns         2     194ns     151ns     237ns  cuDeviceGet
