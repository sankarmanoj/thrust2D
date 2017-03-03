==16633== NVPROF is profiling process 16633, command: ./blend.o
==16633== Profiling application: ./blend.o
==16633== Profiling result:
No kernels were profiled.

==16633== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.69%  127.73ms         6  21.289ms  17.855ms  33.050ms  cudaMalloc
 30.62%  119.64ms         6  19.940ms  18.009ms  25.803ms  cudaMemcpy
 17.21%  67.230ms         3  22.410ms  21.418ms  23.503ms  cudaMallocPitch
 14.59%  56.995ms         3  18.998ms  18.381ms  19.649ms  cudaMemcpy2D
  4.70%  18.375ms         1  18.375ms  18.375ms  18.375ms  cudaLaunch
  0.10%  389.74us         2  194.87us  163.29us  226.45us  cudaGetDeviceProperties
  0.05%  192.81us        90  2.1420us     100ns  73.304us  cuDeviceGetAttribute
  0.04%  136.86us         1  136.86us  136.86us  136.86us  cuDeviceTotalMem
  0.01%  20.408us         1  20.408us  20.408us  20.408us  cuDeviceGetName
  0.00%  3.3040us         2  1.6520us     176ns  3.1280us  cuDeviceGetCount
  0.00%  2.1810us         5     436ns     136ns     860ns  cudaSetupArgument
  0.00%  1.3450us         1  1.3450us  1.3450us  1.3450us  cudaConfigureCall
  0.00%     310ns         2     155ns     109ns     201ns  cuDeviceGet
