==16590== NVPROF is profiling process 16590, command: ./gaussian_filter.o
==16590== Profiling application: ./gaussian_filter.o
==16590== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 30.62%  42.558us         4  10.639us     736ns  40.190us  [CUDA memcpy HtoD]
 28.61%  39.774us         1  39.774us  39.774us  39.774us  [CUDA memcpy DtoH]
 20.07%  27.903us         1  27.903us  27.903us  27.903us  void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, float*)
 18.72%  26.015us         1  26.015us  26.015us  26.015us  void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, float*)
  1.98%  2.7520us         1  2.7520us  2.7520us  2.7520us  [CUDA memcpy DtoD]

==16590== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.99%  433.22ms         2  216.61ms  9.3330us  433.21ms  cudaMallocPitch
  2.56%  11.811ms         1  11.811ms  11.811ms  11.811ms  cudaGetDeviceProperties
  2.19%  10.078ms        90  111.98us     100ns  5.2906ms  cuDeviceGetAttribute
  0.58%  2.6915ms         4  672.87us  4.3070us  2.6754ms  cudaMalloc
  0.43%  1.9955ms         1  1.9955ms  1.9955ms  1.9955ms  cuDeviceGetName
  0.15%  711.67us         1  711.67us  711.67us  711.67us  cuDeviceTotalMem
  0.05%  213.63us         3  71.210us  13.659us  161.03us  cudaMemcpy2D
  0.02%  79.682us         2  39.841us  28.866us  50.816us  cudaMemcpy
  0.01%  44.022us         1  44.022us  44.022us  44.022us  cudaMemcpyToSymbol
  0.01%  40.411us         2  20.205us  7.8030us  32.608us  cudaLaunch
  0.00%  13.094us        14     935ns     181ns  9.5940us  cudaSetupArgument
  0.00%  7.0160us         2  3.5080us     654ns  6.3620us  cuDeviceGetCount
  0.00%  1.8130us         2     906ns     325ns  1.4880us  cudaConfigureCall
  0.00%  1.7360us         2     868ns     253ns  1.4830us  cuDeviceGet
  0.00%     343ns         1     343ns     343ns     343ns  cudaGetSymbolAddress
