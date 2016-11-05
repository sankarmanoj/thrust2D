==5484== NVPROF is profiling process 5484, command: ./dilate.o
==5484== Profiling application: ./dilate.o
==5484== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  89.301us         1  89.301us  89.301us  89.301us  [CUDA memcpy HtoH]

==5484== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.80%  283.47ms         1  283.47ms  283.47ms  283.47ms  cudaMemcpy
  0.12%  339.09us        90  3.7670us     100ns  131.98us  cuDeviceGetAttribute
  0.07%  199.82us         1  199.82us  199.82us  199.82us  cuDeviceTotalMem
  0.01%  38.827us         1  38.827us  38.827us  38.827us  cuDeviceGetName
  0.00%  1.6100us         2     805ns     234ns  1.3760us  cuDeviceGetCount
  0.00%     554ns         2     277ns     179ns     375ns  cuDeviceGet
