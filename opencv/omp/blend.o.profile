==10122== NVPROF is profiling process 10122, command: ./blend.o
==10122== Profiling application: ./blend.o
==10122== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  3.6480us         3  1.2160us  1.2160us  1.2160us  [CUDA memcpy HtoD]

==10122== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.00%  119.25ms         3  39.751ms  1.7490us  119.25ms  cudaMemcpy2D
  0.40%  482.72us        90  5.3630us     104ns  193.75us  cuDeviceGetAttribute
  0.39%  467.55us         3  155.85us  5.0990us  456.44us  cudaMalloc
  0.15%  186.61us         1  186.61us  186.61us  186.61us  cuDeviceTotalMem
  0.04%  43.125us         1  43.125us  43.125us  43.125us  cuDeviceGetName
  0.01%  17.775us         3  5.9250us  3.6810us  9.8610us  cudaMemcpy
  0.00%  1.4880us         2     744ns     169ns  1.3190us  cuDeviceGetCount
  0.00%     297ns         2     148ns     123ns     174ns  cuDeviceGet
