==22114== NVPROF is profiling process 22114, command: ./lbp.o
==22114== Profiling application: ./lbp.o
==22114== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  24.065us         1  24.065us  24.065us  24.065us  [CUDA memcpy HtoH]

==22114== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.05%  292.39ms         1  292.39ms  292.39ms  292.39ms  cudaMemcpy
  0.79%  2.3232ms        90  25.812us     102ns  1.3019ms  cuDeviceGetAttribute
  0.15%  430.20us         1  430.20us  430.20us  430.20us  cuDeviceTotalMem
  0.01%  41.528us         1  41.528us  41.528us  41.528us  cuDeviceGetName
  0.00%  1.9450us         2     972ns     167ns  1.7780us  cuDeviceGetCount
  0.00%     445ns         2     222ns     167ns     278ns  cuDeviceGet
