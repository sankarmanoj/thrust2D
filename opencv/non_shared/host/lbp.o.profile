==23420== NVPROF is profiling process 23420, command: ./lbp.o
==23420== Profiling application: ./lbp.o
==23420== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  291.30us         1  291.30us  291.30us  291.30us  [CUDA memcpy HtoH]

==23420== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.38%  137.28ms         1  137.28ms  137.28ms  137.28ms  cudaMemcpy
  7.69%  11.558ms        90  128.42us     101ns  4.8728ms  cuDeviceGetAttribute
  0.78%  1.1783ms         1  1.1783ms  1.1783ms  1.1783ms  cuDeviceTotalMem
  0.14%  213.35us         1  213.35us  213.35us  213.35us  cuDeviceGetName
  0.00%  3.4680us         2  1.7340us  1.6370us  1.8310us  cuDeviceGetCount
  0.00%     859ns         2     429ns     380ns     479ns  cuDeviceGet
