==13694== NVPROF is profiling process 13694, command: ./pyrup.o
==13694== Profiling application: ./pyrup.o
==13694== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.81%  121.03us         1  121.03us  121.03us  121.03us  [CUDA memcpy DtoH]
 28.49%  59.649us         1  59.649us  59.649us  59.649us  void cv::cuda::device::imgproc::pyrUp<unsigned char>(cv::cuda::PtrStepSz<unsigned char>, unsigned char)
 13.70%  28.672us         1  28.672us  28.672us  28.672us  [CUDA memcpy HtoD]

==13694== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.80%  12.6493s         2  6.32466s  447.20us  12.6489s  cudaMallocPitch
  0.14%  17.531ms        90  194.78us      98ns  10.896ms  cuDeviceGetAttribute
  0.03%  3.2984ms         1  3.2984ms  3.2984ms  3.2984ms  cuDeviceTotalMem
  0.02%  2.1911ms         1  2.1911ms  2.1911ms  2.1911ms  cuDeviceGetName
  0.01%  890.84us         2  445.42us  249.12us  641.72us  cudaFree
  0.00%  584.06us         2  292.03us  93.264us  490.79us  cudaMemcpy2D
  0.00%  484.85us         1  484.85us  484.85us  484.85us  cudaMalloc
  0.00%  278.17us         1  278.17us  278.17us  278.17us  cudaGetDeviceProperties
  0.00%  59.883us         1  59.883us  59.883us  59.883us  cudaDeviceSynchronize
  0.00%  34.905us         1  34.905us  34.905us  34.905us  cudaLaunch
  0.00%  1.9430us         2     971ns     481ns  1.4620us  cudaGetDevice
  0.00%  1.8480us         1  1.8480us  1.8480us  1.8480us  cudaConfigureCall
  0.00%  1.7180us         2     859ns     285ns  1.4330us  cuDeviceGet
  0.00%  1.6520us         2     826ns     224ns  1.4280us  cuDeviceGetCount
  0.00%     974ns         4     243ns     162ns     343ns  cudaGetDeviceCount
  0.00%     973ns         2     486ns     250ns     723ns  cudaSetupArgument
  0.00%     547ns         1     547ns     547ns     547ns  cudaGetLastError
