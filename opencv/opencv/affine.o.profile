==8641== NVPROF is profiling process 8641, command: ./affine.o
==8641== Profiling application: ./affine.o
==8641== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.88%  90.848us         2  45.424us  35.328us  55.520us  [CUDA memcpy DtoH]
 41.30%  72.320us         3  24.106us     704ns  35.840us  [CUDA memcpy HtoD]
  6.82%  11.936us         1  11.936us  11.936us  11.936us  void cv::cuda::device::imgproc::warp<cv::cuda::device::imgproc::AffineTransform, cv::cuda::device::LinearFilter<cv::cuda::device::BorderReader<cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::device::BrdConstant<float>>>, unsigned char>(cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::PtrStepSz<float>)

==8641== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.98%  6.72911s         2  3.36456s  9.2980us  6.72910s  cudaMallocPitch
  0.01%  429.44us         4  107.36us  47.296us  153.39us  cudaMemcpy2D
  0.00%  265.56us         1  265.56us  265.56us  265.56us  cudaMalloc
  0.00%  208.70us        90  2.3180us     159ns  77.535us  cuDeviceGetAttribute
  0.00%  187.16us         1  187.16us  187.16us  187.16us  cudaGetDeviceProperties
  0.00%  184.05us         1  184.05us  184.05us  184.05us  cuDeviceTotalMem
  0.00%  151.26us         2  75.627us  47.396us  103.86us  cudaFree
  0.00%  76.729us         1  76.729us  76.729us  76.729us  cudaLaunch
  0.00%  22.973us         1  22.973us  22.973us  22.973us  cuDeviceGetName
  0.00%  16.268us         3  5.4220us     482ns  9.8790us  cudaGetDevice
  0.00%  15.011us         1  15.011us  15.011us  15.011us  cudaMemcpyToSymbol
  0.00%  9.3800us         1  9.3800us  9.3800us  9.3800us  cudaDeviceSynchronize
  0.00%  6.0380us         1  6.0380us  6.0380us  6.0380us  cudaBindTexture2D
  0.00%  2.3580us         2  1.1790us     592ns  1.7660us  cuDeviceGetCount
  0.00%  2.2650us         5     453ns     137ns  1.4790us  cudaGetDeviceCount
  0.00%  1.8060us         1  1.8060us  1.8060us  1.8060us  cudaConfigureCall
  0.00%  1.0280us         2     514ns     456ns     572ns  cudaSetupArgument
  0.00%     609ns         2     304ns     258ns     351ns  cuDeviceGet
  0.00%     544ns         1     544ns     544ns     544ns  cudaGetLastError
  0.00%     223ns         1     223ns     223ns     223ns  cudaCreateChannelDesc
