==22132== NVPROF is profiling process 22132, command: ./blend.o
==22132== Profiling application: ./blend.o
==22132== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  24.559us         1  24.559us  24.559us  24.559us  [CUDA memcpy HtoH]

==22132== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.78%  229.51ms         1  229.51ms  229.51ms  229.51ms  cudaMemcpy
  0.13%  295.67us        90  3.2850us     103ns  118.79us  cuDeviceGetAttribute
  0.08%  188.75us         1  188.75us  188.75us  188.75us  cuDeviceTotalMem
  0.01%  27.315us         1  27.315us  27.315us  27.315us  cuDeviceGetName
  0.00%  1.3290us         2     664ns     155ns  1.1740us  cuDeviceGetCount
  0.00%     351ns         2     175ns     132ns     219ns  cuDeviceGet
