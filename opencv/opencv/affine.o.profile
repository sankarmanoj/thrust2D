==7623== NVPROF is profiling process 7623, command: ./affine.o
==7623== Profiling application: ./affine.o
==7623== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.38%  43.333us         3  14.444us  1.2170us  21.490us  [CUDA memcpy HtoD]
 42.92%  40.098us         2  20.049us  19.664us  20.434us  [CUDA memcpy DtoH]
 10.70%  9.9930us         1  9.9930us  9.9930us  9.9930us  void cv::cuda::device::imgproc::warp<cv::cuda::device::imgproc::AffineTransform, cv::cuda::device::LinearFilter<cv::cuda::device::BorderReader<cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::device::BrdConstant<float>>>, unsigned char>(cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::PtrStepSz<float>)

==7623== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.00%  1.15675s         2  578.38ms  6.3950us  1.15675s  cudaMallocPitch
  0.59%  6.8854ms        90  76.504us     102ns  4.3546ms  cuDeviceGetAttribute
  0.20%  2.3740ms         1  2.3740ms  2.3740ms  2.3740ms  cuDeviceGetName
  0.07%  861.88us         1  861.88us  861.88us  861.88us  cuDeviceTotalMem
  0.05%  595.91us         4  148.98us  17.553us  299.97us  cudaMemcpy2D
  0.03%  364.98us         1  364.98us  364.98us  364.98us  cudaMalloc
  0.03%  314.15us         1  314.15us  314.15us  314.15us  cudaGetDeviceProperties
  0.01%  125.29us         2  62.644us  20.141us  105.15us  cudaFree
  0.01%  97.363us         1  97.363us  97.363us  97.363us  cudaDeviceSynchronize
  0.00%  54.681us         1  54.681us  54.681us  54.681us  cudaLaunch
  0.00%  16.799us         1  16.799us  16.799us  16.799us  cudaMemcpyToSymbol
  0.00%  4.5770us         1  4.5770us  4.5770us  4.5770us  cudaBindTexture2D
  0.00%  3.3270us         2  1.6630us  1.6030us  1.7240us  cuDeviceGetCount
  0.00%  2.2740us         3     758ns     258ns  1.0520us  cudaGetDevice
  0.00%     802ns         2     401ns     278ns     524ns  cudaSetupArgument
  0.00%     746ns         1     746ns     746ns     746ns  cudaConfigureCall
  0.00%     609ns         5     121ns      79ns     179ns  cudaGetDeviceCount
  0.00%     533ns         1     533ns     533ns     533ns  cudaGetLastError
  0.00%     525ns         2     262ns     261ns     264ns  cuDeviceGet
  0.00%     171ns         1     171ns     171ns     171ns  cudaCreateChannelDesc
