==16643== NVPROF is profiling process 16643, command: ./lbp.o
==16643== Profiling application: ./lbp.o
==16643== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.87%  58.013us         1  58.013us  58.013us  58.013us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 35.41%  55.709us         1  55.709us  55.709us  55.709us  [CUDA memcpy DtoH]
 27.72%  43.614us         5  8.7220us     704ns  40.190us  [CUDA memcpy HtoD]

==16643== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.39%  203.10ms         3  67.701ms  3.4330us  203.10ms  cudaMallocPitch
  0.74%  1.5294ms        90  16.993us     135ns  1.3315ms  cuDeviceGetAttribute
  0.25%  521.86us         2  260.93us  211.21us  310.65us  cudaGetDeviceProperties
  0.25%  517.74us         4  129.44us  3.7920us  501.52us  cudaMalloc
  0.11%  234.01us         2  117.01us  34.910us  199.10us  cudaMemcpy2D
  0.11%  233.32us         1  233.32us  233.32us  233.32us  cuDeviceGetName
  0.10%  203.14us         1  203.14us  203.14us  203.14us  cuDeviceTotalMem
  0.01%  26.026us         4  6.5060us  2.9470us  11.935us  cudaMemcpy
  0.01%  25.457us         1  25.457us  25.457us  25.457us  cudaCreateTextureObject
  0.01%  23.631us         1  23.631us  23.631us  23.631us  cudaLaunch
  0.00%  2.7560us         2  1.3780us     256ns  2.5000us  cuDeviceGetCount
  0.00%  1.2930us         1  1.2930us  1.2930us  1.2930us  cudaConfigureCall
  0.00%  1.2730us         4     318ns     146ns     630ns  cudaSetupArgument
  0.00%     741ns         2     370ns     204ns     537ns  cuDeviceGet
  0.00%     161ns         1     161ns     161ns     161ns  cudaCreateChannelDesc
