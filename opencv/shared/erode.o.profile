==29264== NVPROF is profiling process 29264, command: ./erode.o
==29264== Profiling application: ./erode.o
==29264== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.19%  47.808us         1  47.808us  47.808us  47.808us  [CUDA memcpy DtoH]
 33.67%  44.480us         6  7.4130us     736ns  40.128us  [CUDA memcpy HtoD]
 19.50%  25.761us         1  25.761us  25.761us  25.761us  void thrust::transform_texture_kernel<unsigned char, erodeFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  8.53%  11.264us         3  3.7540us  2.3680us  4.6080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.11%  2.7840us         1  2.7840us  2.7840us  2.7840us  [CUDA memcpy DtoD]

==29264== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.52%  481.36ms         8  60.170ms  7.8800us  477.56ms  cudaMalloc
  0.51%  2.4775ms         2  1.2388ms  206.76us  2.2708ms  cudaGetDeviceProperties
  0.35%  1.7273ms         1  1.7273ms  1.7273ms  1.7273ms  cudaMallocPitch
  0.35%  1.7083ms         3  569.42us  7.2540us  1.6545ms  cudaFree
  0.09%  442.77us         6  73.794us  6.7160us  180.59us  cudaMemcpy
  0.05%  257.33us        91  2.8270us     134ns  97.044us  cuDeviceGetAttribute
  0.04%  185.08us         1  185.08us  185.08us  185.08us  cuDeviceTotalMem
  0.03%  126.79us         4  31.696us  16.841us  46.832us  cudaLaunch
  0.01%  68.290us         1  68.290us  68.290us  68.290us  cuDeviceGetName
  0.01%  54.639us         1  54.639us  54.639us  54.639us  cudaMemcpy2D
  0.01%  45.965us        12  3.8300us  2.8780us  9.2800us  cudaFuncGetAttributes
  0.01%  44.867us         1  44.867us  44.867us  44.867us  cudaMemcpyAsync
  0.00%  17.395us         1  17.395us  17.395us  17.395us  cudaCreateTextureObject
  0.00%  8.7270us         9     969ns     406ns  3.5490us  cudaGetDevice
  0.00%  7.2810us         3  2.4270us  1.8490us  2.7180us  cudaEventCreateWithFlags
  0.00%  7.1310us        11     648ns     440ns  1.8040us  cudaDeviceGetAttribute
  0.00%  6.2840us         4  1.5710us     519ns  3.0630us  cudaConfigureCall
  0.00%  6.0980us         3  2.0320us  1.3920us  2.4120us  cudaEventRecord
  0.00%  5.4470us         3  1.8150us     218ns  4.8180us  cuDeviceGetCount
  0.00%  4.7760us         3  1.5920us  1.2590us  1.8870us  cudaEventDestroy
  0.00%  2.9850us         7     426ns     219ns     801ns  cudaSetupArgument
  0.00%  1.3960us         3     465ns     284ns     566ns  cuDeviceGet
  0.00%     333ns         1     333ns     333ns     333ns  cudaCreateChannelDesc
