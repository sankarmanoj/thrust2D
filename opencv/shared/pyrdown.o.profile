==10632== NVPROF is profiling process 10632, command: ./pyrdown.o
==10632== Profiling application: ./pyrdown.o
==10632== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 62.53%  2.5705ms         1  2.5705ms  2.5705ms  2.5705ms  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 24.21%  995.41us        51  19.517us     320ns  952.47us  [CUDA memcpy DtoH]
  7.55%  310.22us         1  310.22us  310.22us  310.22us  void thrust::for_each_kernel<float, pyrdownTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, pyrdownTransformFunctor)
  3.58%  147.24us        57  2.5830us     576ns  80.033us  [CUDA memcpy HtoD]
  1.03%  42.273us         1  42.273us  42.273us  42.273us  [CUDA memcpy DtoD]
  1.02%  41.728us         4  10.432us  1.5680us  18.080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.08%  3.4560us         1  3.4560us  3.4560us  3.4560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10632== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.59%  557.91ms        11  50.719ms  12.881us  549.36ms  cudaMalloc
  1.09%  6.2897ms         4  1.5724ms  46.559us  3.6174ms  cudaFree
  0.89%  5.1397ms         2  2.5698ms  2.2343ms  2.9054ms  cudaGetDeviceProperties
  0.52%  2.9883ms         2  1.4942ms  320.41us  2.6679ms  cudaDeviceSynchronize
  0.37%  2.1146ms       101  20.936us  2.9570us  495.61us  cudaMemcpyAsync
  0.34%  1.9596ms         8  244.94us  16.079us  1.6832ms  cudaMemcpy
  0.06%  370.61us         7  52.943us  28.404us  69.454us  cudaLaunch
  0.06%  369.01us        90  4.1000us     117ns  144.37us  cuDeviceGetAttribute
  0.04%  215.72us         1  215.72us  215.72us  215.72us  cuDeviceTotalMem
  0.02%  92.900us        21  4.4230us  1.8720us  17.776us  cudaFuncGetAttributes
  0.01%  35.963us         1  35.963us  35.963us  35.963us  cuDeviceGetName
  0.00%  25.554us        16  1.5970us     363ns  5.0010us  cudaGetDevice
  0.00%  24.882us        15  1.6580us     253ns  19.142us  cudaDeviceGetAttribute
  0.00%  16.278us         5  3.2550us  2.0910us  4.4570us  cudaEventCreateWithFlags
  0.00%  15.326us        13  1.1780us     156ns  9.8170us  cudaSetupArgument
  0.00%  12.241us         5  2.4480us  1.8770us  3.3750us  cudaEventRecord
  0.00%  11.565us         7  1.6520us     966ns  2.8110us  cudaConfigureCall
  0.00%  9.8340us         5  1.9660us  1.2900us  2.6310us  cudaEventDestroy
  0.00%  3.0170us         1  3.0170us  3.0170us  3.0170us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  2.3550us         2  1.1770us     353ns  2.0020us  cuDeviceGetCount
  0.00%  1.8340us         2     917ns     711ns  1.1230us  cudaGetLastError
  0.00%     429ns         2     214ns     163ns     266ns  cuDeviceGet
