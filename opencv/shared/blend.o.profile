==7400== NVPROF is profiling process 7400, command: ./blend.o
==7400== Profiling application: ./blend.o
==7400== Warning: Found 1 invalid records in the result.
==7400== Warning: This can happen if device ran out of memory or if a device kernel was stopped due to an assertion.
==7400== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 72.76%  106.98us         5  21.395us     703ns  63.854us  [CUDA memcpy HtoD]
 27.24%  40.052us         1  40.052us  40.052us  40.052us  [CUDA memcpy DtoH]

==7400== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.45%  242.65ms         3  80.883ms  3.3480us  242.64ms  cudaMallocPitch
  0.16%  386.14us         2  193.07us  186.38us  199.76us  cudaGetDeviceProperties
  0.13%  326.06us         3  108.69us  3.5080us  318.79us  cudaMalloc
  0.09%  214.63us        90  2.3840us      94ns  84.004us  cuDeviceGetAttribute
  0.08%  193.68us         3  64.558us  30.015us  129.50us  cudaMemcpy2D
  0.07%  162.44us         1  162.44us  162.44us  162.44us  cuDeviceTotalMem
  0.01%  19.235us         1  19.235us  19.235us  19.235us  cuDeviceGetName
  0.01%  17.412us         3  5.8040us  2.9090us  11.117us  cudaMemcpy
  0.00%  8.5700us         1  8.5700us  8.5700us  8.5700us  cudaLaunch
  0.00%  1.1550us         5     231ns     115ns     439ns  cudaSetupArgument
  0.00%  1.0920us         1  1.0920us  1.0920us  1.0920us  cudaConfigureCall
  0.00%  1.0740us         2     537ns     134ns     940ns  cuDeviceGetCount
  0.00%     301ns         2     150ns     109ns     192ns  cuDeviceGet
