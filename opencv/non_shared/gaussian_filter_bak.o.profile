==5913== NVPROF is profiling process 5913, command: ./gaussian_filter_bak.o
==5913== Profiling application: ./gaussian_filter_bak.o
==5913== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 70.31%  220.64us         1  220.64us  220.64us  220.64us  void thrust::transform_kernel<unsigned char, convolutionFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 16.45%  51.615us         8  6.4510us     800ns  44.991us  [CUDA memcpy HtoD]
 13.25%  41.568us         1  41.568us  41.568us  41.568us  [CUDA memcpy DtoH]

==5913== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.80%  855.34ms         1  855.34ms  855.34ms  855.34ms  cudaMemcpyToSymbol
  0.05%  446.35us         2  223.18us  42.743us  403.61us  cudaMemcpy2D
  0.05%  390.41us        83  4.7030us     768ns  147.99us  cuDeviceGetAttribute
  0.03%  258.62us         1  258.62us  258.62us  258.62us  cudaGetDeviceProperties
  0.02%  210.01us         6  35.001us  9.2190us  148.13us  cudaMalloc
  0.02%  194.79us         4  48.696us  3.2130us  174.88us  cudaMallocPitch
  0.01%  51.681us         6  8.6130us  6.0760us  15.714us  cudaMemcpy
  0.01%  43.720us         1  43.720us  43.720us  43.720us  cuDeviceTotalMem
  0.00%  40.508us         1  40.508us  40.508us  40.508us  cuDeviceGetName
  0.00%  35.479us         1  35.479us  35.479us  35.479us  cudaLaunch
  0.00%  5.0290us         2  2.5140us  1.7460us  3.2830us  cuDeviceGetCount
  0.00%  3.7710us         4     942ns     768ns  1.1880us  cudaSetupArgument
  0.00%  2.1640us         2  1.0820us     977ns  1.1870us  cuDeviceGet
  0.00%  1.6060us         1  1.6060us  1.6060us  1.6060us  cudaConfigureCall
