==7686== NVPROF is profiling process 7686, command: ./sobel_filter.o
==7686== Profiling application: ./sobel_filter.o
==7686== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.14%  39.040us         2  19.520us  19.472us  19.568us  [CUDA memcpy DtoH]
 24.80%  26.069us         5  5.2130us     864ns  21.362us  [CUDA memcpy HtoD]
 18.25%  19.184us         2  9.5920us  9.4480us  9.7360us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 15.08%  15.853us         2  7.9260us  7.3660us  8.4870us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.72%  4.9640us         4  1.2410us     961ns  1.5370us  [CUDA memcpy DtoD]

==7686== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.38%  2.91745s         5  583.49ms  6.4610us  2.91684s  cudaMallocPitch
  0.33%  9.6554ms        90  107.28us     109ns  4.5940ms  cuDeviceGetAttribute
  0.14%  4.2004ms         1  4.2004ms  4.2004ms  4.2004ms  cudaGetDeviceProperties
  0.06%  1.6768ms         5  335.36us  8.1790us  1.0812ms  cudaMalloc
  0.05%  1.3286ms         1  1.3286ms  1.3286ms  1.3286ms  cuDeviceTotalMem
  0.01%  384.96us         7  54.994us  13.111us  140.19us  cudaMemcpy2D
  0.01%  294.28us         9  32.697us  4.2590us  109.32us  cudaFree
  0.01%  236.79us         1  236.79us  236.79us  236.79us  cuDeviceGetName
  0.01%  181.93us         4  45.482us  13.236us  91.630us  cudaDeviceSynchronize
  0.00%  73.239us         4  18.309us  7.8180us  28.223us  cudaMemcpyToSymbol
  0.00%  37.835us         4  9.4580us  5.9410us  13.372us  cudaLaunch
  0.00%  4.0230us         5     804ns     265ns  1.2650us  cudaGetDevice
  0.00%  3.1390us        16     196ns     115ns     583ns  cudaSetupArgument
  0.00%  2.3130us         4     578ns     239ns     893ns  cudaConfigureCall
  0.00%  2.0130us         2  1.0060us     488ns  1.5250us  cuDeviceGetCount
  0.00%  1.4770us         4     369ns     204ns     565ns  cudaGetLastError
  0.00%     503ns         2     251ns     224ns     279ns  cuDeviceGet
  0.00%     477ns         4     119ns      84ns     179ns  cudaGetDeviceCount
