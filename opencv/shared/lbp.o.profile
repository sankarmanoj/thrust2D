==6591== NVPROF is profiling process 6591, command: ./lbp.o
==6591== Profiling application: ./lbp.o
==6591== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.35%  86.751us         6  14.458us     576ns  80.671us  [CUDA memcpy HtoD]
 33.61%  82.495us         1  82.495us  82.495us  82.495us  [CUDA memcpy DtoH]
 26.99%  66.240us         1  66.240us  66.240us  66.240us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, lbpFunctor)
  2.97%  7.2960us         2  3.6480us  2.9440us  4.3520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.08%  2.6560us         1  2.6560us  2.6560us  2.6560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6591== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.93%  1.03304s         8  129.13ms  5.4950us  1.02409s  cudaMalloc
  1.96%  20.873ms         1  20.873ms  20.873ms  20.873ms  cudaGetDeviceProperties
  0.63%  6.7284ms        90  74.759us     121ns  3.8098ms  cuDeviceGetAttribute
  0.37%  3.9111ms         3  1.3037ms  18.140us  2.8170ms  cudaFree
  0.05%  490.96us         6  81.826us  5.9500us  240.58us  cudaMemcpy
  0.03%  272.37us         1  272.37us  272.37us  272.37us  cuDeviceTotalMem
  0.01%  131.83us         1  131.83us  131.83us  131.83us  cuDeviceGetName
  0.01%  115.33us         1  115.33us  115.33us  115.33us  cudaMemcpyAsync
  0.01%  96.411us         4  24.102us  15.294us  38.757us  cudaLaunch
  0.00%  33.335us        12  2.7770us  1.4680us  9.4200us  cudaFuncGetAttributes
  0.00%  8.8070us         9     978ns     213ns  4.6150us  cudaGetDevice
  0.00%  8.3880us         3  2.7960us  1.5060us  5.0290us  cudaEventCreateWithFlags
  0.00%  6.5540us         3  2.1840us  1.1830us  3.9230us  cudaEventRecord
  0.00%  5.6650us         7     809ns     127ns  3.6130us  cudaSetupArgument
  0.00%  5.2270us         3  1.7420us     972ns  2.8580us  cudaEventDestroy
  0.00%  4.2870us         4  1.0710us     793ns  1.6360us  cudaConfigureCall
  0.00%  3.9870us         2  1.9930us  1.2780us  2.7090us  cuDeviceGetCount
  0.00%  3.0330us        11     275ns     213ns     706ns  cudaDeviceGetAttribute
  0.00%     644ns         2     322ns     164ns     480ns  cuDeviceGet
