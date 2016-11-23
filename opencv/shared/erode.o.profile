==26355== NVPROF is profiling process 26355, command: ./erode.o
==26355== Profiling application: ./erode.o
==26355== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.70%  34.304us         1  34.304us  34.304us  34.304us  [CUDA memcpy DtoH]
 30.68%  31.233us         6  5.2050us  1.1840us  24.065us  [CUDA memcpy HtoD]
 25.37%  25.824us         1  25.824us  25.824us  25.824us  void thrust::transform_texture_kernel<unsigned char, erodeFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  8.05%  8.1920us         3  2.7300us  2.2400us  3.7120us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.20%  2.2400us         1  2.2400us  2.2400us  2.2400us  [CUDA memcpy DtoD]

==26355== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.71%  269.05ms         8  33.632ms  6.8280us  257.89ms  cudaMalloc
  2.07%  5.7665ms         2  2.8832ms  1.4129ms  4.3536ms  cudaGetDeviceProperties
  0.43%  1.2054ms        90  13.392us     123ns  594.61us  cuDeviceGetAttribute
  0.21%  594.62us         1  594.62us  594.62us  594.62us  cudaMallocPitch
  0.16%  443.67us         1  443.67us  443.67us  443.67us  cuDeviceTotalMem
  0.15%  425.24us         3  141.75us  7.2960us  376.70us  cudaFree
  0.08%  232.29us         6  38.715us  6.1340us  145.09us  cudaMemcpy
  0.07%  196.75us         1  196.75us  196.75us  196.75us  cuDeviceGetName
  0.04%  106.29us         4  26.573us  11.417us  39.263us  cudaLaunch
  0.02%  53.615us         1  53.615us  53.615us  53.615us  cudaMemcpyAsync
  0.02%  53.287us         1  53.287us  53.287us  53.287us  cudaMemcpy2D
  0.01%  33.426us        12  2.7850us  1.9090us  6.5920us  cudaFuncGetAttributes
  0.01%  15.703us         1  15.703us  15.703us  15.703us  cudaCreateTextureObject
  0.00%  6.8200us         9     757ns     249ns  3.1020us  cudaGetDevice
  0.00%  6.0110us         3  2.0030us  1.0300us  2.6570us  cudaEventCreateWithFlags
  0.00%  5.7660us         4  1.4410us     433ns  1.8320us  cudaConfigureCall
  0.00%  5.2060us         3  1.7350us     963ns  2.2390us  cudaEventRecord
  0.00%  4.7510us        11     431ns     256ns  1.7130us  cudaDeviceGetAttribute
  0.00%  3.7060us         3  1.2350us     733ns  1.5580us  cudaEventDestroy
  0.00%  2.9520us         7     421ns     142ns     882ns  cudaSetupArgument
  0.00%  1.9960us         2     998ns     393ns  1.6030us  cuDeviceGetCount
  0.00%     611ns         2     305ns     232ns     379ns  cuDeviceGet
  0.00%     195ns         1     195ns     195ns     195ns  cudaCreateChannelDesc
