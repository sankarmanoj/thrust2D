==3849== NVPROF is profiling process 3849, command: ./harris.o
==3849== Profiling application: ./harris.o
==3849== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.06%  126.50us         1  126.50us  126.50us  126.50us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 31.14%  103.49us        23  4.4990us     576ns  80.483us  [CUDA memcpy HtoD]
 26.65%  88.580us        19  4.6620us     320ns  74.500us  [CUDA memcpy DtoH]
  4.15%  13.793us         4  3.4480us  1.6320us  4.2250us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3849== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.78%  1.00884s         8  126.11ms  10.129us  1.00036s  cudaMalloc
  0.52%  5.3391ms        90  59.323us     119ns  2.9336ms  cuDeviceGetAttribute
  0.40%  4.0738ms         4  1.0185ms  20.589us  3.0902ms  cudaFree
  0.12%  1.1989ms        37  32.403us  3.1600us  482.60us  cudaMemcpyAsync
  0.06%  620.87us         5  124.17us  29.535us  337.37us  cudaMemcpy
  0.05%  536.10us         1  536.10us  536.10us  536.10us  cuDeviceTotalMem
  0.03%  352.11us         1  352.11us  352.11us  352.11us  cuDeviceGetName
  0.02%  164.02us         5  32.803us  21.564us  40.215us  cudaLaunch
  0.01%  67.395us        20  3.3690us  2.0630us  7.0160us  cudaFuncGetAttributes
  0.00%  14.918us        15     994ns     317ns  2.7890us  cudaGetDevice
  0.00%  13.661us         5  2.7320us  2.1940us  3.4360us  cudaEventCreateWithFlags
  0.00%  10.030us         5  2.0060us     634ns  6.0370us  cudaSetupArgument
  0.00%  9.8560us         5  1.9710us  1.8240us  2.1880us  cudaEventRecord
  0.00%  6.8210us         5  1.3640us  1.2370us  1.4770us  cudaEventDestroy
  0.00%  5.9430us         5  1.1880us     935ns  1.4100us  cudaConfigureCall
  0.00%  5.1790us        11     470ns     309ns  1.3400us  cudaDeviceGetAttribute
  0.00%  2.9500us         2  1.4750us     568ns  2.3820us  cuDeviceGetCount
  0.00%     791ns         2     395ns     221ns     570ns  cuDeviceGet
