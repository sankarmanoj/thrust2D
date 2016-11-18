==3892== NVPROF is profiling process 3892, command: ./lbp.o
==3892== Profiling application: ./lbp.o
==3892== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.41%  115.94us         1  115.94us  115.94us  115.94us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 28.24%  81.028us         5  16.205us     608ns  74.820us  [CUDA memcpy HtoD]
 25.95%  74.435us         1  74.435us  74.435us  74.435us  [CUDA memcpy DtoH]
  4.46%  12.801us         3  4.2670us  3.4890us  4.9280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.94%  2.6880us         1  2.6880us  2.6880us  2.6880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3892== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.48%  927.91ms         8  115.99ms  7.4070us  903.89ms  cudaMalloc
  1.18%  11.242ms        90  124.91us     129ns  5.6718ms  cuDeviceGetAttribute
  0.96%  9.1473ms         4  2.2868ms  51.070us  4.1610ms  cudaFree
  0.16%  1.5641ms         1  1.5641ms  1.5641ms  1.5641ms  cuDeviceTotalMem
  0.09%  815.91us         5  163.18us  7.9230us  709.83us  cudaMemcpy
  0.08%  807.16us         1  807.16us  807.16us  807.16us  cuDeviceGetName
  0.02%  157.88us         1  157.88us  157.88us  157.88us  cudaMemcpyAsync
  0.02%  146.81us         5  29.361us  10.795us  41.453us  cudaLaunch
  0.01%  60.835us        20  3.0410us  1.4360us  8.0520us  cudaFuncGetAttributes
  0.00%  13.371us        15     891ns     232ns  2.7920us  cudaGetDevice
  0.00%  10.570us         5  2.1140us  1.1140us  3.1510us  cudaEventCreateWithFlags
  0.00%  9.9880us         5  1.9970us     966ns  2.9550us  cudaEventRecord
  0.00%  6.7400us         5  1.3480us     842ns  2.0940us  cudaEventDestroy
  0.00%  6.3400us         5  1.2680us     230ns  3.6470us  cudaSetupArgument
  0.00%  4.8630us         5     972ns     350ns  1.3570us  cudaConfigureCall
  0.00%  3.8350us        11     348ns     204ns  1.4380us  cudaDeviceGetAttribute
  0.00%  3.0350us         2  1.5170us     567ns  2.4680us  cuDeviceGetCount
  0.00%  1.9590us         1  1.9590us  1.9590us  1.9590us  cudaGetLastError
  0.00%     686ns         2     343ns     236ns     450ns  cuDeviceGet
