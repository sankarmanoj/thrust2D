==6960== NVPROF is profiling process 6960, command: ./blend.o
==6960== Profiling application: ./blend.o
==6960== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.99%  165.96us         8  20.744us     576ns  81.939us  [CUDA memcpy HtoD]
 23.62%  80.020us         1  80.020us  80.020us  80.020us  void thrust::transform_kernel<float, blendFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, int, int, int, int, int, blendFunctor)
 23.27%  78.836us         1  78.836us  78.836us  78.836us  [CUDA memcpy DtoH]
  4.12%  13.949us         3  4.6490us  3.8070us  5.4070us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6960== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.33%  326.50ms         9  36.278ms  6.6440us  322.50ms  cudaMalloc
  1.21%  4.0595ms         3  1.3532ms  25.149us  2.6848ms  cudaFree
  0.52%  1.7486ms        90  19.429us     102ns  856.11us  cuDeviceGetAttribute
  0.43%  1.4586ms         1  1.4586ms  1.4586ms  1.4586ms  cudaGetDeviceProperties
  0.30%  1.0029ms         7  143.27us  7.8280us  731.37us  cudaMemcpy
  0.07%  235.03us         2  117.51us  116.99us  118.04us  cudaMemcpyAsync
  0.07%  234.28us         1  234.28us  234.28us  234.28us  cuDeviceTotalMem
  0.03%  95.708us         4  23.927us  14.338us  29.931us  cudaLaunch
  0.02%  57.217us         1  57.217us  57.217us  57.217us  cuDeviceGetName
  0.01%  31.796us        12  2.6490us  1.4690us  4.9720us  cudaFuncGetAttributes
  0.00%  6.2540us         3  2.0840us  1.8160us  2.2640us  cudaEventCreateWithFlags
  0.00%  6.1040us         9     678ns     212ns  1.8610us  cudaGetDevice
  0.00%  5.9960us        12     499ns     114ns  3.8910us  cudaSetupArgument
  0.00%  5.3400us         3  1.7800us  1.0380us  2.3540us  cudaEventRecord
  0.00%  3.4850us        11     316ns     209ns     917ns  cudaDeviceGetAttribute
  0.00%  3.3270us         3  1.1090us     722ns  1.3190us  cudaEventDestroy
  0.00%  3.0450us         4     761ns     361ns     920ns  cudaConfigureCall
  0.00%  1.9160us         2     958ns     374ns  1.5420us  cuDeviceGetCount
  0.00%     481ns         2     240ns     196ns     285ns  cuDeviceGet
  0.00%     276ns         1     276ns     276ns     276ns  cudaGetLastError
