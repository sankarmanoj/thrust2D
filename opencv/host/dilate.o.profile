==22065== NVPROF is profiling process 22065, command: ./dilate.o
==22065== Profiling application: ./dilate.o
==22065== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  27.170us         1  27.170us  27.170us  27.170us  [CUDA memcpy HtoH]

==22065== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.69%  172.84ms         1  172.84ms  172.84ms  172.84ms  cudaMemcpy
  0.17%  295.99us        90  3.2880us     121ns  110.34us  cuDeviceGetAttribute
  0.12%  207.21us         1  207.21us  207.21us  207.21us  cuDeviceTotalMem
  0.02%  29.976us         1  29.976us  29.976us  29.976us  cuDeviceGetName
  0.00%  2.3540us         2  1.1770us     417ns  1.9370us  cuDeviceGetCount
  0.00%     462ns         2     231ns     186ns     276ns  cuDeviceGet
