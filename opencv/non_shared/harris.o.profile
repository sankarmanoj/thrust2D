==5546== NVPROF is profiling process 5546, command: ./harris.o
==5546== Profiling application: ./harris.o
==5546== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 42.67%  65.915us         1  65.915us  65.915us  65.915us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.70%  47.421us        23  2.0610us  1.1200us  21.182us  [CUDA memcpy HtoD]
 21.77%  33.628us        19  1.7690us     319ns  18.814us  [CUDA memcpy DtoH]
  4.12%  6.3680us         3  2.1220us  2.0160us  2.3040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.75%  1.1520us         1  1.1520us  1.1520us  1.1520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5546== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.83%  629.24ms         8  78.655ms  6.5610us  628.68ms  cudaMalloc
  0.89%  5.6367ms        90  62.629us     134ns  3.1751ms  cuDeviceGetAttribute
  0.10%  649.59us         1  649.59us  649.59us  649.59us  cuDeviceTotalMem
  0.07%  430.41us        37  11.632us  3.3260us  68.734us  cudaMemcpyAsync
  0.03%  182.69us         4  45.671us  6.7310us  138.41us  cudaFree
  0.03%  173.35us         5  34.670us  7.4680us  116.58us  cudaMemcpy
  0.02%  131.63us         5  26.326us  10.533us  41.500us  cudaLaunch
  0.02%  112.55us         1  112.55us  112.55us  112.55us  cuDeviceGetName
  0.01%  58.461us        20  2.9230us  1.9780us  6.3810us  cudaFuncGetAttributes
  0.00%  11.875us         5  2.3750us  1.7530us  3.0480us  cudaEventCreateWithFlags
  0.00%  10.871us        15     724ns     289ns  2.4510us  cudaGetDevice
  0.00%  8.5970us         5  1.7190us     378ns  5.9520us  cudaSetupArgument
  0.00%  8.3980us         5  1.6790us  1.0910us  2.1480us  cudaEventRecord
  0.00%  6.1230us         5  1.2240us     903ns  1.5220us  cudaEventDestroy
  0.00%  4.7730us        11     433ns     266ns  1.2540us  cudaDeviceGetAttribute
  0.00%  4.2250us         5     845ns     420ns  1.1800us  cudaConfigureCall
  0.00%  2.4360us         2  1.2180us     716ns  1.7200us  cuDeviceGetCount
  0.00%     621ns         2     310ns     251ns     370ns  cuDeviceGet
