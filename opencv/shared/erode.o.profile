==16608== NVPROF is profiling process 16608, command: ./erode.o
==16608== Profiling application: ./erode.o
==16608== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 58.60%  404.55us         1  404.55us  404.55us  404.55us  [CUDA memcpy DtoH]
 34.95%  241.29us         6  40.215us     672ns  236.21us  [CUDA memcpy HtoD]
  3.16%  21.791us         1  21.791us  21.791us  21.791us  void thrust::transform_texture_kernel<float, erodeFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  1.69%  11.679us         1  11.679us  11.679us  11.679us  [CUDA memcpy DtoD]
  1.14%  7.9040us         2  3.9520us  3.7440us  4.1600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.45%  3.1360us         1  3.1360us  3.1360us  3.1360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16608== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.15%  823.37ms         8  102.92ms  41.401us  814.10ms  cudaMalloc
  2.60%  22.498ms         1  22.498ms  22.498ms  22.498ms  cudaMallocPitch
  1.13%  9.7640ms         1  9.7640ms  9.7640ms  9.7640ms  cudaGetDeviceProperties
  0.66%  5.7483ms         3  1.9161ms  75.706us  5.0511ms  cudaFree
  0.15%  1.3290ms         6  221.50us  40.205us  997.01us  cudaMemcpy
  0.10%  831.59us         1  831.59us  831.59us  831.59us  cuDeviceGetName
  0.06%  527.28us         1  527.28us  527.28us  527.28us  cudaMemcpyAsync
  0.05%  411.05us         4  102.76us  47.034us  161.07us  cudaLaunch
  0.03%  257.64us        91  2.8310us     137ns  86.517us  cuDeviceGetAttribute
  0.02%  193.79us         1  193.79us  193.79us  193.79us  cuDeviceTotalMem
  0.02%  131.86us         1  131.86us  131.86us  131.86us  cudaMemcpy2D
  0.01%  78.028us        12  6.5020us  2.0870us  19.233us  cudaFuncGetAttributes
  0.01%  53.970us         1  53.970us  53.970us  53.970us  cudaCreateTextureObject
  0.00%  27.111us         9  3.0120us     630ns  10.517us  cudaGetDevice
  0.00%  24.921us         3  8.3070us  6.1880us  9.8510us  cudaEventCreateWithFlags
  0.00%  21.212us         7  3.0300us     167ns  17.508us  cudaSetupArgument
  0.00%  15.051us         4  3.7620us  2.3510us  6.0820us  cudaConfigureCall
  0.00%  14.239us        11  1.2940us     285ns  4.9960us  cudaDeviceGetAttribute
  0.00%  14.209us         3  4.7360us  2.3510us  6.5120us  cudaEventRecord
  0.00%  10.719us         3  3.5730us  3.2970us  3.8720us  cudaEventDestroy
  0.00%  5.5870us         3  1.8620us     146ns  4.1800us  cuDeviceGetCount
  0.00%  1.7640us         3     588ns     491ns     669ns  cuDeviceGet
  0.00%     739ns         1     739ns     739ns     739ns  cudaCreateChannelDesc
