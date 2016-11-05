==5550== NVPROF is profiling process 5550, command: ./affine.o
==5550== Profiling application: ./affine.o
==5550== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  82.434us         1  82.434us  82.434us  82.434us  [CUDA memcpy HtoH]

==5550== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.55%  196.93ms         1  196.93ms  196.93ms  196.93ms  cudaMemcpy
  0.23%  460.10us        90  5.1120us     222ns  179.93us  cuDeviceGetAttribute
  0.19%  378.90us         1  378.90us  378.90us  378.90us  cuDeviceTotalMem
  0.02%  41.806us         1  41.806us  41.806us  41.806us  cuDeviceGetName
  0.00%  2.0950us         2  1.0470us     393ns  1.7020us  cuDeviceGetCount
  0.00%     636ns         2     318ns     241ns     395ns  cuDeviceGet
