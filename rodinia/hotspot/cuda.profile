==30529== NVPROF is profiling process 30529, command: ./hotspot_cuda.out 1024 2 2 temp_1024 power_1024 result_cuda.out
==30529== Profiling application: ./hotspot_cuda.out 1024 2 2 temp_1024 power_1024 result_cuda.out
==30529== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.26%  839.09us         2  419.55us  419.27us  419.82us  [CUDA memcpy HtoD]
 32.94%  703.95us         1  703.95us  703.95us  703.95us  [CUDA memcpy DtoH]
 27.80%  594.19us         1  594.19us  594.19us  594.19us  calculate_temp(int, float*, float*, float*, int, int, int, int, float, float, float, float, float, float)

==30529== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.55%  115.81ms         3  38.605ms  317.99us  115.17ms  cudaMalloc
  2.72%  3.2661ms         3  1.0887ms  418.66us  2.3974ms  cudaMemcpy
  0.25%  300.33us        90  3.3370us     123ns  117.30us  cuDeviceGetAttribute
  0.24%  285.62us         3  95.206us  69.075us  142.72us  cudaFree
  0.18%  213.07us         1  213.07us  213.07us  213.07us  cuDeviceTotalMem
  0.03%  31.579us         1  31.579us  31.579us  31.579us  cuDeviceGetName
  0.03%  31.201us         1  31.201us  31.201us  31.201us  cudaLaunch
  0.00%  2.0500us        14     146ns     108ns     312ns  cudaSetupArgument
  0.00%  1.9340us         2     967ns     467ns  1.4670us  cuDeviceGetCount
  0.00%     824ns         1     824ns     824ns     824ns  cudaConfigureCall
  0.00%     548ns         2     274ns     216ns     332ns  cuDeviceGet
