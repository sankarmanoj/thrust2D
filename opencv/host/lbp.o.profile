==9094== NVPROF is profiling process 9094, command: ./lbp.o
==9094== Profiling application: ./lbp.o
==9094== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  84.398us         1  84.398us  84.398us  84.398us  [CUDA memcpy HtoH]

==9094== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.59%  246.64ms         1  246.64ms  246.64ms  246.64ms  cudaMemcpy
  0.27%  659.72us        90  7.3300us     102ns  328.02us  cuDeviceGetAttribute
  0.09%  211.75us         1  211.75us  211.75us  211.75us  cuDeviceTotalMem
  0.06%  144.07us         1  144.07us  144.07us  144.07us  cuDeviceGetName
  0.00%  2.3310us         2  1.1650us     346ns  1.9850us  cuDeviceGetCount
  0.00%     550ns         2     275ns     208ns     342ns  cuDeviceGet
