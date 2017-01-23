==11796== NVPROF is profiling process 11796, command: ./affine.o
==11796== Profiling application: ./affine.o
==11796== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.87%  44.813us         3  14.937us  1.1850us  22.086us  [CUDA memcpy HtoD]
 43.74%  42.732us         2  21.366us  20.998us  21.734us  [CUDA memcpy DtoH]
 10.39%  10.147us         1  10.147us  10.147us  10.147us  void cv::cuda::device::imgproc::warp<cv::cuda::device::imgproc::AffineTransform, cv::cuda::device::LinearFilter<cv::cuda::device::BorderReader<cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::device::BrdConstant<float>>>, unsigned char>(cv::cuda::device::imgproc::tex_warp_uchar_reader, cv::cuda::PtrStepSz<float>)

==11796== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.04%  808.61ms         2  404.30ms  12.247us  808.60ms  cudaMallocPitch
  1.67%  13.797ms        90  153.30us     106ns  6.5263ms  cuDeviceGetAttribute
  0.06%  530.81us         4  132.70us  24.222us  252.81us  cudaMemcpy2D
  0.06%  506.63us         1  506.63us  506.63us  506.63us  cudaMalloc
  0.06%  504.44us         1  504.44us  504.44us  504.44us  cuDeviceTotalMem
  0.04%  341.75us         1  341.75us  341.75us  341.75us  cudaGetDeviceProperties
  0.02%  148.10us         1  148.10us  148.10us  148.10us  cuDeviceGetName
  0.02%  129.74us         2  64.870us  10.779us  118.96us  cudaFree
  0.01%  95.200us         1  95.200us  95.200us  95.200us  cudaDeviceSynchronize
  0.01%  51.591us         1  51.591us  51.591us  51.591us  cudaLaunch
  0.00%  13.842us         1  13.842us  13.842us  13.842us  cudaMemcpyToSymbol
  0.00%  5.3590us         1  5.3590us  5.3590us  5.3590us  cudaBindTexture2D
  0.00%  2.5480us         3     849ns     418ns  1.1820us  cudaGetDevice
  0.00%  2.0510us         2  1.0250us     449ns  1.6020us  cuDeviceGetCount
  0.00%     912ns         5     182ns     144ns     237ns  cudaGetDeviceCount
  0.00%     819ns         2     409ns     371ns     448ns  cudaSetupArgument
  0.00%     765ns         1     765ns     765ns     765ns  cudaConfigureCall
  0.00%     388ns         2     194ns     160ns     228ns  cuDeviceGet
  0.00%     363ns         1     363ns     363ns     363ns  cudaGetLastError
  0.00%     296ns         1     296ns     296ns     296ns  cudaCreateChannelDesc
