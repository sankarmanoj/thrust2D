==10847== NVPROF is profiling process 10847, command: ./lbp.o
==10847== Profiling application: ./lbp.o
==10847== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 55.29%  70.934us         1  70.934us  70.934us  70.934us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 25.17%  32.297us         5  6.4590us  1.2160us  27.432us  [CUDA memcpy HtoD]
 19.54%  25.063us         1  25.063us  25.063us  25.063us  [CUDA memcpy DtoH]

==10847== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.04%  385.92ms         3  128.64ms  4.7860us  385.90ms  cudaMallocPitch
  1.38%  5.4452ms         2  2.7226ms  261.45us  5.1837ms  cudaGetDeviceProperties
  0.30%  1.1904ms         4  297.60us  5.0130us  1.1468ms  cudaMalloc
  0.08%  311.43us        90  3.4600us     132ns  117.40us  cuDeviceGetAttribute
  0.07%  285.19us         2  142.59us  50.317us  234.87us  cudaMemcpy2D
  0.05%  206.89us         1  206.89us  206.89us  206.89us  cuDeviceTotalMem
  0.03%  115.91us         4  28.976us  5.9810us  59.086us  cudaMemcpy
  0.01%  55.522us         1  55.522us  55.522us  55.522us  cudaCreateTextureObject
  0.01%  51.092us         1  51.092us  51.092us  51.092us  cudaLaunch
  0.01%  32.846us         1  32.846us  32.846us  32.846us  cuDeviceGetName
  0.00%  2.1160us         2  1.0580us     529ns  1.5870us  cuDeviceGetCount
  0.00%  2.0290us         1  2.0290us  2.0290us  2.0290us  cudaConfigureCall
  0.00%  1.7260us         4     431ns     145ns     722ns  cudaSetupArgument
  0.00%     538ns         2     269ns     168ns     370ns  cuDeviceGet
  0.00%     189ns         1     189ns     189ns     189ns  cudaCreateChannelDesc
