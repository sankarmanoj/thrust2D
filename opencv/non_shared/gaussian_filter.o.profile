==5535== NVPROF is profiling process 5535, command: ./gaussian_filter.o
==5535== Profiling application: ./gaussian_filter.o
==5535== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.63%  963.67us         1  963.67us  963.67us  963.67us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 34.92%  894.24us       728  1.2280us     543ns  19.294us  [CUDA memcpy HtoD]
 26.98%  690.83us       723     955ns     319ns  19.038us  [CUDA memcpy DtoH]
  0.41%  10.463us         4  2.6150us  2.1430us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.06%  1.5680us         1  1.5680us  1.5680us  1.5680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5535== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.62%  626.89ms        10  62.689ms  5.9290us  625.59ms  cudaMalloc
  2.48%  16.061ms      1445  11.114us  2.8030us  162.02us  cudaMemcpyAsync
  0.60%  3.8680ms        90  42.978us     103ns  2.1333ms  cuDeviceGetAttribute
  0.17%  1.0840ms         6  180.66us  6.7710us  1.0204ms  cudaMemcpy
  0.04%  282.75us         1  282.75us  282.75us  282.75us  cuDeviceTotalMem
  0.04%  272.33us         5  54.466us  5.6880us  141.62us  cudaFree
  0.02%  121.84us         1  121.84us  121.84us  121.84us  cuDeviceGetName
  0.02%  112.53us         6  18.754us  8.5750us  33.110us  cudaLaunch
  0.01%  71.906us        24  2.9960us  1.8170us  6.1290us  cudaFuncGetAttributes
  0.00%  11.655us        18     647ns     281ns  1.8770us  cudaGetDevice
  0.00%  9.1530us         6  1.5250us     960ns  2.1850us  cudaEventCreateWithFlags
  0.00%  8.7500us         6  1.4580us     920ns  2.1980us  cudaEventRecord
  0.00%  7.7240us         6  1.2870us     319ns  4.9570us  cudaSetupArgument
  0.00%  6.5010us         6  1.0830us     833ns  1.3540us  cudaEventDestroy
  0.00%  4.1290us        11     375ns     238ns  1.0970us  cudaDeviceGetAttribute
  0.00%  3.8380us         6     639ns     306ns  1.1560us  cudaConfigureCall
  0.00%  2.4250us         2  1.2120us     635ns  1.7900us  cuDeviceGetCount
  0.00%     660ns         2     330ns     290ns     370ns  cuDeviceGet
