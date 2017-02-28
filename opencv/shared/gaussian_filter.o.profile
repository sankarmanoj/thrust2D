==14025== NVPROF is profiling process 14025, command: ./gaussian_filter.o
==14025== Profiling application: ./gaussian_filter.o
==14025== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.19%  56.063us         1  56.063us  56.063us  56.063us  void thrust::transform_texture_kernel<unsigned char, thrust::convolutionFunctor<unsigned char, float>>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, unsigned char)
 25.90%  27.296us         5  5.4590us  1.2160us  22.432us  [CUDA memcpy HtoD]
 20.92%  22.048us         1  22.048us  22.048us  22.048us  [CUDA memcpy DtoH]

==14025== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.69%  126.75ms         2  63.375ms  6.3490us  126.74ms  cudaMallocPitch
  0.79%  1.0273ms         2  513.65us  435.59us  591.72us  cudaGetDeviceProperties
  0.53%  684.09us        90  7.6000us     269ns  265.63us  cuDeviceGetAttribute
  0.41%  526.54us         1  526.54us  526.54us  526.54us  cuDeviceTotalMem
  0.32%  415.47us         3  138.49us  4.2840us  405.45us  cudaMalloc
  0.14%  182.61us         2  91.306us  21.985us  160.63us  cudaMemcpy2D
  0.06%  74.075us         1  74.075us  74.075us  74.075us  cuDeviceGetName
  0.02%  30.727us         1  30.727us  30.727us  30.727us  cudaMemcpyToSymbol
  0.02%  24.899us         3  8.2990us  4.4860us  15.441us  cudaMemcpy
  0.02%  20.786us         1  20.786us  20.786us  20.786us  cudaLaunch
  0.01%  7.6520us         1  7.6520us  7.6520us  7.6520us  cudaCreateTextureObject
  0.00%  3.4200us         2  1.7100us     603ns  2.8170us  cuDeviceGetCount
  0.00%  2.1490us         4     537ns     126ns  1.5180us  cudaSetupArgument
  0.00%  1.1420us         2     571ns     376ns     766ns  cuDeviceGet
  0.00%     679ns         1     679ns     679ns     679ns  cudaConfigureCall
  0.00%     235ns         1     235ns     235ns     235ns  cudaGetSymbolAddress
  0.00%     191ns         1     191ns     191ns     191ns  cudaCreateChannelDesc
