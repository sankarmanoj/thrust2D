==31101== NVPROF is profiling process 31101, command: ./gaussian_filter.o
==31101== Profiling application: ./gaussian_filter.o
==31101== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 31.41%  23.648us         3  7.8820us  1.2160us  21.216us  [CUDA memcpy HtoD]
 27.88%  20.992us         1  20.992us  20.992us  20.992us  [CUDA memcpy DtoH]
 16.15%  12.160us         1  12.160us  12.160us  12.160us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, int, unsigned __int64)
 15.34%  11.553us         1  11.553us  11.553us  11.553us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, int, unsigned __int64)
  9.22%  6.9440us         2  3.4720us  2.8800us  4.0640us  [CUDA memcpy DtoA]

==31101== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.01%  123.40ms         1  123.40ms  123.40ms  123.40ms  cudaMallocPitch
  0.41%  513.56us        90  5.7060us     263ns  193.29us  cuDeviceGetAttribute
  0.39%  492.33us         1  492.33us  492.33us  492.33us  cudaGetDeviceProperties
  0.35%  436.62us         1  436.62us  436.62us  436.62us  cuDeviceTotalMem
  0.31%  392.45us         2  196.23us  4.6090us  387.84us  cudaMalloc
  0.31%  385.42us         1  385.42us  385.42us  385.42us  cudaMallocArray
  0.11%  141.00us         2  70.497us  20.493us  120.50us  cudaMemcpy2D
  0.04%  47.277us         1  47.277us  47.277us  47.277us  cuDeviceGetName
  0.03%  43.435us         2  21.717us  8.7140us  34.721us  cudaMemcpy2DToArray
  0.01%  14.173us         2  7.0860us  5.0210us  9.1520us  cudaLaunch
  0.01%  11.582us         1  11.582us  11.582us  11.582us  cudaMemcpyToSymbol
  0.01%  10.879us         1  10.879us  10.879us  10.879us  cudaMemcpy
  0.01%  7.2700us         2  3.6350us  2.3360us  4.9340us  cudaCreateTextureObject
  0.00%  3.1330us         2  1.5660us     770ns  2.3630us  cuDeviceGetCount
  0.00%  1.6130us        10     161ns     116ns     328ns  cudaSetupArgument
  0.00%  1.2990us         2     649ns     218ns  1.0810us  cudaConfigureCall
  0.00%     949ns         2     474ns     423ns     526ns  cuDeviceGet
  0.00%     142ns         1     142ns     142ns     142ns  cudaCreateChannelDesc
