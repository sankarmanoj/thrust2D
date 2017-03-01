==29030== NVPROF is profiling process 29030, command: ./gaussian_filter.o
==29030== Profiling application: ./gaussian_filter.o
==29030== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 28.05%  25.824us         4  6.4560us  1.1840us  22.208us  [CUDA memcpy HtoD]
 24.58%  22.625us         1  22.625us  22.625us  22.625us  void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, float*)
 23.98%  22.080us         1  22.080us  22.080us  22.080us  [CUDA memcpy DtoH]
 20.85%  19.200us         1  19.200us  19.200us  19.200us  void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, float*)
  2.54%  2.3360us         1  2.3360us  2.3360us  2.3360us  [CUDA memcpy DtoD]

==29030== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.05%  144.19ms         2  72.094ms  4.3690us  144.18ms  cudaMallocPitch
  0.57%  843.75us        90  9.3750us     348ns  333.04us  cuDeviceGetAttribute
  0.49%  723.45us         1  723.45us  723.45us  723.45us  cudaGetDeviceProperties
  0.39%  571.10us         1  571.10us  571.10us  571.10us  cuDeviceTotalMem
  0.28%  418.62us         4  104.65us  2.9320us  405.94us  cudaMalloc
  0.11%  162.86us         3  54.285us  10.726us  133.90us  cudaMemcpy2D
  0.05%  73.595us         1  73.595us  73.595us  73.595us  cuDeviceGetName
  0.02%  30.527us         1  30.527us  30.527us  30.527us  cudaMemcpyToSymbol
  0.01%  20.522us         2  10.261us  6.9550us  13.567us  cudaLaunch
  0.01%  14.872us         2  7.4360us  4.2790us  10.593us  cudaMemcpy
  0.00%  3.4590us         2  1.7290us     559ns  2.9000us  cuDeviceGetCount
  0.00%  2.2760us        14     162ns     116ns     434ns  cudaSetupArgument
  0.00%  1.1050us         2     552ns     370ns     735ns  cuDeviceGet
  0.00%  1.1050us         2     552ns     238ns     867ns  cudaConfigureCall
  0.00%     197ns         1     197ns     197ns     197ns  cudaGetSymbolAddress
