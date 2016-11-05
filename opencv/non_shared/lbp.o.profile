==6093== NVPROF is profiling process 6093, command: ./lbp.o
==6093== Profiling application: ./lbp.o
==6093== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.55%  112.97us         1  112.97us  112.97us  112.97us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 27.99%  77.972us         5  15.594us     608ns  74.100us  [CUDA memcpy HtoD]
 26.52%  73.877us         1  73.877us  73.877us  73.877us  [CUDA memcpy DtoH]
  3.94%  10.975us         3  3.6580us  2.9430us  4.5760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.00%  2.7840us         1  2.7840us  2.7840us  2.7840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6093== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.42%  756.66ms         8  94.583ms  8.4810us  752.16ms  cudaMalloc
  0.82%  6.2685ms         4  1.5671ms  28.043us  4.4883ms  cudaFree
  0.63%  4.8397ms        90  53.774us     127ns  3.8731ms  cuDeviceGetAttribute
  0.05%  375.50us         5  75.099us  9.8670us  300.18us  cudaMemcpy
  0.03%  220.95us         1  220.95us  220.95us  220.95us  cuDeviceTotalMem
  0.02%  145.34us         5  29.067us  12.741us  38.498us  cudaLaunch
  0.02%  133.14us         1  133.14us  133.14us  133.14us  cudaMemcpyAsync
  0.01%  62.453us        20  3.1220us  2.1720us  6.3010us  cudaFuncGetAttributes
  0.01%  45.455us         1  45.455us  45.455us  45.455us  cuDeviceGetName
  0.00%  13.062us        15     870ns     341ns  2.4400us  cudaGetDevice
  0.00%  10.166us         5  2.0330us  1.3860us  2.4830us  cudaEventCreateWithFlags
  0.00%  8.0630us         5  1.6120us     341ns  5.3540us  cudaSetupArgument
  0.00%  7.8020us         5  1.5600us  1.1580us  1.9980us  cudaEventRecord
  0.00%  6.6380us         5  1.3270us     978ns  1.7820us  cudaEventDestroy
  0.00%  5.3030us        11     482ns     316ns  1.3910us  cudaDeviceGetAttribute
  0.00%  4.5940us         5     918ns     367ns  1.2910us  cudaConfigureCall
  0.00%  3.1040us         2  1.5520us  1.1450us  1.9590us  cuDeviceGetCount
  0.00%  1.5740us         1  1.5740us  1.5740us  1.5740us  cudaGetLastError
  0.00%     757ns         2     378ns     334ns     423ns  cuDeviceGet
