==5552== NVPROF is profiling process 5552, command: ./pyrdown.o
==5552== Profiling application: ./pyrdown.o
==5552== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.00%  267.02us         1  267.02us  267.02us  267.02us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.24%  100.67us        19  5.2980us     319ns  86.106us  [CUDA memcpy DtoH]
 11.22%  50.780us        25  2.0310us     576ns  22.654us  [CUDA memcpy HtoD]
  3.70%  16.766us         1  16.766us  16.766us  16.766us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.51%  15.904us         5  3.1800us  1.9840us  4.7680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.31%  1.4080us         1  1.4080us  1.4080us  1.4080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5552== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.04%  697.24ms        12  58.103ms  6.9420us  696.09ms  cudaMalloc
  0.52%  3.6585ms         6  609.75us  14.424us  2.2593ms  cudaFree
  0.18%  1.2885ms        90  14.316us     132ns  678.44us  cuDeviceGetAttribute
  0.11%  800.21us         7  114.32us  7.7040us  718.41us  cudaMemcpy
  0.06%  397.12us        37  10.732us  3.4900us  69.728us  cudaMemcpyAsync
  0.03%  221.34us         1  221.34us  221.34us  221.34us  cuDeviceTotalMem
  0.03%  185.60us         8  23.199us  9.9850us  42.349us  cudaLaunch
  0.01%  100.87us        32  3.1520us  1.9770us  11.764us  cudaFuncGetAttributes
  0.00%  32.443us         1  32.443us  32.443us  32.443us  cuDeviceGetName
  0.00%  16.548us        24     689ns     325ns  2.2600us  cudaGetDevice
  0.00%  15.994us         1  15.994us  15.994us  15.994us  cudaDeviceSynchronize
  0.00%  15.805us         8  1.9750us  1.1860us  2.9120us  cudaEventCreateWithFlags
  0.00%  11.627us         8  1.4530us     905ns  2.0550us  cudaEventRecord
  0.00%  9.7070us         8  1.2130us     807ns  1.8630us  cudaEventDestroy
  0.00%  8.4780us         8  1.0590us     304ns  4.8990us  cudaSetupArgument
  0.00%  6.2960us         8     787ns     365ns  1.4940us  cudaConfigureCall
  0.00%  4.7070us        11     427ns     290ns  1.2310us  cudaDeviceGetAttribute
  0.00%  1.6850us         2     842ns     191ns  1.4940us  cuDeviceGetCount
  0.00%     406ns         2     203ns     140ns     266ns  cuDeviceGet
