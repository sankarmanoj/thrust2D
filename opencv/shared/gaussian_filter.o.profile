==4821== NVPROF is profiling process 4821, command: ./gaussian_filter.o
==4821== Profiling application: ./gaussian_filter.o
==4821== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.73%  598.86us         1  598.86us  598.86us  598.86us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 17.80%  167.27us        55  3.0410us     576ns  73.637us  [CUDA memcpy HtoD]
 16.56%  155.56us        51  3.0500us     320ns  73.925us  [CUDA memcpy DtoH]
  0.93%  8.7360us         3  2.9120us  1.6000us  3.6800us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.54%  5.0880us         1  5.0880us  5.0880us  5.0880us  [CUDA memcpy DtoD]
  0.44%  4.0960us         1  4.0960us  4.0960us  4.0960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4821== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.21%  923.62ms         8  115.45ms  7.3990us  921.15ms  cudaMalloc
  0.74%  6.9639ms        90  77.376us     116ns  3.2368ms  cuDeviceGetAttribute
  0.26%  2.3982ms         1  2.3982ms  2.3982ms  2.3982ms  cuDeviceGetName
  0.21%  1.9905ms         1  1.9905ms  1.9905ms  1.9905ms  cudaGetDeviceProperties
  0.19%  1.8147ms       101  17.967us  3.3360us  616.76us  cudaMemcpyAsync
  0.13%  1.2275ms         1  1.2275ms  1.2275ms  1.2275ms  cuDeviceTotalMem
  0.13%  1.1886ms         3  396.20us  18.397us  1.1345ms  cudaFree
  0.06%  605.13us         1  605.13us  605.13us  605.13us  cudaDeviceSynchronize
  0.03%  320.22us         6  53.370us  16.257us  200.89us  cudaMemcpy
  0.02%  166.06us         5  33.212us  26.133us  40.479us  cudaLaunch
  0.01%  60.238us        17  3.5430us  1.4090us  6.2890us  cudaFuncGetAttributes
  0.00%  13.147us        13  1.0110us     205ns  2.2670us  cudaGetDevice
  0.00%  11.422us         4  2.8550us  1.3500us  4.5100us  cudaEventCreateWithFlags
  0.00%  7.8680us         4  1.9670us  1.2450us  2.3540us  cudaEventRecord
  0.00%  7.7630us         9     862ns     112ns  4.4050us  cudaSetupArgument
  0.00%  6.9560us        15     463ns     251ns  1.4820us  cudaDeviceGetAttribute
  0.00%  6.0730us         5  1.2140us     860ns  1.8850us  cudaConfigureCall
  0.00%  5.4470us         4  1.3610us     950ns  1.7740us  cudaEventDestroy
  0.00%  2.0140us         2  1.0070us     249ns  1.7650us  cuDeviceGetCount
  0.00%  1.6640us         1  1.6640us  1.6640us  1.6640us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.1590us         2     579ns     559ns     600ns  cudaGetLastError
  0.00%     542ns         2     271ns     142ns     400ns  cuDeviceGet
