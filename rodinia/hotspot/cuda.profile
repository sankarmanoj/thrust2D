==9056== NVPROF is profiling process 9056, command: ./hotspot_cuda.out 1024 2 2 temp_1024 power_1024 result_cuda.out
==9056== Profiling application: ./hotspot_cuda.out 1024 2 2 temp_1024 power_1024 result_cuda.out
==9056== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.76%  847.03us         2  423.51us  417.88us  429.14us  [CUDA memcpy HtoD]
 29.22%  592.62us         1  592.62us  592.62us  592.62us  calculate_temp(int, float*, float*, float*, int, int, int, int, float, float, float, float, float, float)
 29.03%  588.75us         1  588.75us  588.75us  588.75us  [CUDA memcpy DtoH]

==9056== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.33%  124.18ms         3  41.392ms  352.25us  123.39ms  cudaMalloc
  2.08%  2.6554ms         3  885.14us  429.94us  1.7640ms  cudaMemcpy
  0.22%  275.71us         3  91.903us  66.963us  136.04us  cudaFree
  0.19%  239.40us        90  2.6590us     104ns  92.978us  cuDeviceGetAttribute
  0.14%  181.35us         1  181.35us  181.35us  181.35us  cuDeviceTotalMem
  0.02%  22.142us         1  22.142us  22.142us  22.142us  cudaLaunch
  0.02%  21.915us         1  21.915us  21.915us  21.915us  cuDeviceGetName
  0.00%  3.5960us        14     256ns     195ns     552ns  cudaSetupArgument
  0.00%  1.1980us         1  1.1980us  1.1980us  1.1980us  cudaConfigureCall
  0.00%  1.1710us         2     585ns     153ns  1.0180us  cuDeviceGetCount
  0.00%     353ns         2     176ns     111ns     242ns  cuDeviceGet
