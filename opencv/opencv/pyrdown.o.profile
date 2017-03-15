==13677== NVPROF is profiling process 13677, command: ./pyrdown.o
==13677== Profiling application: ./pyrdown.o
==13677== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.68%  32.801us         1  32.801us  32.801us  32.801us  [CUDA memcpy HtoD]
 32.69%  18.592us         1  18.592us  18.592us  18.592us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
  9.62%  5.4720us         1  5.4720us  5.4720us  5.4720us  [CUDA memcpy DtoH]

==13677== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.76%  9.21727s         2  4.60863s  8.3680us  9.21726s  cudaMallocPitch
  0.21%  19.522ms        90  216.92us      98ns  8.5670ms  cuDeviceGetAttribute
  0.01%  707.44us         2  353.72us  8.8350us  698.61us  cudaFree
  0.01%  593.74us         1  593.74us  593.74us  593.74us  cuDeviceGetName
  0.01%  521.27us         1  521.27us  521.27us  521.27us  cuDeviceTotalMem
  0.00%  459.48us         1  459.48us  459.48us  459.48us  cudaMalloc
  0.00%  277.85us         1  277.85us  277.85us  277.85us  cudaGetDeviceProperties
  0.00%  151.19us         2  75.594us  42.998us  108.19us  cudaMemcpy2D
  0.00%  41.629us         1  41.629us  41.629us  41.629us  cudaLaunch
  0.00%  17.430us         1  17.430us  17.430us  17.430us  cudaDeviceSynchronize
  0.00%  7.1580us         2  3.5790us     460ns  6.6980us  cudaGetDevice
  0.00%  2.6940us         2  1.3470us     852ns  1.8420us  cuDeviceGetCount
  0.00%  1.5620us         4     390ns     223ns     659ns  cudaSetupArgument
  0.00%  1.3190us         1  1.3190us  1.3190us  1.3190us  cudaConfigureCall
  0.00%     933ns         4     233ns     150ns     323ns  cudaGetDeviceCount
  0.00%     527ns         1     527ns     527ns     527ns  cudaGetLastError
  0.00%     525ns         2     262ns     208ns     317ns  cuDeviceGet
