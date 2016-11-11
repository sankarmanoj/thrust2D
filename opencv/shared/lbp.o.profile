==5520== NVPROF is profiling process 5520, command: ./lbp.o
==5520== Profiling application: ./lbp.o
==5520== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.94%  197.45us         1  197.45us  197.45us  197.45us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, lbpFunctor)
 35.88%  161.20us         1  161.20us  161.20us  161.20us  [CUDA memcpy DtoH]
 17.28%  77.622us         6  12.937us     544ns  74.647us  [CUDA memcpy HtoD]
  2.19%  9.8550us         2  4.9270us  4.6070us  5.2480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.71%  3.2000us         1  3.2000us  3.2000us  3.2000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5520== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.47%  803.97ms         8  100.50ms  7.8630us  799.53ms  cudaMalloc
  1.63%  13.584ms        90  150.94us     131ns  12.465ms  cuDeviceGetAttribute
  0.82%  6.8179ms         3  2.2726ms  37.994us  6.3278ms  cudaFree
  0.68%  5.6618ms         1  5.6618ms  5.6618ms  5.6618ms  cudaGetDeviceProperties
  0.15%  1.2571ms         6  209.52us  9.7400us  833.33us  cudaMemcpy
  0.13%  1.1105ms         1  1.1105ms  1.1105ms  1.1105ms  cuDeviceGetName
  0.04%  318.00us         1  318.00us  318.00us  318.00us  cuDeviceTotalMem
  0.03%  260.49us        11  23.680us     321ns  253.43us  cudaDeviceGetAttribute
  0.02%  185.79us         1  185.79us  185.79us  185.79us  cudaMemcpyAsync
  0.02%  164.50us         4  41.125us  13.269us  61.415us  cudaLaunch
  0.01%  44.198us        12  3.6830us  2.5060us  7.7020us  cudaFuncGetAttributes
  0.00%  11.884us         9  1.3200us     415ns  4.4870us  cudaGetDevice
  0.00%  7.5100us         3  2.5030us  1.4470us  3.3080us  cudaEventCreateWithFlags
  0.00%  6.5420us         7     934ns     205ns  4.1470us  cudaSetupArgument
  0.00%  6.1020us         3  2.0340us  1.2300us  2.7010us  cudaEventRecord
  0.00%  5.3700us         4  1.3420us     370ns  2.1450us  cudaConfigureCall
  0.00%  5.2830us         3  1.7610us  1.1020us  2.3420us  cudaEventDestroy
  0.00%  2.4830us         2  1.2410us     311ns  2.1720us  cuDeviceGetCount
  0.00%     738ns         2     369ns     221ns     517ns  cuDeviceGet
  0.00%     488ns         1     488ns     488ns     488ns  cudaGetLastError
