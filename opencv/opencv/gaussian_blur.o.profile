==6275== NVPROF is profiling process 6275, command: ./gaussian_blur.o
==6275== Profiling application: ./gaussian_blur.o
==6275== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.58%  162.05us         1  162.05us  162.05us  162.05us  void column_filter::linearColumnFilter<int=31, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 27.02%  126.62us         1  126.62us  126.62us  126.62us  void row_filter::linearRowFilter<int=31, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
 19.23%  90.110us         3  30.036us     832ns  88.126us  [CUDA memcpy HtoD]
 17.22%  80.703us         1  80.703us  80.703us  80.703us  [CUDA memcpy DtoH]
  1.95%  9.1520us         2  4.5760us  3.9040us  5.2480us  [CUDA memcpy DtoD]

==6275== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.72%  820.41ms         3  273.47ms  5.9360us  820.27ms  cudaMallocPitch
  0.06%  505.72us         4  126.43us  7.2640us  384.40us  cudaMemcpy2D
  0.05%  409.48us        83  4.9330us     768ns  151.55us  cuDeviceGetAttribute
  0.04%  341.94us         3  113.98us  13.130us  165.45us  cudaMalloc
  0.04%  312.96us         5  62.591us  8.9390us  114.40us  cudaFree
  0.03%  283.69us         2  141.85us  121.10us  162.59us  cudaDeviceSynchronize
  0.03%  248.49us         1  248.49us  248.49us  248.49us  cudaGetDeviceProperties
  0.01%  52.380us         2  26.190us  16.343us  36.037us  cudaMemcpyToSymbol
  0.01%  45.745us         1  45.745us  45.745us  45.745us  cuDeviceTotalMem
  0.00%  40.298us         1  40.298us  40.298us  40.298us  cuDeviceGetName
  0.00%  36.387us         2  18.193us  12.152us  24.235us  cudaLaunch
  0.00%  6.7750us         8     846ns     768ns  1.1170us  cudaSetupArgument
  0.00%  5.1680us         3  1.7220us     978ns  2.9330us  cudaGetDevice
  0.00%  4.4000us         2  2.2000us     908ns  3.4920us  cuDeviceGetCount
  0.00%  2.7940us         4     698ns     698ns     699ns  cudaGetDeviceCount
  0.00%  2.4450us         2  1.2220us     908ns  1.5370us  cudaConfigureCall
  0.00%  1.8860us         2     943ns     838ns  1.0480us  cuDeviceGet
  0.00%  1.8160us         2     908ns     768ns  1.0480us  cudaGetLastError
