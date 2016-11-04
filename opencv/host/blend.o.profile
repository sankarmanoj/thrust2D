==14014== NVPROF is profiling process 14014, command: ./blend.o
==14014== Profiling application: ./blend.o
==14014== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  141.48us         1  141.48us  141.48us  141.48us  [CUDA memcpy HtoH]

==14014== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.49%  129.73ms         1  129.73ms  129.73ms  129.73ms  cudaMemcpy
  0.31%  402.78us        90  4.4750us     178ns  153.34us  cuDeviceGetAttribute
  0.17%  221.23us         1  221.23us  221.23us  221.23us  cuDeviceTotalMem
  0.03%  42.383us         1  42.383us  42.383us  42.383us  cuDeviceGetName
  0.00%  2.3580us         2  1.1790us     392ns  1.9660us  cuDeviceGetCount
  0.00%     527ns         2     263ns     229ns     298ns  cuDeviceGet
