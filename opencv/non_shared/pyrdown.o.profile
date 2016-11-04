==3505== NVPROF is profiling process 3505, command: ./pyrdown.o
==3505== Profiling application: ./pyrdown.o
==3505== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 76.02%  2.6489ms         1  2.6489ms  2.6489ms  2.6489ms  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 16.33%  568.96us        51  11.156us     320ns  525.95us  [CUDA memcpy DtoH]
  3.96%  138.12us        56  2.4660us     576ns  73.220us  [CUDA memcpy HtoD]
  1.22%  42.435us         1  42.435us  42.435us  42.435us  [CUDA memcpy DtoD]
  1.21%  42.146us         1  42.146us  42.146us  42.146us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.19%  41.506us         4  10.376us  1.3440us  19.329us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.07%  2.4960us         1  2.4960us  2.4960us  2.4960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3505== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.18%  369.20ms        10  36.920ms  6.8050us  359.66ms  cudaMalloc
  2.31%  8.9695ms         4  2.2424ms  24.930us  5.2539ms  cudaFree
  0.70%  2.7197ms         2  1.3599ms  62.508us  2.6572ms  cudaDeviceSynchronize
  0.56%  2.1678ms         1  2.1678ms  2.1678ms  2.1678ms  cudaGetDeviceProperties
  0.48%  1.8635ms        90  20.705us     118ns  847.09us  cuDeviceGetAttribute
  0.38%  1.4598ms       101  14.453us  2.1690us  248.93us  cudaMemcpyAsync
  0.22%  857.92us         7  122.56us  13.449us  742.67us  cudaMemcpy
  0.07%  285.93us         1  285.93us  285.93us  285.93us  cuDeviceTotalMem
  0.04%  173.81us         7  24.829us  12.938us  32.816us  cudaLaunch
  0.02%  80.639us         1  80.639us  80.639us  80.639us  cuDeviceGetName
  0.02%  69.449us        25  2.7770us  1.4170us  8.3630us  cudaFuncGetAttributes
  0.00%  16.307us        19     858ns     206ns  2.7120us  cudaGetDevice
  0.00%  11.734us         6  1.9550us  1.0280us  2.7430us  cudaEventCreateWithFlags
  0.00%  9.2770us         6  1.5460us     879ns  2.0140us  cudaEventRecord
  0.00%  8.1820us         6  1.3630us     710ns  1.8640us  cudaEventDestroy
  0.00%  7.7460us        11     704ns     114ns  4.2690us  cudaSetupArgument
  0.00%  5.9810us         7     854ns     308ns  1.2390us  cudaConfigureCall
  0.00%  4.3850us        15     292ns     206ns     875ns  cudaDeviceGetAttribute
  0.00%  1.6240us         2     812ns     300ns  1.3240us  cuDeviceGetCount
  0.00%  1.2570us         1  1.2570us  1.2570us  1.2570us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     637ns         1     637ns     637ns     637ns  cudaGetLastError
  0.00%     444ns         2     222ns     175ns     269ns  cuDeviceGet
