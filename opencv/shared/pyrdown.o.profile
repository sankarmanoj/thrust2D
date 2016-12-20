==9926== NVPROF is profiling process 9926, command: ./pyrdown.o 1631
==9926== Profiling application: ./pyrdown.o 1631
==9926== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.43%  12.596ms         4  3.1490ms     672ns  12.594ms  [CUDA memcpy HtoD]
 21.15%  6.7563ms         2  3.3781ms  1.7267ms  5.0296ms  [CUDA memcpy DtoA]
 14.41%  4.6037ms         1  4.6037ms  4.6037ms  4.6037ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 11.71%  3.7401ms         1  3.7401ms  3.7401ms  3.7401ms  [CUDA memcpy DtoH]
  9.91%  3.1653ms         1  3.1653ms  3.1653ms  3.1653ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  2.25%  719.94us         2  359.97us  134.05us  585.89us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.15%  366.79us         1  366.79us  366.79us  366.79us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9926== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.17%  657.22ms         5  131.44ms  8.9550us  652.47ms  cudaMalloc
  3.06%  21.325ms         3  7.1083ms  16.737us  21.179ms  cudaMemcpy
  1.76%  12.252ms         1  12.252ms  12.252ms  12.252ms  cudaMemcpyAsync
  0.54%  3.8029ms        90  42.254us     148ns  2.8384ms  cuDeviceGetAttribute
  0.33%  2.3116ms         1  2.3116ms  2.3116ms  2.3116ms  cudaMallocArray
  0.03%  244.13us         1  244.13us  244.13us  244.13us  cuDeviceTotalMem
  0.03%  228.70us         2  114.35us  75.940us  152.76us  cudaFree
  0.03%  206.99us         1  206.99us  206.99us  206.99us  cuDeviceGetName
  0.01%  86.629us         5  17.325us  11.490us  23.860us  cudaLaunch
  0.01%  81.101us         2  40.550us  16.454us  64.647us  cudaMemcpyToArray
  0.01%  42.887us         1  42.887us  42.887us  42.887us  cudaMemcpyToSymbol
  0.01%  36.381us        12  3.0310us  2.1270us  6.7490us  cudaFuncGetAttributes
  0.00%  18.382us         2  9.1910us  4.8230us  13.559us  cudaCreateTextureObject
  0.00%  9.1810us         3  3.0600us  1.0980us  4.9540us  cudaEventRecord
  0.00%  8.5970us         9     955ns     311ns  2.2940us  cudaGetDevice
  0.00%  7.9870us        11     726ns     171ns  4.5000us  cudaSetupArgument
  0.00%  7.3440us         3  2.4480us  1.4580us  3.3170us  cudaEventCreateWithFlags
  0.00%  6.2350us        11     566ns     273ns  2.1300us  cudaDeviceGetAttribute
  0.00%  4.9660us         3  1.6550us     914ns  2.4230us  cudaEventDestroy
  0.00%  3.6870us         5     737ns     281ns  1.3980us  cudaConfigureCall
  0.00%  2.5360us         2  1.2680us     799ns  1.7370us  cuDeviceGetCount
  0.00%     748ns         2     374ns     304ns     444ns  cuDeviceGet
  0.00%     425ns         1     425ns     425ns     425ns  cudaCreateChannelDesc
