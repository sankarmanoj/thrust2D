==12507== NVPROF is profiling process 12507, command: ./lbp.o
==12507== Profiling application: ./lbp.o
==12507== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 49.02%  411.92us         1  411.92us  411.92us  411.92us  [CUDA memcpy DtoH]
 42.55%  357.49us         6  59.582us     672ns  353.46us  [CUDA memcpy HtoD]
  6.97%  58.526us         1  58.526us  58.526us  58.526us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, lbpFunctor)
  1.01%  8.4800us         2  4.2400us  3.7760us  4.7040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.46%  3.8400us         1  3.8400us  3.8400us  3.8400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12507== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.99%  302.09ms         8  37.762ms  7.5150us  301.42ms  cudaMalloc
  0.38%  1.1663ms         6  194.39us  6.9700us  1.0689ms  cudaMemcpy
  0.21%  639.95us         1  639.95us  639.95us  639.95us  cudaMemcpyAsync
  0.12%  354.30us         3  118.10us  18.834us  275.24us  cudaFree
  0.09%  260.11us         1  260.11us  260.11us  260.11us  cudaGetDeviceProperties
  0.07%  217.18us        90  2.4130us     130ns  77.348us  cuDeviceGetAttribute
  0.05%  159.79us         1  159.79us  159.79us  159.79us  cuDeviceTotalMem
  0.05%  153.20us         4  38.299us  16.284us  67.009us  cudaLaunch
  0.01%  37.464us        12  3.1220us  2.0540us  8.0700us  cudaFuncGetAttributes
  0.01%  33.967us         1  33.967us  33.967us  33.967us  cuDeviceGetName
  0.00%  10.401us         7  1.4850us     154ns  8.1630us  cudaSetupArgument
  0.00%  8.3520us         9     928ns     301ns  3.4690us  cudaGetDevice
  0.00%  8.3320us         3  2.7770us  1.5950us  4.9770us  cudaEventCreateWithFlags
  0.00%  7.4580us        11     678ns     286ns  2.8250us  cudaDeviceGetAttribute
  0.00%  7.0560us         3  2.3520us  1.1730us  4.2960us  cudaEventRecord
  0.00%  5.9380us         4  1.4840us     407ns  2.5910us  cudaConfigureCall
  0.00%  5.2690us         3  1.7560us  1.2900us  2.4990us  cudaEventDestroy
  0.00%  5.0200us         2  2.5100us     547ns  4.4730us  cuDeviceGetCount
  0.00%     761ns         2     380ns     299ns     462ns  cuDeviceGet
