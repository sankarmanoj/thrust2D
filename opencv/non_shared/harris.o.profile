==23518== NVPROF is profiling process 23518, command: ./harris.o
==23518== Profiling application: ./harris.o
==23518== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.77%  101.57us         1  101.57us  101.57us  101.57us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 20.94%  37.461us        23  1.6280us     575ns  19.131us  [CUDA memcpy HtoD]
 16.84%  30.137us        19  1.5860us     320ns  18.299us  [CUDA memcpy DtoH]
  4.68%  8.3810us         3  2.7930us  2.1430us  4.0950us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.77%  1.3750us         1  1.3750us  1.3750us  1.3750us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==23518== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.62%  412.15ms         8  51.519ms  4.5490us  411.35ms  cudaMalloc
  0.10%  402.93us        90  4.4770us     123ns  156.51us  cuDeviceGetAttribute
  0.09%  380.69us         4  95.172us  5.8020us  330.17us  cudaFree
  0.06%  229.05us        37  6.1900us  2.0560us  23.408us  cudaMemcpyAsync
  0.05%  208.77us         1  208.77us  208.77us  208.77us  cuDeviceTotalMem
  0.04%  176.52us         5  35.304us  4.7960us  145.83us  cudaMemcpy
  0.01%  60.792us         5  12.158us  6.3900us  27.484us  cudaLaunch
  0.01%  41.649us         1  41.649us  41.649us  41.649us  cuDeviceGetName
  0.01%  33.504us        20  1.6750us  1.3980us  4.3030us  cudaFuncGetAttributes
  0.00%  6.3640us        15     424ns     216ns  2.3330us  cudaGetDevice
  0.00%  5.3680us         5  1.0730us     721ns  1.9850us  cudaEventCreateWithFlags
  0.00%  5.3170us         5  1.0630us     239ns  4.0020us  cudaSetupArgument
  0.00%  4.1770us         5     835ns     643ns  1.2120us  cudaEventRecord
  0.00%  3.5910us         5     718ns     553ns  1.0450us  cudaEventDestroy
  0.00%  3.3130us        11     301ns     217ns     907ns  cudaDeviceGetAttribute
  0.00%  2.0700us         5     414ns     189ns  1.0130us  cudaConfigureCall
  0.00%  1.9150us         2     957ns     702ns  1.2130us  cuDeviceGetCount
  0.00%     532ns         2     266ns     220ns     312ns  cuDeviceGet
