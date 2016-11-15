==8273== NVPROF is profiling process 8273, command: ./blend.o
==8273== Profiling application: ./blend.o
==8273== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.77%  213.85us         5  42.770us     672ns  110.28us  [CUDA memcpy HtoD]
 26.31%  95.730us         1  95.730us  95.730us  95.730us  [CUDA memcpy DtoH]
 11.52%  41.932us         1  41.932us  41.932us  41.932us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.40%  12.379us         3  4.1260us  3.7750us  4.5100us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8273== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.58%  809.51ms         6  134.92ms  5.2020us  809.15ms  cudaMalloc
  1.25%  10.299ms        90  114.43us     101ns  6.6874ms  cuDeviceGetAttribute
  0.06%  505.79us         4  126.45us  5.8860us  481.57us  cudaMemcpy
  0.03%  242.40us         1  242.40us  242.40us  242.40us  cuDeviceTotalMem
  0.03%  217.01us         2  108.50us  104.30us  112.71us  cudaMemcpyAsync
  0.02%  166.82us         3  55.605us  8.3030us  119.29us  cudaFree
  0.01%  109.19us         1  109.19us  109.19us  109.19us  cuDeviceGetName
  0.01%  48.354us         4  12.088us  9.7400us  14.818us  cudaLaunch
  0.00%  29.104us        16  1.8190us  1.4410us  3.7320us  cudaFuncGetAttributes
  0.00%  5.2030us        12     433ns     210ns  1.4810us  cudaGetDevice
  0.00%  4.8710us         4  1.2170us     944ns  1.7980us  cudaEventCreateWithFlags
  0.00%  4.1590us         4  1.0390us     239ns  2.5770us  cudaSetupArgument
  0.00%  4.0030us         4  1.0000us     806ns  1.4700us  cudaEventRecord
  0.00%  3.7210us        11     338ns     209ns     920ns  cudaDeviceGetAttribute
  0.00%  3.2070us         4     801ns     612ns  1.1160us  cudaEventDestroy
  0.00%  2.6250us         2  1.3120us     792ns  1.8330us  cuDeviceGetCount
  0.00%  1.7180us         4     429ns     287ns     798ns  cudaConfigureCall
  0.00%     715ns         2     357ns     247ns     468ns  cuDeviceGet
