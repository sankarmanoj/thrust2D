==11036== NVPROF is profiling process 11036, command: ./gaussian_filter.o
==11036== Profiling application: ./gaussian_filter.o
==11036== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.01%  25.095us         3  8.3650us  1.1520us  22.727us  [CUDA memcpy HtoD]
 30.09%  20.966us         1  20.966us  20.966us  20.966us  [CUDA memcpy DtoH]
 11.90%  8.2910us         1  8.2910us  8.2910us  8.2910us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 11.48%  8.0030us         1  8.0030us  8.0030us  8.0030us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.35%  5.1220us         1  5.1220us  5.1220us  5.1220us  [CUDA memcpy DtoA]
  3.17%  2.2090us         1  2.2090us  2.2090us  2.2090us  [CUDA memcpy DtoD]

==11036== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.50%  643.95ms         1  643.95ms  643.95ms  643.95ms  cudaMallocPitch
  5.59%  39.305ms         1  39.305ms  39.305ms  39.305ms  cuDeviceTotalMem
  1.63%  11.474ms        90  127.49us     116ns  8.7238ms  cuDeviceGetAttribute
  0.55%  3.8554ms         1  3.8554ms  3.8554ms  3.8554ms  cudaMallocArray
  0.41%  2.8827ms         1  2.8827ms  2.8827ms  2.8827ms  cudaGetDeviceProperties
  0.28%  1.9584ms         2  979.20us  12.008us  1.9464ms  cudaMalloc
  0.02%  133.30us         3  44.432us  8.0420us  68.152us  cudaMemcpy2D
  0.01%  56.454us         1  56.454us  56.454us  56.454us  cuDeviceGetName
  0.01%  42.593us         1  42.593us  42.593us  42.593us  cudaMemcpy2DToArray
  0.00%  24.981us         1  24.981us  24.981us  24.981us  cudaMemcpyToSymbol
  0.00%  23.005us         1  23.005us  23.005us  23.005us  cudaMemcpy
  0.00%  15.962us         2  7.9810us  5.3660us  10.596us  cudaLaunch
  0.00%  7.5950us         2  3.7970us  2.1380us  5.4570us  cudaCreateTextureObject
  0.00%  4.0320us         2  2.0160us     393ns  3.6390us  cuDeviceGetCount
  0.00%  1.6200us         1  1.6200us  1.6200us  1.6200us  cudaMemcpyToArray
  0.00%  1.4820us         8     185ns     118ns     388ns  cudaSetupArgument
  0.00%  1.2010us         2     600ns     214ns     987ns  cudaConfigureCall
  0.00%     505ns         2     252ns     193ns     312ns  cuDeviceGet
  0.00%     261ns         1     261ns     261ns     261ns  cudaCreateChannelDesc
