==836== NVPROF is profiling process 836, command: ./gaussian_filter.o
==836== Profiling application: ./gaussian_filter.o
==836== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.30%  23.649us         3  7.8830us  1.2160us  21.216us  [CUDA memcpy HtoD]
 28.63%  20.960us         1  20.960us  20.960us  20.960us  [CUDA memcpy DtoH]
 14.29%  10.464us         1  10.464us  10.464us  10.464us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, int, int, unsigned __int64)
 14.16%  10.368us         1  10.368us  10.368us  10.368us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, int, int, unsigned __int64)
 10.62%  7.7760us         2  3.8880us  2.9120us  4.8640us  [CUDA memcpy DtoA]

==836== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.73%  122.53ms         1  122.53ms  122.53ms  122.53ms  cudaMallocPitch
  0.30%  372.18us         1  372.18us  372.18us  372.18us  cudaMallocArray
  0.30%  370.69us         1  370.69us  370.69us  370.69us  cudaMalloc
  0.19%  236.61us        90  2.6290us      97ns  92.559us  cuDeviceGetAttribute
  0.17%  209.16us         1  209.16us  209.16us  209.16us  cudaGetDeviceProperties
  0.15%  187.94us         1  187.94us  187.94us  187.94us  cuDeviceTotalMem
  0.08%  94.809us         2  47.404us  18.078us  76.731us  cudaMemcpy2D
  0.03%  39.281us         2  19.640us  7.9080us  31.373us  cudaMemcpy2DToArray
  0.02%  22.194us         1  22.194us  22.194us  22.194us  cuDeviceGetName
  0.01%  13.107us         2  6.5530us  4.6480us  8.4590us  cudaLaunch
  0.01%  9.8410us         1  9.8410us  9.8410us  9.8410us  cudaMemcpy
  0.01%  7.3340us         1  7.3340us  7.3340us  7.3340us  cudaMemcpyToSymbol
  0.01%  7.2660us         2  3.6330us  2.3750us  4.8910us  cudaCreateTextureObject
  0.00%  1.8390us        12     153ns     111ns     357ns  cudaSetupArgument
  0.00%  1.2100us         2     605ns     214ns     996ns  cuDeviceGetCount
  0.00%     896ns         2     448ns     210ns     686ns  cudaConfigureCall
  0.00%     312ns         2     156ns     131ns     181ns  cuDeviceGet
  0.00%     122ns         1     122ns     122ns     122ns  cudaCreateChannelDesc
