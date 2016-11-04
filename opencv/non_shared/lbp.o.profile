==3396== NVPROF is profiling process 3396, command: ./lbp.o
==3396== Profiling application: ./lbp.o
==3396== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.67%  116.62us         1  116.62us  116.62us  116.62us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 27.80%  81.732us         5  16.346us     800ns  77.284us  [CUDA memcpy HtoD]
 26.74%  78.629us         1  78.629us  78.629us  78.629us  [CUDA memcpy DtoH]
  4.87%  14.304us         3  4.7680us  4.7040us  4.8640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.93%  2.7200us         1  2.7200us  2.7200us  2.7200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3396== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.14%  354.05ms         8  44.256ms  6.9610us  352.67ms  cudaMalloc
  4.18%  15.539ms         4  3.8847ms  29.998us  9.5634ms  cudaFree
  0.23%  852.87us         5  170.57us  26.869us  636.63us  cudaMemcpy
  0.19%  688.76us        90  7.6520us     133ns  275.97us  cuDeviceGetAttribute
  0.09%  349.41us         1  349.41us  349.41us  349.41us  cuDeviceTotalMem
  0.06%  234.43us         1  234.43us  234.43us  234.43us  cuDeviceGetName
  0.05%  172.60us         1  172.60us  172.60us  172.60us  cudaMemcpyAsync
  0.03%  121.78us         5  24.356us  10.206us  37.728us  cudaLaunch
  0.02%  58.270us        20  2.9130us  2.0380us  5.4040us  cudaFuncGetAttributes
  0.00%  11.236us        15     749ns     279ns  2.0760us  cudaGetDevice
  0.00%  10.305us         5  2.0610us  1.5860us  2.8940us  cudaEventCreateWithFlags
  0.00%  8.0030us         5  1.6000us  1.2260us  2.0610us  cudaEventRecord
  0.00%  6.8290us         5  1.3650us     267ns  4.5030us  cudaSetupArgument
  0.00%  5.4460us         5  1.0890us     848ns  1.3390us  cudaEventDestroy
  0.00%  5.0900us        11     462ns     282ns  1.2140us  cudaDeviceGetAttribute
  0.00%  3.9320us         5     786ns     325ns  1.4200us  cudaConfigureCall
  0.00%  2.5650us         2  1.2820us  1.0360us  1.5290us  cuDeviceGetCount
  0.00%  1.7180us         1  1.7180us  1.7180us  1.7180us  cudaGetLastError
  0.00%     720ns         2     360ns     302ns     418ns  cuDeviceGet
