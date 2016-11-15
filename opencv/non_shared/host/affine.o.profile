==23425== NVPROF is profiling process 23425, command: ./affine.o
==23425== Profiling application: ./affine.o
==23425== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  282.03us         1  282.03us  282.03us  282.03us  [CUDA memcpy HtoH]

==23425== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.80%  281.09ms         1  281.09ms  281.09ms  281.09ms  cudaMemcpy
  0.12%  340.42us        90  3.7820us     195ns  196.83us  cuDeviceGetAttribute
  0.07%  185.10us         1  185.10us  185.10us  185.10us  cuDeviceTotalMem
  0.01%  30.041us         1  30.041us  30.041us  30.041us  cuDeviceGetName
  0.00%  3.0000us         2  1.5000us     406ns  2.5940us  cuDeviceGetCount
  0.00%     663ns         2     331ns     283ns     380ns  cuDeviceGet
