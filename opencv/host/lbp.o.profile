==14004== NVPROF is profiling process 14004, command: ./lbp.o
==14004== Profiling application: ./lbp.o
==14004== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  134.34us         1  134.34us  134.34us  134.34us  [CUDA memcpy HtoH]

==14004== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.53%  123.87ms         1  123.87ms  123.87ms  123.87ms  cudaMemcpy
  0.28%  349.48us        90  3.8830us     103ns  143.16us  cuDeviceGetAttribute
  0.16%  197.86us         1  197.86us  197.86us  197.86us  cuDeviceTotalMem
  0.03%  31.796us         1  31.796us  31.796us  31.796us  cuDeviceGetName
  0.00%  1.5540us         2     777ns     288ns  1.2660us  cuDeviceGetCount
  0.00%     327ns         2     163ns     151ns     176ns  cuDeviceGet
