==13755== NVPROF is profiling process 13755, command: ./gaussian_blur.o
==13755== Profiling application: ./gaussian_blur.o
==13755== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.35%  331.33us         1  331.33us  331.33us  331.33us  [CUDA memcpy DtoH]
 35.34%  204.20us         3  68.065us     544ns  202.98us  [CUDA memcpy HtoD]
  3.90%  22.528us         1  22.528us  22.528us  22.528us  void column_filter::linearColumnFilter<int=5, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
  2.89%  16.704us         1  16.704us  16.704us  16.704us  void row_filter::linearRowFilter<int=5, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  0.52%  3.0080us         2  1.5040us  1.3440us  1.6640us  [CUDA memcpy DtoD]

==13755== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.93%  38.0341s         3  12.6780s  13.571us  38.0336s  cudaMallocPitch
  0.04%  16.688ms        90  185.42us      95ns  7.5746ms  cuDeviceGetAttribute
  0.01%  4.4949ms         5  898.99us  76.994us  2.4503ms  cudaFree
  0.00%  1.5321ms         3  510.69us  12.572us  1.0108ms  cudaMalloc
  0.00%  1.1393ms         4  284.82us  26.436us  714.57us  cudaMemcpy2D
  0.00%  826.40us         1  826.40us  826.40us  826.40us  cuDeviceGetName
  0.00%  566.45us         1  566.45us  566.45us  566.45us  cuDeviceTotalMem
  0.00%  331.65us         1  331.65us  331.65us  331.65us  cudaGetDeviceProperties
  0.00%  113.32us         2  56.659us  40.482us  72.836us  cudaMemcpyToSymbol
  0.00%  53.640us         2  26.820us  20.556us  33.084us  cudaDeviceSynchronize
  0.00%  43.132us         2  21.566us  18.617us  24.515us  cudaLaunch
  0.00%  3.7370us         3  1.2450us     418ns  1.8550us  cudaGetDevice
  0.00%  2.7530us         2  1.3760us  1.1190us  1.6340us  cudaConfigureCall
  0.00%  2.5720us         8     321ns     179ns     739ns  cudaSetupArgument
  0.00%  2.0710us         2  1.0350us     265ns  1.8060us  cuDeviceGetCount
  0.00%  1.0780us         2     539ns     451ns     627ns  cudaGetLastError
  0.00%     857ns         4     214ns     162ns     319ns  cudaGetDeviceCount
  0.00%     379ns         2     189ns     108ns     271ns  cuDeviceGet
