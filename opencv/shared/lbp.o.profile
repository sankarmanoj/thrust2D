==25212== NVPROF is profiling process 25212, command: ./lbp.o
==25212== Profiling application: ./lbp.o
==25212== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.31%  48.033us         1  48.033us  48.033us  48.033us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 25.78%  27.328us         6  4.5540us  1.1840us  21.312us  [CUDA memcpy HtoD]
 19.77%  20.961us         1  20.961us  20.961us  20.961us  [CUDA memcpy DtoH]
  7.00%  7.4240us         3  2.4740us  2.2720us  2.8480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.14%  2.2720us         1  2.2720us  2.2720us  2.2720us  [CUDA memcpy DtoD]

==25212== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.37%  259.91ms         8  32.489ms  6.7810us  259.33ms  cudaMalloc
  1.39%  3.7208ms        90  41.342us     116ns  2.6836ms  cuDeviceGetAttribute
  0.38%  1.0113ms         2  505.66us  340.90us  670.42us  cudaGetDeviceProperties
  0.37%  987.08us         1  987.08us  987.08us  987.08us  cuDeviceGetName
  0.21%  551.31us         1  551.31us  551.31us  551.31us  cudaMallocPitch
  0.08%  216.93us         1  216.93us  216.93us  216.93us  cuDeviceTotalMem
  0.07%  178.31us         3  59.435us  6.4510us  142.49us  cudaFree
  0.06%  161.37us         6  26.895us  5.8180us  107.61us  cudaMemcpy
  0.03%  72.265us         4  18.066us  9.6470us  33.641us  cudaLaunch
  0.01%  33.357us        12  2.7790us  2.3650us  5.0280us  cudaFuncGetAttributes
  0.01%  28.694us         1  28.694us  28.694us  28.694us  cudaMemcpy2D
  0.01%  25.539us         1  25.539us  25.539us  25.539us  cudaMemcpyAsync
  0.00%  9.4360us         1  9.4360us  9.4360us  9.4360us  cudaCreateTextureObject
  0.00%  5.5750us         9     619ns     315ns  1.6270us  cudaGetDevice
  0.00%  5.1780us        11     470ns     352ns  1.0430us  cudaDeviceGetAttribute
  0.00%  5.0570us         3  1.6850us  1.1640us  2.2410us  cudaEventCreateWithFlags
  0.00%  4.3120us         3  1.4370us  1.0470us  1.8540us  cudaEventRecord
  0.00%  3.1760us         3  1.0580us     790ns  1.3200us  cudaEventDestroy
  0.00%  2.9250us         4     731ns     287ns  1.2170us  cudaConfigureCall
  0.00%  2.3620us         7     337ns     207ns     537ns  cudaSetupArgument
  0.00%  2.2780us         2  1.1390us     630ns  1.6480us  cuDeviceGetCount
  0.00%     640ns         2     320ns     301ns     339ns  cuDeviceGet
  0.00%     228ns         1     228ns     228ns     228ns  cudaCreateChannelDesc
