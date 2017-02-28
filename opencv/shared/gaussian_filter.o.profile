==2563== NVPROF is profiling process 2563, command: ./gaussian_filter.o
==2563== Profiling application: ./gaussian_filter.o
==2563== Warning: Found 1 invalid records in the result.
==2563== Warning: This can happen if device ran out of memory or if a device kernel was stopped due to an assertion.
==2563== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.07%  25.952us         4  6.4880us  1.2160us  22.304us  [CUDA memcpy HtoD]
 45.93%  22.048us         1  22.048us  22.048us  22.048us  [CUDA memcpy DtoH]

==2563== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.34%  219.41ms         2  109.70ms  4.2960us  219.40ms  cudaMallocPitch
  0.58%  1.2914ms         2  645.69us  430.66us  860.73us  cudaGetDeviceProperties
  0.46%  1.0203ms        90  11.336us     450ns  401.58us  cuDeviceGetAttribute
  0.34%  756.18us         1  756.18us  756.18us  756.18us  cuDeviceTotalMem
  0.18%  400.35us         2  200.17us  4.2810us  396.07us  cudaMalloc
  0.04%  90.020us         1  90.020us  90.020us  90.020us  cuDeviceGetName
  0.04%  80.687us         2  40.343us  18.904us  61.783us  cudaMemcpy2D
  0.01%  32.019us         1  32.019us  32.019us  32.019us  cudaMemcpyToSymbol
  0.01%  14.496us         2  7.2480us  4.0810us  10.415us  cudaMemcpy
  0.00%  7.8940us         1  7.8940us  7.8940us  7.8940us  cudaLaunch
  0.00%  4.6920us         2  2.3460us     948ns  3.7440us  cuDeviceGetCount
  0.00%  1.5580us         2     779ns     502ns  1.0560us  cuDeviceGet
  0.00%     993ns         1     993ns     993ns     993ns  cudaConfigureCall
  0.00%     965ns         4     241ns     123ns     365ns  cudaSetupArgument
