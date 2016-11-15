==8330== NVPROF is profiling process 8330, command: ./lbp.o
==8330== Profiling application: ./lbp.o
==8330== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.99%  246.15us         1  246.15us  246.15us  246.15us  [CUDA memcpy DtoH]
 39.32%  242.03us         5  48.405us     575ns  239.63us  [CUDA memcpy HtoD]
 18.19%  111.95us         1  111.95us  111.95us  111.95us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.07%  12.731us         3  4.2430us  3.9020us  4.8940us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.44%  2.6860us         1  2.6860us  2.6860us  2.6860us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8330== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.52%  819.21ms         8  102.40ms  5.7470us  813.11ms  cudaMalloc
  1.26%  10.607ms        90  117.86us     103ns  4.8752ms  cuDeviceGetAttribute
  0.90%  7.5432ms         4  1.8858ms  42.791us  3.1572ms  cudaFree
  0.16%  1.3110ms         5  262.20us  6.1020us  1.2138ms  cudaMemcpy
  0.07%  553.10us         1  553.10us  553.10us  553.10us  cuDeviceTotalMem
  0.03%  273.67us         1  273.67us  273.67us  273.67us  cudaMemcpyAsync
  0.03%  260.47us         1  260.47us  260.47us  260.47us  cuDeviceGetName
  0.02%  160.24us         5  32.047us  17.316us  50.671us  cudaLaunch
  0.01%  52.271us        20  2.6130us  1.3550us  8.9060us  cudaFuncGetAttributes
  0.00%  27.107us         5  5.4210us     231ns  23.500us  cudaSetupArgument
  0.00%  14.173us        15     944ns     202ns  3.4810us  cudaGetDevice
  0.00%  9.6230us         5  1.9240us  1.3380us  2.3100us  cudaEventCreateWithFlags
  0.00%  8.6960us         2  4.3480us  1.3120us  7.3840us  cuDeviceGetCount
  0.00%  7.5030us         5  1.5000us     693ns  2.2750us  cudaEventRecord
  0.00%  6.1110us         5  1.2220us     690ns  1.5180us  cudaEventDestroy
  0.00%  5.4950us        11     499ns     288ns  1.5880us  cudaDeviceGetAttribute
  0.00%  4.4920us         5     898ns     272ns  1.5970us  cudaConfigureCall
  0.00%  1.5360us         2     768ns     571ns     965ns  cuDeviceGet
  0.00%     706ns         1     706ns     706ns     706ns  cudaGetLastError
