==13999== NVPROF is profiling process 13999, command: ./affine.o
==13999== Profiling application: ./affine.o
==13999== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  84.044us         1  84.044us  84.044us  84.044us  [CUDA memcpy HtoH]

==13999== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.21%  131.18ms         1  131.18ms  131.18ms  131.18ms  cudaMemcpy
  0.48%  633.74us        90  7.0410us     119ns  274.85us  cuDeviceGetAttribute
  0.19%  257.61us         1  257.61us  257.61us  257.61us  cuDeviceTotalMem
  0.12%  152.19us         1  152.19us  152.19us  152.19us  cuDeviceGetName
  0.00%  2.5150us         2  1.2570us     470ns  2.0450us  cuDeviceGetCount
  0.00%     504ns         2     252ns     195ns     309ns  cuDeviceGet
