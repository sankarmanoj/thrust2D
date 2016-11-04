==14084== NVPROF is profiling process 14084, command: ./erode.o
==14084== Profiling application: ./erode.o
==14084== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  82.275us         1  82.275us  82.275us  82.275us  [CUDA memcpy HtoH]

==14084== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.64%  157.06ms         1  157.06ms  157.06ms  157.06ms  cudaMemcpy
  0.21%  334.23us        90  3.7130us     101ns  137.25us  cuDeviceGetAttribute
  0.12%  193.85us         1  193.85us  193.85us  193.85us  cuDeviceTotalMem
  0.02%  30.224us         1  30.224us  30.224us  30.224us  cuDeviceGetName
  0.00%  2.0000us         2  1.0000us     249ns  1.7510us  cuDeviceGetCount
  0.00%     331ns         2     165ns     106ns     225ns  cuDeviceGet
