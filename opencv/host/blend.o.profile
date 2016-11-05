==5480== NVPROF is profiling process 5480, command: ./blend.o
==5480== Profiling application: ./blend.o
==5480== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  128.87us         1  128.87us  128.87us  128.87us  [CUDA memcpy HtoH]

==5480== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.71%  132.47ms         1  132.47ms  132.47ms  132.47ms  cudaMemcpy
  7.11%  10.265ms        90  114.06us     109ns  4.4239ms  cuDeviceGetAttribute
  0.63%  915.20us         1  915.20us  915.20us  915.20us  cuDeviceTotalMem
  0.54%  785.88us         1  785.88us  785.88us  785.88us  cuDeviceGetName
  0.00%  1.4550us         2     727ns     212ns  1.2430us  cuDeviceGetCount
  0.00%     413ns         2     206ns     163ns     250ns  cuDeviceGet
