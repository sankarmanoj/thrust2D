==3852== NVPROF is profiling process 3852, command: ./erode.o
==3852== Profiling application: ./erode.o
==3852== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.19%  84.100us         1  84.100us  84.100us  84.100us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.85%  78.148us         5  15.629us  1.1840us  73.316us  [CUDA memcpy HtoD]
 29.23%  74.051us         1  74.051us  74.051us  74.051us  [CUDA memcpy DtoH]
  5.14%  13.024us         3  4.3410us  3.4880us  5.1520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.59%  4.0320us         1  4.0320us  4.0320us  4.0320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3852== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.19%  896.79ms         8  112.10ms  8.9980us  885.45ms  cudaMalloc
  1.52%  13.867ms         4  3.4667ms  24.697us  6.3920ms  cudaFree
  0.15%  1.4124ms        90  15.693us     123ns  727.33us  cuDeviceGetAttribute
  0.05%  482.19us         5  96.438us  8.5710us  284.71us  cudaMemcpy
  0.03%  261.07us         1  261.07us  261.07us  261.07us  cuDeviceTotalMem
  0.02%  150.29us         5  30.057us  12.187us  42.524us  cudaLaunch
  0.01%  117.81us         1  117.81us  117.81us  117.81us  cudaMemcpyAsync
  0.01%  93.693us         1  93.693us  93.693us  93.693us  cuDeviceGetName
  0.01%  65.046us        20  3.2520us  1.7630us  6.4460us  cudaFuncGetAttributes
  0.00%  13.544us        15     902ns     256ns  2.7030us  cudaGetDevice
  0.00%  11.132us         5  2.2260us  1.1040us  2.6080us  cudaEventCreateWithFlags
  0.00%  9.2150us         5  1.8430us  1.0900us  2.3220us  cudaEventRecord
  0.00%  8.6680us         5  1.7330us     553ns  5.2030us  cudaSetupArgument
  0.00%  7.1660us         5  1.4330us     846ns  1.9330us  cudaEventDestroy
  0.00%  4.6190us         5     923ns     435ns  1.3280us  cudaConfigureCall
  0.00%  4.1540us        11     377ns     228ns  1.3560us  cudaDeviceGetAttribute
  0.00%  3.8780us         2  1.9390us  1.0280us  2.8500us  cuDeviceGetCount
  0.00%     715ns         2     357ns     255ns     460ns  cuDeviceGet
