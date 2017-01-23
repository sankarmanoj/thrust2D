==11704== NVPROF is profiling process 11704, command: ./gaussian_blur.o
==11704== Profiling application: ./gaussian_blur.o
==11704== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.19%  43.020us         3  14.340us     544ns  41.260us  [CUDA memcpy HtoD]
 32.94%  41.452us         1  41.452us  41.452us  41.452us  [CUDA memcpy DtoH]
 17.40%  21.894us         1  21.894us  21.894us  21.894us  void column_filter::linearColumnFilter<int=5, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 13.20%  16.613us         1  16.613us  16.613us  16.613us  void row_filter::linearRowFilter<int=5, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  2.26%  2.8480us         2  1.4240us  1.3440us  1.5040us  [CUDA memcpy DtoD]

==11704== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.23%  2.22863s         3  742.88ms  10.441us  2.22815s  cudaMallocPitch
  0.61%  13.624ms        90  151.37us     113ns  5.0232ms  cuDeviceGetAttribute
  0.06%  1.3626ms         3  454.19us  11.086us  812.85us  cudaMalloc
  0.03%  690.00us         1  690.00us  690.00us  690.00us  cuDeviceTotalMem
  0.02%  487.95us         4  121.99us  16.143us  288.12us  cudaMemcpy2D
  0.02%  461.88us         5  92.376us  8.1730us  184.28us  cudaFree
  0.01%  270.55us         1  270.55us  270.55us  270.55us  cudaGetDeviceProperties
  0.01%  230.53us         1  230.53us  230.53us  230.53us  cuDeviceGetName
  0.01%  129.52us         2  64.758us  34.950us  94.567us  cudaDeviceSynchronize
  0.00%  43.820us         2  21.910us  13.460us  30.360us  cudaMemcpyToSymbol
  0.00%  23.295us         2  11.647us  8.3080us  14.987us  cudaLaunch
  0.00%  2.9770us         3     992ns     425ns  1.3610us  cudaGetDevice
  0.00%  2.2470us         8     280ns     178ns     720ns  cudaSetupArgument
  0.00%  1.8300us         2     915ns     406ns  1.4240us  cuDeviceGetCount
  0.00%  1.7580us         2     879ns     365ns  1.3930us  cudaConfigureCall
  0.00%     760ns         4     190ns     117ns     262ns  cudaGetDeviceCount
  0.00%     689ns         2     344ns     282ns     407ns  cudaGetLastError
  0.00%     450ns         2     225ns     167ns     283ns  cuDeviceGet
