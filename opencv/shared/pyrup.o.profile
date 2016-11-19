==14129== NVPROF is profiling process 14129, command: ./pyrup.o
==14129== Profiling application: ./pyrup.o
==14129== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 74.67%  1.3502ms        19  71.062us     319ns  1.3414ms  [CUDA memcpy DtoH]
 17.16%  310.32us         1  310.32us  310.32us  310.32us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
  6.58%  118.91us        24  4.9540us     544ns  105.40us  [CUDA memcpy HtoD]
  1.40%  25.279us         3  8.4260us  1.5040us  18.975us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.19%  3.5200us         1  3.5200us  3.5200us  3.5200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==14129== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.77%  178.74ms         9  19.860ms  5.2310us  178.25ms  cudaMalloc
  5.88%  11.457ms        91  125.90us      96ns  4.8959ms  cuDeviceGetAttribute
  1.04%  2.0321ms         6  338.69us  5.4710us  1.9554ms  cudaMemcpy
  0.48%  942.92us         1  942.92us  942.92us  942.92us  cuDeviceTotalMem
  0.43%  837.57us         1  837.57us  837.57us  837.57us  cuDeviceGetName
  0.14%  271.24us        37  7.3300us  1.8530us  109.32us  cudaMemcpyAsync
  0.09%  166.79us         1  166.79us  166.79us  166.79us  cudaGetDeviceProperties
  0.08%  162.83us         4  40.707us  6.3530us  107.05us  cudaFree
  0.04%  84.727us         5  16.945us  8.4380us  33.414us  cudaLaunch
  0.02%  40.587us        16  2.5360us  1.3150us  16.000us  cudaFuncGetAttributes
  0.00%  7.4980us         4  1.8740us     899ns  3.4050us  cudaEventCreateWithFlags
  0.00%  7.4610us        12     621ns     198ns  2.8430us  cudaGetDevice
  0.00%  6.8630us         7     980ns     109ns  5.4460us  cudaSetupArgument
  0.00%  5.6980us        11     518ns     200ns  2.2480us  cudaDeviceGetAttribute
  0.00%  5.6710us         4  1.4170us     659ns  2.6980us  cudaEventRecord
  0.00%  4.4600us         4  1.1150us     571ns  2.1950us  cudaEventDestroy
  0.00%  2.7560us         5     551ns     191ns  1.1920us  cudaConfigureCall
  0.00%  2.1630us         3     721ns     150ns  1.7670us  cuDeviceGetCount
  0.00%     830ns         3     276ns     114ns     377ns  cuDeviceGet
