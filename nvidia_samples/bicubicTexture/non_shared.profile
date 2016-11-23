==12086== NVPROF is profiling process 12086, command: ./bicubicTexture
==12086== Profiling application: ./bicubicTexture
==12086== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 20.22%  13.637ms       390  34.965us  29.952us  41.472us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<uchar4, thrust::device_malloc_allocator<uchar4>>, thrust::detail::wrapped_function<d_renderFastBicubic_functor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 14.15%  9.5379ms       282  33.822us  32.480us  40.288us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<uchar4, thrust::device_malloc_allocator<uchar4>>, thrust::detail::wrapped_function<d_renderBicubic_functor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 12.52%  8.4443ms       390  21.652us  17.728us  26.720us  d_renderFastBicubic(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
 10.59%  7.1397ms       282  25.318us  25.024us  25.568us  d_renderBicubic(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
  8.70%  5.8675ms         1  5.8675ms  5.8675ms  5.8675ms  [CUDA memcpy HtoA]
  8.19%  5.5223ms      1016  5.4350us  4.8320us  8.7040us  [CUDA memcpy DtoD]
  7.64%  5.1502ms       257  20.039us  18.976us  27.456us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<uchar4, thrust::device_malloc_allocator<uchar4>>, thrust::detail::wrapped_function<d_render_functor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  7.07%  4.7649ms      1016  4.6890us  3.9040us  11.680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<uchar4>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<uchar4>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.38%  2.9565ms        87  33.982us  32.321us  38.560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<uchar4, thrust::device_malloc_allocator<uchar4>>, thrust::detail::wrapped_function<d_renderCatrom_functor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.26%  2.1997ms        87  25.284us  24.992us  25.504us  d_renderCatRom(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
  2.38%  1.6055ms       257  6.2460us  5.9520us  6.4320us  d_render(uchar4*, unsigned int, unsigned int, float, float, float, float, float)
  0.89%  602.98us      1016     593ns     544ns  6.7520us  [CUDA memcpy HtoD]

==12086== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 30.81%  224.32ms      2032  110.39us  6.3720us  402.38us  cudaMalloc
 28.16%  205.05ms      1016  201.82us  97.829us  409.76us  cudaFree
 15.25%  111.03ms         1  111.03ms  111.03ms  111.03ms  cudaMallocArray
  8.83%  64.261ms      3048  21.083us  8.5720us  235.08us  cudaLaunch
  6.73%  49.007ms      2032  24.117us  8.0220us  261.07us  cudaMemcpy
  4.05%  29.499ms      1016  29.034us  7.1990us  16.651ms  cudaGraphicsMapResources
  2.20%  16.017ms      8128  1.9700us  1.3100us  234.70us  cudaFuncGetAttributes
  0.93%  6.7779ms      1016  6.6710us  5.2640us  22.495us  cudaGraphicsUnmapResources
  0.85%  6.1798ms         1  6.1798ms  6.1798ms  6.1798ms  cudaMemcpyToArray
  0.43%  3.1283ms      2032  1.5390us     864ns  14.153us  cudaEventCreateWithFlags
  0.38%  2.7418ms      6096     449ns     194ns  18.816us  cudaGetDevice
  0.33%  2.3956ms      2032  1.1780us     639ns  12.151us  cudaEventRecord
  0.22%  1.6288ms      2032     801ns     517ns  14.794us  cudaEventDestroy
  0.21%  1.5373ms     10160     151ns     100ns  14.192us  cudaSetupArgument
  0.18%  1.2942ms      3048     424ns     122ns  15.407us  cudaConfigureCall
  0.18%  1.2750ms      1016  1.2540us     778ns  12.066us  cudaGraphicsResourceGetMappedPointer
  0.09%  638.58us         2  319.29us  281.29us  357.29us  cudaGraphicsGLRegisterBuffer
  0.06%  431.14us         3  143.71us  139.77us  149.96us  cudaGetDeviceProperties
  0.04%  271.35us      1017     266ns     197ns  1.5020us  cudaGetLastError
  0.03%  190.62us        91  2.0940us     102ns  72.416us  cuDeviceGetAttribute
  0.02%  169.04us         1  169.04us  169.04us  169.04us  cuDeviceTotalMem
  0.02%  151.94us         2  75.969us  51.001us  100.94us  cudaGraphicsUnregisterResource
  0.01%  52.097us         1  52.097us  52.097us  52.097us  cudaFreeArray
  0.01%  46.082us         1  46.082us  46.082us  46.082us  cuDeviceGetName
  0.00%  7.7860us         2  3.8930us  1.3410us  6.4450us  cudaBindTextureToArray
  0.00%  5.0790us         1  5.0790us  5.0790us  5.0790us  cudaGLSetGLDevice
  0.00%  4.5740us         3  1.5240us     143ns  3.9910us  cuDeviceGetCount
  0.00%  4.2800us         2  2.1400us     305ns  3.9750us  cudaGetChannelDesc
  0.00%  3.5830us        11     325ns     202ns     942ns  cudaDeviceGetAttribute
  0.00%  1.3660us         2     683ns      84ns  1.2820us  cudaGetDeviceCount
  0.00%  1.3550us         1  1.3550us  1.3550us  1.3550us  cudaCreateChannelDesc
  0.00%  1.1190us         3     373ns     146ns     805ns  cuDeviceGet
