==28534== NVPROF is profiling process 28534, command: ./bicubicTexture
==28534== Profiling application: ./bicubicTexture
==28534== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 28.69%  1.0643ms        20  53.212us  46.599us  59.785us  void thrust::for_each_kernel<uchar4, d_render_functor>(thrust::window_iterator<uchar4, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, d_render_functor)
 15.02%  557.11us        10  55.710us  54.184us  56.808us  void thrust::for_each_kernel<uchar4, d_renderCatrom_functor>(thrust::window_iterator<uchar4, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, d_renderCatrom_functor)
 14.90%  552.53us        10  55.253us  53.416us  60.297us  void thrust::for_each_kernel<uchar4, d_renderBicubic_functor>(thrust::window_iterator<uchar4, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, d_renderBicubic_functor)
 13.56%  503.02us        10  50.301us  49.639us  51.399us  void thrust::for_each_kernel<uchar4, d_renderFastBicubic_functor>(thrust::window_iterator<uchar4, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, d_renderFastBicubic_functor)
  6.87%  254.82us        10  25.482us  25.316us  25.732us  d_renderBicubic(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
  6.87%  254.76us        10  25.475us  25.252us  25.668us  d_renderCatRom(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
  6.26%  232.10us        10  23.210us  23.044us  23.332us  d_renderFastBicubic(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
  3.52%  130.71us        20  6.5350us  6.0480us  9.0570us  d_render(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
  1.38%  51.077us        10  5.1070us  4.9290us  5.1850us  [CUDA memcpy DtoD]
  1.22%  45.094us        10  4.5090us  4.1930us  4.8640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<uchar4>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<uchar4>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.94%  34.947us        60     582ns     544ns     800ns  [CUDA memcpy HtoD]
  0.78%  28.772us         1  28.772us  28.772us  28.772us  [CUDA memcpy HtoA]

==28534== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.79%  135.15ms        70  1.9307ms  5.1410us  15.264ms  cudaMemcpy
 41.48%  108.24ms         1  108.24ms  108.24ms  108.24ms  cudaMallocArray
  3.02%  7.8800ms        53  148.68us  124.94us  470.20us  cudaGetDeviceProperties
  1.45%  3.7720ms        40  94.299us  46.608us  284.53us  cudaDeviceSynchronize
  0.79%  2.0657ms        70  29.510us  4.9720us  220.24us  cudaMalloc
  0.57%  1.4926ms       110  13.569us  8.2280us  37.241us  cudaLaunch
  0.27%  708.45us        10  70.844us  51.113us  90.218us  cudaFree
  0.20%  525.79us         2  262.89us  246.33us  279.46us  cudaGraphicsGLRegisterBuffer
  0.06%  155.06us         1  155.06us  155.06us  155.06us  cuDeviceTotalMem
  0.06%  153.65us        91  1.6880us      97ns  58.409us  cuDeviceGetAttribute
  0.05%  141.30us         2  70.649us  63.222us  78.076us  cudaGraphicsUnregisterResource
  0.04%  102.84us         1  102.84us  102.84us  102.84us  cudaFreeArray
  0.03%  86.848us        10  8.6840us  6.6740us  19.499us  cudaGraphicsUnmapResources
  0.03%  86.707us         1  86.707us  86.707us  86.707us  cudaMemcpyToArray
  0.03%  79.695us       560     142ns     101ns  9.7420us  cudaSetupArgument
  0.03%  78.426us        10  7.8420us  7.2420us  9.7140us  cudaGraphicsMapResources
  0.03%  65.805us        40  1.6450us  1.3310us  2.7720us  cudaFuncGetAttributes
  0.01%  29.494us       110     268ns     201ns     704ns  cudaConfigureCall
  0.01%  20.194us         1  20.194us  20.194us  20.194us  cuDeviceGetName
  0.01%  19.859us        10  1.9850us     853ns  10.787us  cudaEventRecord
  0.01%  15.242us         2  7.6210us  1.1180us  14.124us  cudaBindTextureToArray
  0.01%  13.584us        10  1.3580us  1.2570us  1.5220us  cudaEventCreateWithFlags
  0.01%  13.255us        30     441ns     197ns  1.0500us  cudaGetDevice
  0.00%  9.0020us        10     900ns     770ns     998ns  cudaGraphicsResourceGetMappedPointer
  0.00%  7.6180us        10     761ns     697ns     961ns  cudaEventDestroy
  0.00%  4.8070us         1  4.8070us  4.8070us  4.8070us  cudaGLSetGLDevice
  0.00%  3.9140us         2  1.9570us     149ns  3.7650us  cudaGetDeviceCount
  0.00%  3.7910us        11     344ns     248ns     760ns  cudaGetLastError
  0.00%  3.2050us        11     291ns     198ns     829ns  cudaDeviceGetAttribute
  0.00%  2.3110us         3     770ns     248ns  1.4690us  cuDeviceGetCount
  0.00%  1.8940us         2     947ns     253ns  1.6410us  cudaGetChannelDesc
  0.00%  1.1780us         3     392ns     259ns     587ns  cuDeviceGet
  0.00%     369ns         1     369ns     369ns     369ns  cudaCreateChannelDesc
