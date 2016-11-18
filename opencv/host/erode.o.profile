==9201== NVPROF is profiling process 9201, command: ./erode.o
==9201== Profiling application: ./erode.o
==9201== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  83.489us         1  83.489us  83.489us  83.489us  [CUDA memcpy HtoH]

==9201== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.12%  134.95ms         1  134.95ms  134.95ms  134.95ms  cudaMemcpy
  0.43%  578.93us         1  578.93us  578.93us  578.93us  cuDeviceTotalMem
  0.41%  559.67us        90  6.2180us     348ns  213.54us  cuDeviceGetAttribute
  0.04%  51.865us         1  51.865us  51.865us  51.865us  cuDeviceGetName
  0.00%  3.6370us         2  1.8180us     565ns  3.0720us  cuDeviceGetCount
  0.00%  1.0300us         2     515ns     375ns     655ns  cuDeviceGet
