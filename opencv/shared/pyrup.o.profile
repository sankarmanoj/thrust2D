==12937== NVPROF is profiling process 12937, command: ./pyrup.o
==12937== Profiling application: ./pyrup.o
==12937== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.50%  111.51us        27  4.1300us     576ns  81.213us  [CUDA memcpy HtoD]
 30.17%  77.341us         1  77.341us  77.341us  77.341us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 13.70%  35.134us        19  1.8490us     319ns  20.991us  [CUDA memcpy DtoH]
  6.65%  17.055us         1  17.055us  17.055us  17.055us  void thrust::for_each_kernel<float, pyrupTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrupTransformFunctor)
  4.58%  11.744us         4  2.9360us  1.5360us  4.6080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.40%  3.5840us         1  3.5840us  3.5840us  3.5840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12937== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.25%  771.65ms        13  59.358ms  5.1240us  769.10ms  cudaMalloc
  3.18%  25.774ms         2  12.887ms  11.421ms  14.353ms  cudaGetDeviceProperties
  1.08%  8.7761ms        90  97.512us     103ns  5.5165ms  cuDeviceGetAttribute
  0.19%  1.5423ms         5  308.46us  4.3350us  1.1355ms  cudaFree
  0.09%  737.07us         9  81.897us  4.6600us  474.45us  cudaMemcpy
  0.07%  588.66us         1  588.66us  588.66us  588.66us  cuDeviceTotalMem
  0.05%  421.56us        37  11.393us  2.0790us  159.43us  cudaMemcpyAsync
  0.04%  338.02us         1  338.02us  338.02us  338.02us  cuDeviceGetName
  0.02%  170.69us         7  24.384us  8.5280us  43.192us  cudaLaunch
  0.01%  52.898us        20  2.6440us  1.4200us  7.0920us  cudaFuncGetAttributes
  0.00%  11.037us        15     735ns     214ns  2.8060us  cudaGetDevice
  0.00%  9.5100us         5  1.9020us  1.2740us  2.9170us  cudaEventCreateWithFlags
  0.00%  7.9300us        12     660ns     112ns  4.2460us  cudaSetupArgument
  0.00%  6.9220us         7     988ns     261ns  1.8800us  cudaConfigureCall
  0.00%  6.8280us         5  1.3650us     920ns  1.8740us  cudaEventRecord
  0.00%  5.4700us         5  1.0940us     763ns  1.4300us  cudaEventDestroy
  0.00%  3.0080us        11     273ns     205ns     799ns  cudaDeviceGetAttribute
  0.00%  2.2070us         2  1.1030us     450ns  1.7570us  cuDeviceGetCount
  0.00%     517ns         2     258ns     173ns     344ns  cuDeviceGet
