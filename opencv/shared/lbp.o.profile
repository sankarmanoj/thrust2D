==3854== NVPROF is profiling process 3854, command: ./lbp.o
==3854== Profiling application: ./lbp.o
==3854== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.75%  49.803us         1  49.803us  49.803us  49.803us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 37.16%  44.329us         1  44.329us  44.329us  44.329us  [CUDA memcpy DtoH]
 21.09%  25.157us         5  5.0310us     544ns  22.661us  [CUDA memcpy HtoD]

==3854== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.01%  424.16ms         3  141.39ms  5.8010us  424.15ms  cudaMallocPitch
  0.46%  1.9550ms        90  21.721us     102ns  1.0158ms  cuDeviceGetAttribute
  0.23%  975.37us         2  487.69us  247.95us  727.43us  cudaGetDeviceProperties
  0.15%  639.08us         4  159.77us  5.8560us  618.08us  cudaMalloc
  0.06%  271.96us         2  135.98us  40.219us  231.74us  cudaMemcpy2D
  0.04%  174.29us         1  174.29us  174.29us  174.29us  cuDeviceTotalMem
  0.03%  124.82us         4  31.205us  9.5690us  65.818us  cudaMemcpy
  0.01%  36.161us         1  36.161us  36.161us  36.161us  cudaLaunch
  0.01%  31.588us         1  31.588us  31.588us  31.588us  cuDeviceGetName
  0.00%  14.012us         1  14.012us  14.012us  14.012us  cudaCreateTextureObject
  0.00%  2.2460us         2  1.1230us     646ns  1.6000us  cuDeviceGetCount
  0.00%  1.4270us         4     356ns     181ns     554ns  cudaSetupArgument
  0.00%  1.2400us         1  1.2400us  1.2400us  1.2400us  cudaConfigureCall
  0.00%     480ns         2     240ns     231ns     249ns  cuDeviceGet
  0.00%     300ns         1     300ns     300ns     300ns  cudaCreateChannelDesc
