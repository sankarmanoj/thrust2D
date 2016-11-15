==23421== NVPROF is profiling process 23421, command: ./erode.o
==23421== Profiling application: ./erode.o
==23421== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  229.43us         1  229.43us  229.43us  229.43us  [CUDA memcpy HtoH]

==23421== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.63%  199.56ms         1  199.56ms  199.56ms  199.56ms  cudaMemcpy
  0.26%  512.07us        90  5.6890us     134ns  270.84us  cuDeviceGetAttribute
  0.09%  179.65us         1  179.65us  179.65us  179.65us  cuDeviceTotalMem
  0.02%  45.656us         1  45.656us  45.656us  45.656us  cuDeviceGetName
  0.00%  2.7790us         2  1.3890us     647ns  2.1320us  cuDeviceGetCount
  0.00%     741ns         2     370ns     217ns     524ns  cuDeviceGet
