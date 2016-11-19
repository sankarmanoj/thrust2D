==7350== NVPROF is profiling process 7350, command: ./pyrup.o
==7350== Profiling application: ./pyrup.o
==7350== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.34%  21.024us         1  21.024us  21.024us  21.024us  [CUDA memcpy DtoH]
 34.73%  15.104us         1  15.104us  15.104us  15.104us  void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
 16.92%  7.3600us         1  7.3600us  7.3600us  7.3600us  [CUDA memcpy HtoD]

==7350== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.00%  546.50ms         2  273.25ms  5.2580us  546.49ms  cudaMallocPitch
  0.39%  2.1434ms         1  2.1434ms  2.1434ms  2.1434ms  cuDeviceGetName
  0.34%  1.9025ms        90  21.138us     105ns  1.1596ms  cuDeviceGetAttribute
  0.07%  384.50us         1  384.50us  384.50us  384.50us  cudaMalloc
  0.05%  289.22us         1  289.22us  289.22us  289.22us  cuDeviceTotalMem
  0.05%  259.28us         1  259.28us  259.28us  259.28us  cudaGetDeviceProperties
  0.04%  240.95us         2  120.48us  15.191us  225.76us  cudaFree
  0.04%  197.09us         2  98.546us  19.288us  177.80us  cudaMemcpy2D
  0.02%  105.88us         1  105.88us  105.88us  105.88us  cudaDeviceSynchronize
  0.00%  19.499us         1  19.499us  19.499us  19.499us  cudaLaunch
  0.00%  1.8100us         2     905ns     325ns  1.4850us  cuDeviceGetCount
  0.00%  1.3480us         2     674ns     287ns  1.0610us  cudaGetDevice
  0.00%     620ns         1     620ns     620ns     620ns  cudaConfigureCall
  0.00%     488ns         4     122ns      78ns     200ns  cudaGetDeviceCount
  0.00%     458ns         2     229ns     136ns     322ns  cuDeviceGet
  0.00%     414ns         2     207ns     130ns     284ns  cudaSetupArgument
  0.00%     289ns         1     289ns     289ns     289ns  cudaGetLastError
