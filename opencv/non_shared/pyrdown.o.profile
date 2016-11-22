==23590== NVPROF is profiling process 23590, command: ./pyrdown.o
==23590== Profiling application: ./pyrdown.o
==23590== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 70.10%  412.21us         1  412.21us  412.21us  412.21us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 15.11%  88.871us        19  4.6770us     320ns  73.899us  [CUDA memcpy DtoH]
  8.17%  48.051us        25  1.9220us  1.1520us  19.098us  [CUDA memcpy HtoD]
  3.28%  19.291us         1  19.291us  19.291us  19.291us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.11%  18.266us         5  3.6530us  2.1110us  5.0870us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.22%  1.3110us         1  1.3110us  1.3110us  1.3110us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==23590== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.18%  238.44ms        12  19.870ms  4.5610us  237.68ms  cudaMalloc
  0.27%  641.15us         7  91.592us  4.7610us  589.76us  cudaMemcpy
  0.16%  374.01us        90  4.1550us     169ns  146.50us  cuDeviceGetAttribute
  0.12%  283.58us        37  7.6640us  1.9840us  18.621us  cudaMemcpyAsync
  0.10%  236.17us         6  39.362us  6.0800us  117.66us  cudaFree
  0.09%  213.48us         1  213.48us  213.48us  213.48us  cuDeviceTotalMem
  0.03%  67.428us         8  8.4280us  5.7050us  13.683us  cudaLaunch
  0.02%  53.410us        32  1.6690us  1.3370us  7.5510us  cudaFuncGetAttributes
  0.01%  35.255us         1  35.255us  35.255us  35.255us  cuDeviceGetName
  0.01%  29.322us         1  29.322us  29.322us  29.322us  cudaDeviceSynchronize
  0.00%  8.0310us        24     334ns     205ns  1.1420us  cudaGetDevice
  0.00%  6.5790us         8     822ns     624ns  1.3170us  cudaEventCreateWithFlags
  0.00%  5.9650us         8     745ns     533ns  1.4760us  cudaEventRecord
  0.00%  5.7830us         8     722ns     192ns  3.9540us  cudaSetupArgument
  0.00%  4.8670us         8     608ns     495ns     876ns  cudaEventDestroy
  0.00%  2.7570us        11     250ns     199ns     663ns  cudaDeviceGetAttribute
  0.00%  2.5670us         8     320ns     195ns     783ns  cudaConfigureCall
  0.00%  1.5180us         2     759ns     238ns  1.2800us  cuDeviceGetCount
  0.00%     466ns         2     233ns     185ns     281ns  cuDeviceGet
