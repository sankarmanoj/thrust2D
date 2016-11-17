==26733== NVPROF is profiling process 26733, command: ./pyrup.o
==26733== Profiling application: ./pyrup.o
==26733== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.54%  24.152us         1  24.152us  24.152us  24.152us  [CUDA memcpy DtoH]
 35.64%  16.701us         1  16.701us  16.701us  16.701us  void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
 12.82%  6.0060us         1  6.0060us  6.0060us  6.0060us  [CUDA memcpy HtoD]

==26733== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.50%  198.73ms         2  99.365ms  5.4310us  198.73ms  cudaMallocPitch
  0.10%  207.88us        90  2.3090us      95ns  103.34us  cuDeviceGetAttribute
  0.10%  200.17us         1  200.17us  200.17us  200.17us  cudaMalloc
  0.09%  172.59us         1  172.59us  172.59us  172.59us  cuDeviceTotalMem
  0.07%  141.12us         1  141.12us  141.12us  141.12us  cudaGetDeviceProperties
  0.06%  129.45us         2  64.723us  28.060us  101.39us  cudaMemcpy2D
  0.04%  77.336us         2  38.668us  13.363us  63.973us  cudaFree
  0.01%  22.993us         1  22.993us  22.993us  22.993us  cudaLaunch
  0.01%  19.313us         1  19.313us  19.313us  19.313us  cuDeviceGetName
  0.01%  17.672us         1  17.672us  17.672us  17.672us  cudaDeviceSynchronize
  0.00%  1.9460us         2     973ns     655ns  1.2910us  cuDeviceGetCount
  0.00%  1.4520us         2     726ns     291ns  1.1610us  cudaGetDevice
  0.00%  1.2360us         1  1.2360us  1.2360us  1.2360us  cudaConfigureCall
  0.00%     539ns         4     134ns      84ns     234ns  cudaGetDeviceCount
  0.00%     467ns         2     233ns     138ns     329ns  cudaSetupArgument
  0.00%     432ns         1     432ns     432ns     432ns  cudaGetLastError
  0.00%     405ns         2     202ns     184ns     221ns  cuDeviceGet
