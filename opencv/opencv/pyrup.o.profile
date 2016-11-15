==8660== NVPROF is profiling process 8660, command: ./pyrup.o
==8660== Profiling application: ./pyrup.o
==8660== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 62.89%  122.37us         1  122.37us  122.37us  122.37us  [CUDA memcpy DtoH]
 26.40%  51.360us         1  51.360us  51.360us  51.360us  void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
 10.71%  20.832us         1  20.832us  20.832us  20.832us  [CUDA memcpy HtoD]

==8660== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.96%  8.91443s         2  4.45722s  8.2010us  8.91442s  cudaMallocPitch
  0.02%  1.6839ms        90  18.710us     136ns  918.95us  cuDeviceGetAttribute
  0.01%  505.06us         2  252.53us  93.250us  411.81us  cudaMemcpy2D
  0.00%  237.34us         1  237.34us  237.34us  237.34us  cudaMalloc
  0.00%  230.54us         1  230.54us  230.54us  230.54us  cuDeviceTotalMem
  0.00%  188.10us         1  188.10us  188.10us  188.10us  cudaGetDeviceProperties
  0.00%  161.72us         2  80.858us  41.661us  120.06us  cudaFree
  0.00%  64.678us         1  64.678us  64.678us  64.678us  cuDeviceGetName
  0.00%  50.727us         1  50.727us  50.727us  50.727us  cudaDeviceSynchronize
  0.00%  29.893us         1  29.893us  29.893us  29.893us  cudaLaunch
  0.00%  2.5980us         2  1.2990us     530ns  2.0680us  cuDeviceGetCount
  0.00%  2.1220us         2  1.0610us     508ns  1.6140us  cudaGetDevice
  0.00%  1.2020us         1  1.2020us  1.2020us  1.2020us  cudaConfigureCall
  0.00%     879ns         4     219ns     160ns     324ns  cudaGetDeviceCount
  0.00%     837ns         2     418ns     233ns     604ns  cudaSetupArgument
  0.00%     749ns         2     374ns     215ns     534ns  cuDeviceGet
  0.00%     612ns         1     612ns     612ns     612ns  cudaGetLastError
