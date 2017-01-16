==3893== NVPROF is profiling process 3893, command: ./pyrdown.o
==3893== Profiling application: ./pyrdown.o
==3893== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.51%  25.152us         5  5.0300us     832ns  20.704us  [CUDA memcpy HtoD]
 15.51%  10.688us         1  10.688us  10.688us  10.688us  void thrust::for_each_kernel<unsigned char, pyrdownTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrdownTransformFunctor)
 11.94%  8.2240us         1  8.2240us  8.2240us  8.2240us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 11.84%  8.1600us         1  8.1600us  8.1600us  8.1600us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  9.06%  6.2400us         2  3.1200us  2.9120us  3.3280us  [CUDA memcpy DtoA]
  8.22%  5.6640us         1  5.6640us  5.6640us  5.6640us  [CUDA memcpy DtoH]
  6.92%  4.7680us         1  4.7680us  4.7680us  4.7680us  [CUDA memset]

==3893== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.35%  204.11ms         2  102.05ms  5.1740us  204.10ms  cudaMallocPitch
  0.54%  1.1282ms        90  12.536us     106ns  563.58us  cuDeviceGetAttribute
  0.40%  828.18us         4  207.05us  5.0270us  811.09us  cudaMalloc
  0.27%  565.99us         1  565.99us  565.99us  565.99us  cudaMallocArray
  0.15%  304.51us         1  304.51us  304.51us  304.51us  cuDeviceTotalMem
  0.13%  271.29us         1  271.29us  271.29us  271.29us  cudaGetDeviceProperties
  0.04%  78.585us         1  78.585us  78.585us  78.585us  cuDeviceGetName
  0.03%  66.384us         2  33.192us  20.747us  45.637us  cudaMemcpy2D
  0.03%  57.873us         3  19.291us  6.6690us  30.276us  cudaMemcpy
  0.02%  43.282us         2  21.641us  8.7690us  34.513us  cudaMemcpy2DToArray
  0.01%  25.398us         3  8.4660us  5.6030us  10.337us  cudaLaunch
  0.01%  18.698us         1  18.698us  18.698us  18.698us  cudaMemset2D
  0.00%  8.4080us         1  8.4080us  8.4080us  8.4080us  cudaMemcpyToSymbol
  0.00%  7.4370us         2  3.7180us  2.4780us  4.9590us  cudaCreateTextureObject
  0.00%  5.6190us        11     510ns     121ns  3.8990us  cudaSetupArgument
  0.00%  3.4290us         2  1.7140us  1.6960us  1.7330us  cuDeviceGetCount
  0.00%  1.2530us         3     417ns     221ns     807ns  cudaConfigureCall
  0.00%     994ns         2     497ns     442ns     552ns  cuDeviceGet
  0.00%     195ns         1     195ns     195ns     195ns  cudaCreateChannelDesc
