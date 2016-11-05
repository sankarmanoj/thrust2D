==5476== NVPROF is profiling process 5476, command: ./lbp.o
==5476== Profiling application: ./lbp.o
==5476== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  81.751us         1  81.751us  81.751us  81.751us  [CUDA memcpy HtoH]

==5476== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.70%  245.42ms         1  245.42ms  245.42ms  245.42ms  cudaMemcpy
  5.18%  13.434ms        90  149.27us     103ns  5.0203ms  cuDeviceGetAttribute
  0.09%  229.83us         1  229.83us  229.83us  229.83us  cuDeviceTotalMem
  0.03%  67.491us         1  67.491us  67.491us  67.491us  cuDeviceGetName
  0.00%  2.4220us         2  1.2110us     762ns  1.6600us  cuDeviceGetCount
  0.00%     486ns         2     243ns     221ns     265ns  cuDeviceGet
