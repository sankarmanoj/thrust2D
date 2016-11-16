==9157== NVPROF is profiling process 9157, command: ./blend.o
==9157== Profiling application: ./blend.o
==9157== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  89.160us         1  89.160us  89.160us  89.160us  [CUDA memcpy HtoH]

==9157== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.56%  116.86ms         1  116.86ms  116.86ms  116.86ms  cudaMemcpy
  0.25%  294.69us        90  3.2740us     108ns  116.73us  cuDeviceGetAttribute
  0.16%  190.42us         1  190.42us  190.42us  190.42us  cuDeviceTotalMem
  0.02%  26.464us         1  26.464us  26.464us  26.464us  cuDeviceGetName
  0.00%  1.4910us         2     745ns     127ns  1.3640us  cuDeviceGetCount
  0.00%     378ns         2     189ns     101ns     277ns  cuDeviceGet
