==13701== NVPROF is profiling process 13701, command: ./scharr_filter.o
==13701== Profiling application: ./scharr_filter.o
==13701== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.46%  60.673us         2  30.336us  28.448us  32.225us  [CUDA memcpy DtoH]
 23.54%  31.424us         5  6.2840us     544ns  29.120us  [CUDA memcpy HtoD]
 15.30%  20.416us         2  10.208us  10.080us  10.336us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 12.28%  16.384us         2  8.1920us  7.6800us  8.7040us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  3.43%  4.5760us         4  1.1440us     960ns  1.4720us  [CUDA memcpy DtoD]

==13701== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.93%  38.8504s         5  7.77008s  3.3120us  38.8501s  cudaMallocPitch
  0.06%  21.793ms        90  242.15us      98ns  10.945ms  cuDeviceGetAttribute
  0.00%  1.2708ms         9  141.21us  3.3420us  514.89us  cudaFree
  0.00%  1.0389ms         1  1.0389ms  1.0389ms  1.0389ms  cuDeviceGetName
  0.00%  788.12us         5  157.62us  6.3750us  423.68us  cudaMalloc
  0.00%  398.37us         1  398.37us  398.37us  398.37us  cuDeviceTotalMem
  0.00%  385.99us         7  55.141us  3.9720us  139.68us  cudaMemcpy2D
  0.00%  234.52us         1  234.52us  234.52us  234.52us  cudaGetDeviceProperties
  0.00%  80.624us         4  20.156us  8.4780us  49.724us  cudaMemcpyToSymbol
  0.00%  41.650us         4  10.412us  7.8480us  12.957us  cudaDeviceSynchronize
  0.00%  38.577us         4  9.6440us  7.4140us  13.729us  cudaLaunch
  0.00%  11.881us        16     742ns     106ns  9.4180us  cudaSetupArgument
  0.00%  3.2150us         5     643ns     223ns  1.1580us  cudaGetDevice
  0.00%  1.8230us         2     911ns     313ns  1.5100us  cuDeviceGetCount
  0.00%  1.6770us         4     419ns     201ns     861ns  cudaConfigureCall
  0.00%     998ns         4     249ns     178ns     403ns  cudaGetLastError
  0.00%     444ns         4     111ns      87ns     157ns  cudaGetDeviceCount
  0.00%     373ns         2     186ns     132ns     241ns  cuDeviceGet
