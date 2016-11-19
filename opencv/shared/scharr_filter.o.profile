==4242== NVPROF is profiling process 4242, command: ./scharr_filter.o
==4242== Profiling application: ./scharr_filter.o
==4242== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.92%  106.43us        26  4.0930us     576ns  80.563us  [CUDA memcpy HtoD]
 31.31%  92.758us         1  92.758us  92.758us  92.758us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 28.00%  82.963us         1  82.963us  82.963us  82.963us  [CUDA memcpy DtoH]
  3.51%  10.402us         4  2.6000us     992ns  4.1290us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.25%  3.7130us         1  3.7130us  3.7130us  3.7130us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4242== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.01%  222.07ms        12  18.506ms  7.2200us  220.56ms  cudaMalloc
  2.29%  5.3018ms         2  2.6509ms  254.57us  5.0472ms  cudaGetDeviceProperties
  1.15%  2.6597ms         5  531.95us  6.1890us  2.2952ms  cudaFree
  0.15%  350.04us         8  43.755us  6.7950us  264.61us  cudaMemcpy
  0.13%  297.32us        90  3.3030us     101ns  120.34us  cuDeviceGetAttribute
  0.08%  190.65us         1  190.65us  190.65us  190.65us  cuDeviceTotalMem
  0.07%  173.46us        19  9.1290us  3.6930us  101.92us  cudaMemcpyAsync
  0.05%  111.26us         6  18.543us  10.838us  33.617us  cudaLaunch
  0.02%  57.337us        20  2.8660us  2.4270us  4.8180us  cudaFuncGetAttributes
  0.01%  33.695us         1  33.695us  33.695us  33.695us  cuDeviceGetName
  0.00%  10.075us        15     671ns     360ns  1.8700us  cudaGetDevice
  0.00%  8.1440us         5  1.6280us  1.3370us  2.4330us  cudaEventCreateWithFlags
  0.00%  6.9750us         5  1.3950us  1.1190us  1.9530us  cudaEventRecord
  0.00%  5.2630us         5  1.0520us     842ns  1.3190us  cudaEventDestroy
  0.00%  5.1090us        11     464ns     358ns     968ns  cudaDeviceGetAttribute
  0.00%  4.1680us         6     694ns     357ns  1.3670us  cudaConfigureCall
  0.00%  3.0770us         9     341ns     205ns     494ns  cudaSetupArgument
  0.00%  2.5390us         2  1.2690us     673ns  1.8660us  cuDeviceGetCount
  0.00%     796ns         1     796ns     796ns     796ns  cudaGetLastError
  0.00%     369ns         2     184ns     168ns     201ns  cuDeviceGet
