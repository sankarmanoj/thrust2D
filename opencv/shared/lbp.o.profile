==4761== NVPROF is profiling process 4761, command: ./lbp.o
==4761== Profiling application: ./lbp.o
==4761== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.90%  198.96us         1  198.96us  198.96us  198.96us  void thrust::transform_kernel<float, lbpFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, lbpFunctor)
 21.86%  79.237us         6  13.206us  1.1840us  73.157us  [CUDA memcpy HtoD]
 20.40%  73.925us         1  73.925us  73.925us  73.925us  [CUDA memcpy DtoH]
  2.08%  7.5210us         2  3.7600us  3.2640us  4.2570us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.76%  2.7520us         1  2.7520us  2.7520us  2.7520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4761== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.52%  766.20ms         8  95.774ms  6.8260us  761.01ms  cudaMalloc
  1.67%  13.125ms         1  13.125ms  13.125ms  13.125ms  cudaGetDeviceProperties
  0.35%  2.7393ms         3  913.11us  42.677us  1.9278ms  cudaFree
  0.29%  2.2910ms         1  2.2910ms  2.2910ms  2.2910ms  cuDeviceGetName
  0.07%  537.30us         6  89.549us  5.9230us  415.23us  cudaMemcpy
  0.04%  308.38us        90  3.4260us     138ns  117.14us  cuDeviceGetAttribute
  0.03%  214.20us         1  214.20us  214.20us  214.20us  cuDeviceTotalMem
  0.02%  126.66us         1  126.66us  126.66us  126.66us  cudaMemcpyAsync
  0.01%  94.214us         4  23.553us  8.4280us  33.725us  cudaLaunch
  0.00%  31.970us        12  2.6640us  1.9510us  4.7460us  cudaFuncGetAttributes
  0.00%  6.5010us         7     928ns     148ns  4.5910us  cudaSetupArgument
  0.00%  6.0630us         9     673ns     289ns  1.6970us  cudaGetDevice
  0.00%  5.5220us        11     502ns     352ns  1.4310us  cudaDeviceGetAttribute
  0.00%  4.1880us         3  1.3960us     889ns  1.6780us  cudaEventCreateWithFlags
  0.00%  3.7730us         3  1.2570us     759ns  1.6350us  cudaEventRecord
  0.00%  3.6350us         4     908ns     303ns  1.5890us  cudaConfigureCall
  0.00%  2.9530us         3     984ns     663ns  1.2190us  cudaEventDestroy
  0.00%  2.0850us         2  1.0420us     340ns  1.7450us  cuDeviceGetCount
  0.00%     658ns         2     329ns     282ns     376ns  cuDeviceGet
  0.00%     424ns         1     424ns     424ns     424ns  cudaGetLastError
