==7611== NVPROF is profiling process 7611, command: ./pyrdown.o
==7611== Profiling application: ./pyrdown.o
==7611== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.56%  20.593us         1  20.593us  20.593us  20.593us  [CUDA memcpy HtoD]
 36.46%  15.789us         1  15.789us  15.789us  15.789us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
 15.98%  6.9180us         1  6.9180us  6.9180us  6.9180us  [CUDA memcpy DtoH]

==7611== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.64%  999.30ms         2  499.65ms  1.2942ms  998.01ms  cudaMallocPitch
  1.86%  19.394ms         1  19.394ms  19.394ms  19.394ms  cudaGetDeviceProperties
  1.30%  13.625ms        90  151.38us     103ns  6.4193ms  cuDeviceGetAttribute
  0.85%  8.9265ms         2  4.4633ms  575.20us  8.3513ms  cudaFree
  0.24%  2.5481ms         1  2.5481ms  2.5481ms  2.5481ms  cudaMalloc
  0.04%  453.62us         1  453.62us  453.62us  453.62us  cuDeviceTotalMem
  0.02%  205.86us         2  102.93us  54.779us  151.09us  cudaMemcpy2D
  0.02%  177.94us         1  177.94us  177.94us  177.94us  cuDeviceGetName
  0.01%  143.14us         1  143.14us  143.14us  143.14us  cudaDeviceSynchronize
  0.00%  27.522us         1  27.522us  27.522us  27.522us  cudaLaunch
  0.00%  3.2110us         2  1.6050us     262ns  2.9490us  cuDeviceGetCount
  0.00%  2.0750us         2  1.0370us     381ns  1.6940us  cudaGetDevice
  0.00%  1.2920us         4     323ns     203ns     460ns  cudaSetupArgument
  0.00%     930ns         1     930ns     930ns     930ns  cudaConfigureCall
  0.00%     896ns         4     224ns     121ns     491ns  cudaGetDeviceCount
  0.00%     634ns         2     317ns     141ns     493ns  cuDeviceGet
  0.00%     386ns         1     386ns     386ns     386ns  cudaGetLastError
