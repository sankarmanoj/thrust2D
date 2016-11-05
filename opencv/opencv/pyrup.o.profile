==7607== NVPROF is profiling process 7607, command: ./pyrup.o
==7607== Profiling application: ./pyrup.o
==7607== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.31%  75.521us         1  75.521us  75.521us  75.521us  [CUDA memcpy DtoH]
 30.93%  43.814us         1  43.814us  43.814us  43.814us  void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
 15.76%  22.323us         1  22.323us  22.323us  22.323us  [CUDA memcpy HtoD]

==7607== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.09%  982.94ms         2  491.47ms  19.180us  982.92ms  cudaMallocPitch
  1.89%  19.289ms         1  19.289ms  19.289ms  19.289ms  cudaGetDeviceProperties
  1.22%  12.433ms        90  138.15us     122ns  5.5027ms  cuDeviceGetAttribute
  0.37%  3.7739ms         2  1.8870ms  26.137us  3.7478ms  cudaFree
  0.28%  2.8629ms         1  2.8629ms  2.8629ms  2.8629ms  cudaMalloc
  0.06%  617.97us         2  308.99us  45.768us  572.21us  cudaMemcpy2D
  0.05%  488.74us         1  488.74us  488.74us  488.74us  cuDeviceGetName
  0.04%  364.26us         1  364.26us  364.26us  364.26us  cuDeviceTotalMem
  0.02%  163.65us         1  163.65us  163.65us  163.65us  cudaDeviceSynchronize
  0.00%  29.486us         1  29.486us  29.486us  29.486us  cudaLaunch
  0.00%  2.4560us         2  1.2280us     607ns  1.8490us  cuDeviceGetCount
  0.00%  1.5350us         2     767ns     435ns  1.1000us  cudaGetDevice
  0.00%  1.2890us         1  1.2890us  1.2890us  1.2890us  cudaConfigureCall
  0.00%     981ns         2     490ns     224ns     757ns  cudaSetupArgument
  0.00%     887ns         4     221ns     130ns     397ns  cudaGetDeviceCount
  0.00%     593ns         2     296ns     263ns     330ns  cuDeviceGet
  0.00%     550ns         1     550ns     550ns     550ns  cudaGetLastError
