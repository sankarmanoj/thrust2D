==23481== NVPROF is profiling process 23481, command: ./dilate.o
==23481== Profiling application: ./dilate.o
==23481== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  166.39us         1  166.39us  166.39us  166.39us  [CUDA memcpy HtoH]

==23481== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.72%  126.23ms         1  126.23ms  126.23ms  126.23ms  cudaMemcpy
  0.14%  172.51us         1  172.51us  172.51us  172.51us  cuDeviceTotalMem
  0.13%  168.65us        90  1.8730us      97ns  69.478us  cuDeviceGetAttribute
  0.01%  14.757us         1  14.757us  14.757us  14.757us  cuDeviceGetName
  0.00%  1.3360us         2     668ns     272ns  1.0640us  cuDeviceGetCount
  0.00%     367ns         2     183ns     159ns     208ns  cuDeviceGet
