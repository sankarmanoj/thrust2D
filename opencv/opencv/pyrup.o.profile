==11673== NVPROF is profiling process 11673, command: ./pyrup.o
==11673== Profiling application: ./pyrup.o
==11673== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.44%  82.424us         1  82.424us  82.424us  82.424us  [CUDA memcpy DtoH]
 31.76%  58.897us         1  58.897us  58.897us  58.897us  void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
 23.80%  44.141us         1  44.141us  44.141us  44.141us  [CUDA memcpy HtoD]

==11673== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.41%  596.43ms         2  298.21ms  3.9127ms  592.51ms  cudaMallocPitch
  1.37%  8.4527ms         1  8.4527ms  8.4527ms  8.4527ms  cudaGetDeviceProperties
  1.13%  7.0149ms         2  3.5074ms  3.3698ms  3.6450ms  cudaFree
  0.87%  5.4069ms         1  5.4069ms  5.4069ms  5.4069ms  cudaMalloc
  0.09%  551.05us         2  275.52us  57.299us  493.75us  cudaMemcpy2D
  0.06%  378.70us        90  4.2070us     123ns  143.20us  cuDeviceGetAttribute
  0.03%  211.91us         1  211.91us  211.91us  211.91us  cuDeviceTotalMem
  0.02%  100.05us         1  100.05us  100.05us  100.05us  cudaDeviceSynchronize
  0.01%  47.510us         1  47.510us  47.510us  47.510us  cuDeviceGetName
  0.00%  27.219us         1  27.219us  27.219us  27.219us  cudaLaunch
  0.00%  2.8120us         2  1.4060us     417ns  2.3950us  cuDeviceGetCount
  0.00%  1.7600us         2     880ns     307ns  1.4530us  cudaGetDevice
  0.00%  1.1360us         4     284ns     117ns     525ns  cudaGetDeviceCount
  0.00%  1.1200us         1  1.1200us  1.1200us  1.1200us  cudaConfigureCall
  0.00%     912ns         2     456ns     217ns     695ns  cuDeviceGet
  0.00%     784ns         2     392ns     168ns     616ns  cudaSetupArgument
  0.00%     510ns         1     510ns     510ns     510ns  cudaGetLastError
