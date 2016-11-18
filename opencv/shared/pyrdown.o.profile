==9522== NVPROF is profiling process 9522, command: ./pyrdown.o
==9522== Profiling application: ./pyrdown.o
==9522== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.07%  109.86us        25  4.3940us     576ns  82.304us  [CUDA memcpy HtoD]
 33.93%  84.576us         1  84.576us  84.576us  84.576us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 15.31%  38.176us        19  2.0090us     320ns  20.992us  [CUDA memcpy DtoH]
  5.49%  13.696us         4  3.4240us  1.5040us  4.6720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.19%  2.9760us         1  2.9760us  2.9760us  2.9760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9522== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.97%  1.38863s        11  126.24ms  4.5130us  1.38775s  cudaMalloc
  1.64%  23.263ms        90  258.48us     101ns  10.522ms  cuDeviceGetAttribute
  0.18%  2.5654ms         1  2.5654ms  2.5654ms  2.5654ms  cuDeviceGetName
  0.06%  850.29us        37  22.980us  2.2540us  481.50us  cudaMemcpyAsync
  0.05%  716.67us         1  716.67us  716.67us  716.67us  cuDeviceTotalMem
  0.05%  669.73us         7  95.675us  6.4580us  228.27us  cudaMemcpy
  0.02%  253.86us         1  253.86us  253.86us  253.86us  cudaGetDeviceProperties
  0.02%  231.32us         5  46.263us  4.1340us  130.99us  cudaFree
  0.01%  81.619us         6  13.603us  5.9890us  26.083us  cudaLaunch
  0.00%  35.349us        20  1.7670us  1.3960us  4.0850us  cudaFuncGetAttributes
  0.00%  8.2010us         5  1.6400us     729ns  3.8480us  cudaEventCreateWithFlags
  0.00%  6.3840us        15     425ns     213ns  1.3790us  cudaGetDevice
  0.00%  4.8060us         8     600ns     122ns  3.1760us  cudaSetupArgument
  0.00%  4.7840us         5     956ns     665ns  1.4020us  cudaEventRecord
  0.00%  4.0170us         5     803ns     550ns  1.1610us  cudaEventDestroy
  0.00%  3.2630us        11     296ns     211ns     892ns  cudaDeviceGetAttribute
  0.00%  2.6720us         6     445ns     186ns     815ns  cudaConfigureCall
  0.00%  1.4350us         2     717ns     142ns  1.2930us  cuDeviceGetCount
  0.00%     379ns         2     189ns     108ns     271ns  cuDeviceGet
