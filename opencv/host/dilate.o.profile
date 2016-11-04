==14079== NVPROF is profiling process 14079, command: ./dilate.o
==14079== Profiling application: ./dilate.o
==14079== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  82.452us         1  82.452us  82.452us  82.452us  [CUDA memcpy HtoH]

==14079== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.61%  133.66ms         1  133.66ms  133.66ms  133.66ms  cudaMemcpy
  0.23%  302.14us        90  3.3570us     102ns  120.72us  cuDeviceGetAttribute
  0.15%  195.59us         1  195.59us  195.59us  195.59us  cuDeviceTotalMem
  0.02%  21.215us         1  21.215us  21.215us  21.215us  cuDeviceGetName
  0.00%  1.9210us         2     960ns     247ns  1.6740us  cuDeviceGetCount
  0.00%     308ns         2     154ns     119ns     189ns  cuDeviceGet
