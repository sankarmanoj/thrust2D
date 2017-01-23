==11792== NVPROF is profiling process 11792, command: ./pyrdown.o
==11792== Profiling application: ./pyrdown.o
==11792== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.37%  21.638us         1  21.638us  21.638us  21.638us  [CUDA memcpy HtoD]
 36.44%  15.653us         1  15.653us  15.653us  15.653us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
 13.19%  5.6660us         1  5.6660us  5.6660us  5.6660us  [CUDA memcpy DtoH]

==11792== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.81%  848.41ms         2  424.21ms  10.471us  848.40ms  cudaMallocPitch
  0.85%  7.2569ms        90  80.632us     103ns  4.1610ms  cuDeviceGetAttribute
  0.09%  737.74us         1  737.74us  737.74us  737.74us  cudaMalloc
  0.07%  578.62us         2  289.31us  52.359us  526.26us  cudaMemcpy2D
  0.06%  512.50us         1  512.50us  512.50us  512.50us  cuDeviceTotalMem
  0.04%  368.60us         1  368.60us  368.60us  368.60us  cudaDeviceSynchronize
  0.04%  328.14us         1  328.14us  328.14us  328.14us  cudaGetDeviceProperties
  0.03%  239.91us         1  239.91us  239.91us  239.91us  cuDeviceGetName
  0.02%  135.30us         2  67.650us  10.323us  124.98us  cudaFree
  0.00%  25.071us         1  25.071us  25.071us  25.071us  cudaLaunch
  0.00%  1.9890us         2     994ns     407ns  1.5820us  cudaGetDevice
  0.00%  1.6300us         2     815ns     291ns  1.3390us  cuDeviceGetCount
  0.00%  1.2760us         4     319ns     194ns     447ns  cudaSetupArgument
  0.00%  1.0820us         1  1.0820us  1.0820us  1.0820us  cudaConfigureCall
  0.00%     707ns         4     176ns     137ns     264ns  cudaGetDeviceCount
  0.00%     433ns         2     216ns     125ns     308ns  cuDeviceGet
  0.00%     430ns         1     430ns     430ns     430ns  cudaGetLastError
