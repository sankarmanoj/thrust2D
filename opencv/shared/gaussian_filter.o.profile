==5721== NVPROF is profiling process 5721, command: ./gaussian_filter.o
==5721== Profiling application: ./gaussian_filter.o
==5721== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.75%  44.608us         1  44.608us  44.608us  44.608us  [CUDA memcpy DtoH]
 32.39%  30.912us         4  7.7280us     544ns  29.120us  [CUDA memcpy HtoD]
  9.49%  9.0560us         1  9.0560us  9.0560us  9.0560us  void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
  8.95%  8.5440us         1  8.5440us  8.5440us  8.5440us  void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
  2.41%  2.3040us         1  2.3040us  2.3040us  2.3040us  [CUDA memcpy DtoD]

==5721== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.01%  151.31ms         2  75.653ms  4.9860us  151.30ms  cudaMallocPitch
  0.24%  365.37us        90  4.0590us      94ns  141.39us  cuDeviceGetAttribute
  0.24%  363.76us         4  90.940us  3.1640us  351.83us  cudaMalloc
  0.20%  309.59us         1  309.59us  309.59us  309.59us  cudaGetDeviceProperties
  0.13%  203.79us         3  67.929us  11.552us  145.04us  cudaMemcpy2D
  0.11%  163.13us         1  163.13us  163.13us  163.13us  cuDeviceTotalMem
  0.02%  29.707us         1  29.707us  29.707us  29.707us  cuDeviceGetName
  0.02%  27.601us         1  27.601us  27.601us  27.601us  cudaMemcpyToSymbol
  0.01%  22.605us         2  11.302us  7.0430us  15.562us  cudaLaunch
  0.01%  17.706us         2  8.8530us  4.0630us  13.643us  cudaMemcpy
  0.00%  2.3100us        14     165ns     106ns     579ns  cudaSetupArgument
  0.00%  1.2440us         2     622ns     245ns     999ns  cudaConfigureCall
  0.00%  1.2230us         2     611ns     165ns  1.0580us  cuDeviceGetCount
  0.00%     342ns         2     171ns     106ns     236ns  cuDeviceGet
