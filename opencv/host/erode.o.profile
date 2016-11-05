==5457== NVPROF is profiling process 5457, command: ./erode.o
==5457== Profiling application: ./erode.o
==5457== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  87.801us         1  87.801us  87.801us  87.801us  [CUDA memcpy HtoH]

==5457== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.25%  152.84ms         1  152.84ms  152.84ms  152.84ms  cudaMemcpy
  0.58%  893.49us        90  9.9270us     141ns  564.66us  cuDeviceGetAttribute
  0.14%  222.92us         1  222.92us  222.92us  222.92us  cuDeviceTotalMem
  0.02%  37.814us         1  37.814us  37.814us  37.814us  cuDeviceGetName
  0.00%  2.1030us         2  1.0510us     638ns  1.4650us  cuDeviceGetCount
  0.00%     643ns         2     321ns     318ns     325ns  cuDeviceGet
