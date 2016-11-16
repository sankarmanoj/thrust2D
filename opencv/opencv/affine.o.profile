==10373== NVPROF is profiling process 10373, command: ./affine.o
==10373== Profiling application: ./affine.o
==10373== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.76%  43.680us         3  14.560us  1.1840us  21.760us  [CUDA memcpy HtoD]
 42.89%  40.062us         2  20.031us  19.679us  20.383us  [CUDA memcpy DtoH]
 10.35%  9.6640us         1  9.6640us  9.6640us  9.6640us  void cv::cuda::device::imgproc::warp<cv::cuda::device::imgproc::AffineTransform, cv::cuda::device::LinearFilter<cv::cuda::device::BorderReader<cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::device::BrdConstant<float>>>, unsigned char>(cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::PtrStepSz<float>)

==10373== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.42%  967.88ms         2  483.94ms  9.5580us  967.87ms  cudaMallocPitch
  1.14%  11.221ms        90  124.67us     103ns  4.3465ms  cuDeviceGetAttribute
  0.10%  974.59us         2  487.29us  26.007us  948.58us  cudaFree
  0.10%  940.87us         1  940.87us  940.87us  940.87us  cuDeviceTotalMem
  0.07%  686.82us         1  686.82us  686.82us  686.82us  cuDeviceGetName
  0.07%  647.04us         4  161.76us  24.029us  296.73us  cudaMemcpy2D
  0.04%  430.53us         1  430.53us  430.53us  430.53us  cudaMalloc
  0.03%  322.33us         1  322.33us  322.33us  322.33us  cudaGetDeviceProperties
  0.03%  260.40us         1  260.40us  260.40us  260.40us  cudaDeviceSynchronize
  0.01%  51.693us         1  51.693us  51.693us  51.693us  cudaLaunch
  0.00%  12.228us         1  12.228us  12.228us  12.228us  cudaMemcpyToSymbol
  0.00%  9.0000us         1  9.0000us  9.0000us  9.0000us  cudaBindTexture2D
  0.00%  2.5280us         3     842ns     383ns  1.2220us  cudaGetDevice
  0.00%  1.5920us         2     796ns     137ns  1.4550us  cuDeviceGetCount
  0.00%     855ns         5     171ns     131ns     244ns  cudaGetDeviceCount
  0.00%     801ns         2     400ns     355ns     446ns  cudaSetupArgument
  0.00%     791ns         1     791ns     791ns     791ns  cudaConfigureCall
  0.00%     431ns         1     431ns     431ns     431ns  cudaGetLastError
  0.00%     323ns         1     323ns     323ns     323ns  cudaCreateChannelDesc
  0.00%     314ns         2     157ns     103ns     211ns  cuDeviceGet
