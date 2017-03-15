==13702== NVPROF is profiling process 13702, command: ./affine.o
==13702== Profiling application: ./affine.o
==13702== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.34%  79.809us         3  26.603us     672ns  42.720us  [CUDA memcpy HtoD]
 41.48%  65.760us         2  32.880us  30.496us  35.264us  [CUDA memcpy DtoH]
  8.18%  12.960us         1  12.960us  12.960us  12.960us  void cv::cuda::device::imgproc::warp<cv::cuda::device::imgproc::AffineTransform, cv::cuda::device::LinearFilter<cv::cuda::device::BorderReader<cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::device::BrdConstant<float>>>, unsigned char>(cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::PtrStepSz<float>)

==13702== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.68%  8.51235s         2  4.25618s  9.4000us  8.51234s  cudaMallocPitch
  0.29%  24.653ms        90  273.93us     106ns  13.354ms  cuDeviceGetAttribute
  0.01%  725.57us         2  362.79us  21.303us  704.27us  cudaFree
  0.01%  579.57us         1  579.57us  579.57us  579.57us  cuDeviceGetName
  0.01%  494.16us         1  494.16us  494.16us  494.16us  cudaMalloc
  0.01%  439.42us         4  109.86us  46.498us  145.30us  cudaMemcpy2D
  0.00%  408.95us         1  408.95us  408.95us  408.95us  cuDeviceTotalMem
  0.00%  270.28us         1  270.28us  270.28us  270.28us  cudaGetDeviceProperties
  0.00%  74.883us         1  74.883us  74.883us  74.883us  cudaLaunch
  0.00%  50.207us         1  50.207us  50.207us  50.207us  cudaMemcpyToSymbol
  0.00%  10.996us         1  10.996us  10.996us  10.996us  cudaDeviceSynchronize
  0.00%  8.1380us         1  8.1380us  8.1380us  8.1380us  cudaBindTexture2D
  0.00%  4.7280us         3  1.5760us     603ns  3.1340us  cudaGetDevice
  0.00%  2.4750us         2  1.2370us     618ns  1.8570us  cuDeviceGetCount
  0.00%  1.3090us         2     654ns     589ns     720ns  cudaSetupArgument
  0.00%  1.0710us         1  1.0710us  1.0710us  1.0710us  cudaConfigureCall
  0.00%     977ns         5     195ns     138ns     261ns  cudaGetDeviceCount
  0.00%     622ns         1     622ns     622ns     622ns  cudaGetLastError
  0.00%     573ns         2     286ns     201ns     372ns  cuDeviceGet
  0.00%     398ns         1     398ns     398ns     398ns  cudaCreateChannelDesc
