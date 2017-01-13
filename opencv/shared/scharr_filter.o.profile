==15209== NVPROF is profiling process 15209, command: ./scharr_filter.o 1631
==15209== Profiling application: ./scharr_filter.o 1631
==15209== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 19.39%  8.8291ms         1  8.8291ms  8.8291ms  8.8291ms  [CUDA memcpy DtoH]
 16.49%  7.5116ms         7  1.0731ms     672ns  7.5075ms  [CUDA memcpy HtoD]
 16.05%  7.3113ms         4  1.8278ms  1.7174ms  2.1431ms  [CUDA memcpy DtoA]
 15.29%  6.9637ms         2  3.4819ms  3.4739ms  3.4899ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 11.96%  5.4458ms         2  2.7229ms  2.7019ms  2.7440ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  8.23%  3.7490ms         2  1.8745ms  1.6033ms  2.1457ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.63%  3.4761ms         1  3.4761ms  3.4761ms  3.4761ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.95%  2.2524ms         4  563.11us  553.18us  570.78us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==15209== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 87.33%  324.95ms        10  32.495ms  5.3880us  323.44ms  cudaMalloc
  6.64%  24.694ms         5  4.9388ms  389.06us  22.378ms  cudaMemcpy
  3.48%  12.939ms         2  6.4693ms  3.2679ms  9.6706ms  cudaMemcpyToSymbol
  2.13%  7.9076ms         1  7.9076ms  7.9076ms  7.9076ms  cudaMemcpyAsync
  0.16%  606.82us         2  303.41us  250.70us  356.12us  cudaMallocArray
  0.08%  314.27us         4  78.566us  56.909us  139.68us  cudaFree
  0.06%  211.92us        90  2.3540us     101ns  84.497us  cuDeviceGetAttribute
  0.04%  142.80us        11  12.982us  4.6500us  51.697us  cudaLaunch
  0.03%  117.94us         1  117.94us  117.94us  117.94us  cuDeviceTotalMem
  0.02%  74.482us         4  18.620us  8.2210us  37.335us  cudaMemcpyToArray
  0.01%  51.625us        28  1.8430us  1.3710us  6.8100us  cudaFuncGetAttributes
  0.01%  22.618us         1  22.618us  22.618us  22.618us  cuDeviceGetName
  0.00%  14.889us         4  3.7220us  2.4420us  6.4060us  cudaCreateTextureObject
  0.00%  10.167us        21     484ns     202ns  2.6950us  cudaGetDevice
  0.00%  8.6000us         7  1.2280us     588ns  2.2240us  cudaEventCreateWithFlags
  0.00%  8.4530us        23     367ns     110ns  3.7590us  cudaSetupArgument
  0.00%  7.3570us         7  1.0510us     506ns  2.0440us  cudaEventRecord
  0.00%  5.9940us         7     856ns     417ns  1.5000us  cudaEventDestroy
  0.00%  3.9880us        11     362ns     153ns     964ns  cudaConfigureCall
  0.00%  3.1360us        11     285ns     203ns     643ns  cudaDeviceGetAttribute
  0.00%  2.2430us         2  1.1210us     401ns  1.8420us  cuDeviceGetCount
  0.00%     466ns         2     233ns     177ns     289ns  cuDeviceGet
  0.00%     242ns         2     121ns     117ns     125ns  cudaCreateChannelDesc
