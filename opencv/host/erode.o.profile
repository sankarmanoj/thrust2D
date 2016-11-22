==22128== NVPROF is profiling process 22128, command: ./erode.o
==22128== Profiling application: ./erode.o
==22128== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  24.039us         1  24.039us  24.039us  24.039us  [CUDA memcpy HtoH]

==22128== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.46%  304.44ms         1  304.44ms  304.44ms  304.44ms  cudaMemcpy
  1.34%  4.1385ms        90  45.983us     106ns  2.9949ms  cuDeviceGetAttribute
  0.13%  391.92us         1  391.92us  391.92us  391.92us  cuDeviceGetName
  0.08%  236.63us         1  236.63us  236.63us  236.63us  cuDeviceTotalMem
  0.00%  2.3040us         2  1.1520us  1.0510us  1.2530us  cuDeviceGetCount
  0.00%     544ns         2     272ns     208ns     336ns  cuDeviceGet
