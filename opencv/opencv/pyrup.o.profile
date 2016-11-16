==10294== NVPROF is profiling process 10294, command: ./pyrup.o
==10294== Profiling application: ./pyrup.o
==10294== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 52.27%  82.878us         1  82.878us  82.878us  82.878us  [CUDA memcpy DtoH]
 30.29%  48.031us         1  48.031us  48.031us  48.031us  void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
 17.44%  27.648us         1  27.648us  27.648us  27.648us  [CUDA memcpy HtoD]

==10294== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.04%  1.12465s         2  562.33ms  454.89us  1.12420s  cudaMallocPitch
  0.65%  7.3433ms        90  81.592us     151ns  3.3122ms  cuDeviceGetAttribute
  0.12%  1.3815ms         1  1.3815ms  1.3815ms  1.3815ms  cuDeviceTotalMem
  0.07%  796.74us         2  398.37us  52.710us  744.03us  cudaMemcpy2D
  0.05%  541.71us         1  541.71us  541.71us  541.71us  cudaMalloc
  0.03%  288.75us         1  288.75us  288.75us  288.75us  cudaGetDeviceProperties
  0.02%  246.80us         2  123.40us  93.922us  152.88us  cudaFree
  0.02%  186.97us         1  186.97us  186.97us  186.97us  cuDeviceGetName
  0.01%  81.380us         1  81.380us  81.380us  81.380us  cudaDeviceSynchronize
  0.00%  35.241us         1  35.241us  35.241us  35.241us  cudaLaunch
  0.00%  2.3860us         2  1.1930us     557ns  1.8290us  cudaGetDevice
  0.00%  1.9780us         2     989ns     289ns  1.6890us  cuDeviceGetCount
  0.00%  1.5350us         1  1.5350us  1.5350us  1.5350us  cudaConfigureCall
  0.00%     775ns         4     193ns     166ns     242ns  cudaGetDeviceCount
  0.00%     636ns         2     318ns     205ns     431ns  cudaSetupArgument
  0.00%     531ns         2     265ns     235ns     296ns  cuDeviceGet
  0.00%     452ns         1     452ns     452ns     452ns  cudaGetLastError
