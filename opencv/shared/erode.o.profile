==6331== NVPROF is profiling process 6331, command: ./erode.o
==6331== Profiling application: ./erode.o
==6331== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 31.00%  26.623us         6  4.4370us     608ns  21.759us  [CUDA memcpy HtoD]
 29.47%  25.310us         1  25.310us  25.310us  25.310us  void thrust::transform_texture_kernel<unsigned char, erodeFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
 24.44%  20.991us         1  20.991us  20.991us  20.991us  [CUDA memcpy DtoH]
 10.17%  8.7360us         3  2.9120us  2.2400us  4.2560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.92%  4.2240us         1  4.2240us  4.2240us  4.2240us  [CUDA memcpy DtoD]

==6331== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.62%  600.03ms         8  75.004ms  4.8920us  599.39ms  cudaMalloc
  0.87%  5.3769ms         2  2.6885ms  1.3562ms  4.0207ms  cudaGetDeviceProperties
  0.78%  4.8062ms        90  53.402us     104ns  2.5406ms  cuDeviceGetAttribute
  0.41%  2.5356ms         3  845.20us  8.7450us  2.4858ms  cudaFree
  0.15%  940.45us         1  940.45us  940.45us  940.45us  cudaMallocPitch
  0.05%  308.81us         1  308.81us  308.81us  308.81us  cuDeviceGetName
  0.05%  283.91us         1  283.91us  283.91us  283.91us  cuDeviceTotalMem
  0.03%  159.14us         6  26.523us  4.5350us  91.500us  cudaMemcpy
  0.01%  52.936us         4  13.234us  6.0170us  19.029us  cudaLaunch
  0.01%  49.257us         1  49.257us  49.257us  49.257us  cudaMemcpyAsync
  0.01%  45.894us         1  45.894us  45.894us  45.894us  cudaMemcpy2D
  0.00%  29.750us        12  2.4790us  1.4090us  11.148us  cudaFuncGetAttributes
  0.00%  9.7270us         1  9.7270us  9.7270us  9.7270us  cudaCreateTextureObject
  0.00%  4.8310us        11     439ns     293ns  1.1200us  cudaDeviceGetAttribute
  0.00%  4.2000us         9     466ns     211ns  1.5710us  cudaGetDevice
  0.00%  3.8800us         3  1.2930us     652ns  2.1350us  cudaEventCreateWithFlags
  0.00%  3.1080us         3  1.0360us     576ns  1.6960us  cudaEventRecord
  0.00%  3.0250us         4     756ns     240ns  1.2950us  cudaConfigureCall
  0.00%  2.7090us         3     903ns     486ns  1.4020us  cudaEventDestroy
  0.00%  2.1450us         2  1.0720us     368ns  1.7770us  cuDeviceGetCount
  0.00%  2.0880us         7     298ns     151ns     537ns  cudaSetupArgument
  0.00%     614ns         2     307ns     231ns     383ns  cuDeviceGet
  0.00%     187ns         1     187ns     187ns     187ns  cudaCreateChannelDesc
