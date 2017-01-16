==7650== NVPROF is profiling process 7650, command: ./gaussian_filter.o
==7650== Profiling application: ./gaussian_filter.o
==7650== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.19%  23.486us         3  7.8280us  1.1840us  21.086us  [CUDA memcpy HtoD]
 28.77%  20.990us         1  20.990us  20.990us  20.990us  [CUDA memcpy DtoH]
 14.25%  10.399us         1  10.399us  10.399us  10.399us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, int, int, unsigned __int64)
 14.04%  10.239us         1  10.239us  10.239us  10.239us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, int, int, unsigned __int64)
 10.74%  7.8380us         2  3.9190us  2.8790us  4.9590us  [CUDA memcpy DtoA]

==7650== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.70%  121.22ms         1  121.22ms  121.22ms  121.22ms  cudaMallocPitch
  0.30%  365.31us         1  365.31us  365.31us  365.31us  cudaMallocArray
  0.30%  364.19us         1  364.19us  364.19us  364.19us  cudaMalloc
  0.19%  236.22us        90  2.6240us      97ns  92.834us  cuDeviceGetAttribute
  0.17%  205.45us         1  205.45us  205.45us  205.45us  cudaGetDeviceProperties
  0.14%  167.81us         1  167.81us  167.81us  167.81us  cuDeviceTotalMem
  0.11%  135.02us         2  67.511us  17.787us  117.24us  cudaMemcpy2D
  0.03%  41.758us         2  20.879us  8.3060us  33.452us  cudaMemcpy2DToArray
  0.03%  35.362us         1  35.362us  35.362us  35.362us  cuDeviceGetName
  0.01%  14.866us         2  7.4330us  5.1180us  9.7480us  cudaLaunch
  0.01%  9.5560us         1  9.5560us  9.5560us  9.5560us  cudaMemcpy
  0.01%  7.6260us         1  7.6260us  7.6260us  7.6260us  cudaMemcpyToSymbol
  0.01%  6.9780us         2  3.4890us  2.3120us  4.6660us  cudaCreateTextureObject
  0.00%  1.7870us        12     148ns     112ns     321ns  cudaSetupArgument
  0.00%  1.3920us         2     696ns     245ns  1.1470us  cuDeviceGetCount
  0.00%     902ns         2     451ns     222ns     680ns  cudaConfigureCall
  0.00%     422ns         2     211ns     145ns     277ns  cuDeviceGet
  0.00%     196ns         1     196ns     196ns     196ns  cudaCreateChannelDesc
