==9799== NVPROF is profiling process 9799, command: ./erode.o 1631
==9799== Profiling application: ./erode.o 1631
==9799== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.00%  2.3834ms         6  397.23us     672ns  2.3800ms  [CUDA memcpy HtoD]
 27.43%  1.1886ms         1  1.1886ms  1.1886ms  1.1886ms  [CUDA memcpy DtoH]
  7.65%  331.59us         1  331.59us  331.59us  331.59us  void thrust::transform_texture_kernel<unsigned char, erodeFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  5.47%  236.93us         1  236.93us  236.93us  236.93us  [CUDA memcpy DtoD]
  4.46%  193.12us         3  64.373us  59.424us  69.952us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9799== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.14%  560.44ms         8  70.055ms  12.997us  556.27ms  cudaMalloc
  0.98%  5.6786ms         6  946.43us  43.060us  2.5806ms  cudaMemcpy
  0.82%  4.7423ms         3  1.5808ms  245.96us  3.2520ms  cudaFree
  0.37%  2.1151ms         2  1.0576ms  219.00us  1.8961ms  cudaGetDeviceProperties
  0.31%  1.8080ms         1  1.8080ms  1.8080ms  1.8080ms  cudaMemcpyAsync
  0.22%  1.2949ms         1  1.2949ms  1.2949ms  1.2949ms  cudaMallocPitch
  0.04%  244.81us        90  2.7200us     132ns  91.121us  cuDeviceGetAttribute
  0.03%  192.46us         4  48.115us  36.116us  63.608us  cudaLaunch
  0.03%  169.53us         1  169.53us  169.53us  169.53us  cuDeviceTotalMem
  0.01%  80.771us         1  80.771us  80.771us  80.771us  cudaMemcpy2D
  0.01%  48.269us        12  4.0220us  2.0100us  9.8280us  cudaFuncGetAttributes
  0.00%  28.645us         1  28.645us  28.645us  28.645us  cuDeviceGetName
  0.00%  21.017us         1  21.017us  21.017us  21.017us  cudaCreateTextureObject
  0.00%  12.095us         9  1.3430us     373ns  4.4220us  cudaGetDevice
  0.00%  9.8540us         3  3.2840us  2.6420us  4.2220us  cudaEventCreateWithFlags
  0.00%  9.3870us         4  2.3460us  1.2920us  3.0130us  cudaConfigureCall
  0.00%  8.8250us         3  2.9410us  2.0570us  3.6860us  cudaEventRecord
  0.00%  6.9060us         3  2.3020us  1.6930us  3.0200us  cudaEventDestroy
  0.00%  6.2030us        11     563ns     284ns  1.5770us  cudaDeviceGetAttribute
  0.00%  3.8230us         7     546ns     221ns     946ns  cudaSetupArgument
  0.00%  3.3080us         2  1.6540us     752ns  2.5560us  cuDeviceGetCount
  0.00%     730ns         2     365ns     249ns     481ns  cuDeviceGet
  0.00%     453ns         1     453ns     453ns     453ns  cudaCreateChannelDesc
