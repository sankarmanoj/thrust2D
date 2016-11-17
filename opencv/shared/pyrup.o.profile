==26160== NVPROF is profiling process 26160, command: ./pyrup.o
==26160== Profiling application: ./pyrup.o
==26160== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.92%  46.655us        25  1.8660us     543ns  32.807us  [CUDA memcpy HtoD]
 23.28%  22.671us         1  22.671us  22.671us  22.671us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 20.10%  19.566us        19  1.0290us     319ns  10.936us  [CUDA memcpy DtoH]
  6.01%  5.8520us         4  1.4630us  1.2150us  1.8230us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.69%  2.6220us         1  2.6220us  2.6220us  2.6220us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==26160== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.23%  189.28ms        11  17.207ms  5.1280us  188.68ms  cudaMalloc
  0.17%  316.52us         5  63.304us  9.2160us  178.80us  cudaFree
  0.13%  247.76us        90  2.7520us     150ns  94.903us  cuDeviceGetAttribute
  0.12%  227.94us        37  6.1600us  1.8800us  59.396us  cudaMemcpyAsync
  0.09%  171.88us         1  171.88us  171.88us  171.88us  cuDeviceTotalMem
  0.09%  167.62us         1  167.62us  167.62us  167.62us  cudaGetDeviceProperties
  0.07%  132.57us         7  18.939us  5.6010us  60.578us  cudaMemcpy
  0.06%  110.39us         6  18.398us  8.1440us  41.329us  cudaLaunch
  0.02%  37.270us        20  1.8630us  1.3590us  4.5740us  cudaFuncGetAttributes
  0.01%  22.233us         1  22.233us  22.233us  22.233us  cuDeviceGetName
  0.00%  8.4230us        15     561ns     201ns  1.8340us  cudaGetDevice
  0.00%  7.6740us         5  1.5340us     735ns  2.5390us  cudaEventCreateWithFlags
  0.00%  6.7040us         5  1.3400us     673ns  2.1620us  cudaEventRecord
  0.00%  5.3210us         8     665ns     115ns  3.2210us  cudaSetupArgument
  0.00%  4.7790us         5     955ns     607ns  1.2100us  cudaEventDestroy
  0.00%  3.2660us         6     544ns     199ns  1.0360us  cudaConfigureCall
  0.00%  3.2610us        11     296ns     200ns     786ns  cudaDeviceGetAttribute
  0.00%  1.3400us         2     670ns     272ns  1.0680us  cuDeviceGetCount
  0.00%     470ns         2     235ns     153ns     317ns  cuDeviceGet
