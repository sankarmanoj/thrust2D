==6824== NVPROF is profiling process 6824, command: ./pyrdown.o
==6824== Profiling application: ./pyrdown.o
==6824== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 64.19%  2.3684ms         1  2.3684ms  2.3684ms  2.3684ms  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 21.31%  786.24us        51  15.416us     320ns  743.28us  [CUDA memcpy DtoH]
  8.04%  296.53us         1  296.53us  296.53us  296.53us  void thrust::for_each_kernel<float, pyrdownTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, pyrdownTransformFunctor)
  4.03%  148.88us        57  2.6110us     608ns  83.538us  [CUDA memcpy HtoD]
  1.19%  44.025us         4  11.006us  1.6320us  18.717us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.17%  43.225us         1  43.225us  43.225us  43.225us  [CUDA memcpy DtoD]
  0.07%  2.4960us         1  2.4960us  2.4960us  2.4960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6824== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.88%  721.69ms        11  65.608ms  16.938us  705.40ms  cudaMalloc
  1.17%  8.7064ms         4  2.1766ms  36.410us  6.2336ms  cudaFree
  1.02%  7.6013ms         2  3.8006ms  2.4406ms  5.1607ms  cudaGetDeviceProperties
  0.41%  3.0568ms         2  1.5284ms  673.81us  2.3830ms  cudaDeviceSynchronize
  0.20%  1.4963ms         8  187.03us  24.874us  1.2494ms  cudaMemcpy
  0.16%  1.1901ms       101  11.783us  2.9170us  220.17us  cudaMemcpyAsync
  0.05%  382.00us        90  4.2440us     134ns  160.02us  cuDeviceGetAttribute
  0.04%  314.94us         7  44.991us  32.613us  53.873us  cudaLaunch
  0.03%  222.60us         1  222.60us  222.60us  222.60us  cuDeviceTotalMem
  0.01%  84.798us        21  4.0380us  1.8200us  9.1820us  cudaFuncGetAttributes
  0.01%  48.537us         1  48.537us  48.537us  48.537us  cuDeviceGetName
  0.00%  26.246us        16  1.6400us     258ns  4.4730us  cudaGetDevice
  0.00%  15.088us         5  3.0170us  2.3020us  3.4020us  cudaEventCreateWithFlags
  0.00%  12.792us        13     984ns     159ns  7.5860us  cudaSetupArgument
  0.00%  11.713us         5  2.3420us  1.9160us  3.2930us  cudaEventRecord
  0.00%  10.528us         7  1.5040us  1.0480us  2.3770us  cudaConfigureCall
  0.00%  8.0110us         5  1.6020us  1.3000us  2.2220us  cudaEventDestroy
  0.00%  6.5530us        15     436ns     260ns  1.2340us  cudaDeviceGetAttribute
  0.00%  4.1220us         2  2.0610us  1.8610us  2.2610us  cuDeviceGetCount
  0.00%  2.0810us         1  2.0810us  2.0810us  2.0810us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  2.0070us         2  1.0030us     774ns  1.2330us  cudaGetLastError
  0.00%     849ns         2     424ns     358ns     491ns  cuDeviceGet
