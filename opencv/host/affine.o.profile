==9127== NVPROF is profiling process 9127, command: ./affine.o
==9127== Profiling application: ./affine.o
==9127== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  103.45us         1  103.45us  103.45us  103.45us  [CUDA memcpy HtoH]

==9127== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.63%  326.95ms         1  326.95ms  326.95ms  326.95ms  cudaMemcpy
  0.20%  672.11us        90  7.4670us     112ns  273.43us  cuDeviceGetAttribute
  0.08%  266.59us         1  266.59us  266.59us  266.59us  cuDeviceGetName
  0.08%  258.15us         1  258.15us  258.15us  258.15us  cuDeviceTotalMem
  0.00%  1.8200us         2     910ns     385ns  1.4350us  cuDeviceGetCount
  0.00%     367ns         2     183ns     152ns     215ns  cuDeviceGet
