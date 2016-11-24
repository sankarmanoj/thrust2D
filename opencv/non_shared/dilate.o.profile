==5844== NVPROF is profiling process 5844, command: ./dilate.o
==5844== Profiling application: ./dilate.o
==5844== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.59%  43.709us         1  43.709us  43.709us  43.709us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 26.00%  26.077us         5  5.2150us  1.1840us  21.214us  [CUDA memcpy HtoD]
 20.90%  20.958us         1  20.958us  20.958us  20.958us  [CUDA memcpy DtoH]
  9.51%  9.5360us         4  2.3840us  2.2400us  2.7520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5844== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.49%  197.56ms         8  24.695ms  4.7810us  197.15ms  cudaMalloc
  0.19%  382.33us        90  4.2480us     167ns  149.01us  cuDeviceGetAttribute
  0.11%  212.76us         1  212.76us  212.76us  212.76us  cuDeviceTotalMem
  0.06%  126.56us         4  31.639us  4.2100us  102.48us  cudaFree
  0.06%  124.22us         5  24.843us  4.4480us  99.988us  cudaMemcpy
  0.02%  40.441us         5  8.0880us  5.6730us  12.883us  cudaLaunch
  0.02%  35.116us         1  35.116us  35.116us  35.116us  cuDeviceGetName
  0.02%  32.845us        20  1.6420us  1.4420us  3.2820us  cudaFuncGetAttributes
  0.01%  20.546us         1  20.546us  20.546us  20.546us  cudaMemcpyAsync
  0.00%  5.1530us         5  1.0300us     231ns  3.8460us  cudaSetupArgument
  0.00%  4.9620us        15     330ns     211ns  1.1530us  cudaGetDevice
  0.00%  4.4620us         5     892ns     692ns  1.4380us  cudaEventCreateWithFlags
  0.00%  3.9360us         5     787ns     628ns  1.2340us  cudaEventRecord
  0.00%  3.0390us        11     276ns     209ns     727ns  cudaDeviceGetAttribute
  0.00%  3.0250us         5     605ns     473ns     915ns  cudaEventDestroy
  0.00%  1.8330us         2     916ns     287ns  1.5460us  cuDeviceGetCount
  0.00%  1.6920us         5     338ns     184ns     898ns  cudaConfigureCall
  0.00%     473ns         2     236ns     192ns     281ns  cuDeviceGet
