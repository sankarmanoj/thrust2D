==9098== NVPROF is profiling process 9098, command: ./dilate.o
==9098== Profiling application: ./dilate.o
==9098== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  101.67us         1  101.67us  101.67us  101.67us  [CUDA memcpy HtoH]

==9098== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.80%  232.01ms         1  232.01ms  232.01ms  232.01ms  cudaMemcpy
  0.11%  244.95us        90  2.7210us     103ns  94.916us  cuDeviceGetAttribute
  0.08%  183.66us         1  183.66us  183.66us  183.66us  cuDeviceTotalMem
  0.01%  26.720us         1  26.720us  26.720us  26.720us  cuDeviceGetName
  0.00%  2.2310us         2  1.1150us     434ns  1.7970us  cuDeviceGetCount
  0.00%     590ns         2     295ns     287ns     303ns  cuDeviceGet
