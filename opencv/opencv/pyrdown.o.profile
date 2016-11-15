==8519== NVPROF is profiling process 8519, command: ./pyrdown.o
==8519== Profiling application: ./pyrdown.o
==8519== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.14%  20.800us         1  20.800us  20.800us  20.800us  [CUDA memcpy HtoD]
 39.17%  18.048us         1  18.048us  18.048us  18.048us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
 15.69%  7.2320us         1  7.2320us  7.2320us  7.2320us  [CUDA memcpy DtoH]

==8519== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.98%  6.85243s         2  3.42621s  258.93us  6.85217s  cudaMallocPitch
  0.00%  288.11us         1  288.11us  288.11us  288.11us  cuDeviceTotalMem
  0.00%  278.69us         1  278.69us  278.69us  278.69us  cudaMalloc
  0.00%  274.73us        90  3.0520us     135ns  102.14us  cuDeviceGetAttribute
  0.00%  186.06us         1  186.06us  186.06us  186.06us  cudaGetDeviceProperties
  0.00%  174.17us         2  87.084us  62.095us  112.07us  cudaFree
  0.00%  151.72us         2  75.858us  55.158us  96.558us  cudaMemcpy2D
  0.00%  40.684us         1  40.684us  40.684us  40.684us  cudaLaunch
  0.00%  36.136us         1  36.136us  36.136us  36.136us  cuDeviceGetName
  0.00%  17.027us         1  17.027us  17.027us  17.027us  cudaDeviceSynchronize
  0.00%  4.8050us         2  2.4020us     486ns  4.3190us  cudaGetDevice
  0.00%  4.3320us         2  2.1660us     366ns  3.9660us  cuDeviceGetCount
  0.00%  1.8530us         1  1.8530us  1.8530us  1.8530us  cudaConfigureCall
  0.00%  1.7820us         4     445ns     233ns     873ns  cudaSetupArgument
  0.00%     833ns         4     208ns     160ns     263ns  cudaGetDeviceCount
  0.00%     652ns         2     326ns     253ns     399ns  cuDeviceGet
  0.00%     500ns         1     500ns     500ns     500ns  cudaGetLastError
