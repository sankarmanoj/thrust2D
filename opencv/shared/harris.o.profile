==26456== NVPROF is profiling process 26456, command: ./harris.o
==26456== Profiling application: ./harris.o
==26456== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.67%  80.258us         1  80.258us  80.258us  80.258us  void thrust::transform_texture_kernel<unsigned char, HarrisIntensityFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HarrisIntensityFunctor)
 25.98%  44.672us        24  1.8610us     576ns  21.088us  [CUDA memcpy HtoD]
 21.60%  37.152us        19  1.9550us     320ns  20.736us  [CUDA memcpy DtoH]
  3.59%  6.1760us         2  3.0880us  2.2720us  3.9040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.30%  2.2400us         1  2.2400us  2.2400us  2.2400us  [CUDA memcpy DtoD]
  0.86%  1.4720us         1  1.4720us  1.4720us  1.4720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==26456== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.17%  383.79ms         8  47.974ms  4.2470us  382.60ms  cudaMalloc
  0.30%  1.1722ms         2  586.11us  502.21us  670.01us  cudaGetDeviceProperties
  0.14%  550.90us         1  550.90us  550.90us  550.90us  cudaMallocPitch
  0.10%  367.98us         3  122.66us  5.7900us  338.75us  cudaFree
  0.09%  342.81us        90  3.8090us     104ns  149.49us  cuDeviceGetAttribute
  0.07%  260.66us        37  7.0440us  1.9530us  17.864us  cudaMemcpyAsync
  0.05%  192.32us         1  192.32us  192.32us  192.32us  cuDeviceTotalMem
  0.04%  171.77us         6  28.627us  4.7310us  133.27us  cudaMemcpy
  0.01%  54.658us         4  13.664us  8.2640us  23.351us  cudaLaunch
  0.01%  32.978us         1  32.978us  32.978us  32.978us  cuDeviceGetName
  0.01%  22.755us         1  22.755us  22.755us  22.755us  cudaMemcpy2D
  0.01%  21.243us        12  1.7700us  1.4120us  3.7650us  cudaFuncGetAttributes
  0.00%  7.3470us         1  7.3470us  7.3470us  7.3470us  cudaCreateTextureObject
  0.00%  7.0120us         3  2.3370us  1.2950us  3.8370us  cudaEventCreateWithFlags
  0.00%  3.9830us         9     442ns     213ns  1.3930us  cudaGetDevice
  0.00%  3.2080us        11     291ns     209ns     823ns  cudaDeviceGetAttribute
  0.00%  2.8760us         3     958ns     716ns  1.2230us  cudaEventRecord
  0.00%  2.4720us         4     618ns     246ns     925ns  cudaConfigureCall
  0.00%  2.3690us         3     789ns     554ns  1.0080us  cudaEventDestroy
  0.00%  2.1690us         2  1.0840us     236ns  1.9330us  cuDeviceGetCount
  0.00%  1.7300us         7     247ns     120ns     379ns  cudaSetupArgument
  0.00%     409ns         2     204ns     158ns     251ns  cuDeviceGet
  0.00%     232ns         1     232ns     232ns     232ns  cudaCreateChannelDesc
