==8107== NVPROF is profiling process 8107, command: ./pyrdown.o
==8107== Profiling application: ./pyrdown.o
==8107== Warning: Found 3 invalid records in the result.
==8107== Warning: This can happen if device ran out of memory or if a device kernel was stopped due to an assertion.
==8107== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 72.33%  58.664us         6  9.7770us  2.9650us  17.490us  [CUDA memcpy HtoD]
 27.67%  22.445us         2  11.222us  4.7170us  17.728us  [CUDA memset]

==8107== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 91.08%  395.69ms         1  395.69ms  395.69ms  395.69ms  cudaMemcpyToSymbol
  5.92%  25.700ms         3  8.5668ms  3.5420us  17.457ms  cudaMallocPitch
  1.38%  5.9957ms        90  66.618us     101ns  3.7376ms  cuDeviceGetAttribute
  0.81%  3.5355ms         2  1.7677ms  20.759us  3.5147ms  cudaMemcpy2D
  0.45%  1.9764ms         1  1.9764ms  1.9764ms  1.9764ms  cudaGetDeviceProperties
  0.20%  883.26us         5  176.65us  4.8720us  855.05us  cudaMalloc
  0.08%  352.85us         1  352.85us  352.85us  352.85us  cuDeviceTotalMem
  0.04%  153.31us         1  153.31us  153.31us  153.31us  cuDeviceGetName
  0.01%  56.383us         5  11.276us  4.2850us  19.192us  cudaMemcpy
  0.01%  28.539us         2  14.269us  5.8570us  22.682us  cudaMemset2D
  0.01%  25.820us         1  25.820us  25.820us  25.820us  cudaDeviceSynchronize
  0.01%  23.362us         2  11.681us  11.615us  11.747us  cudaLaunch
  0.00%  7.6060us         4  1.9010us  1.4430us  3.2590us  cudaFuncGetAttributes
  0.00%  4.9560us         5     991ns     122ns  4.2760us  cudaSetupArgument
  0.00%  2.8470us        11     258ns     207ns     573ns  cudaDeviceGetAttribute
  0.00%  2.3220us         1  2.3220us  2.3220us  2.3220us  cudaEventCreateWithFlags
  0.00%  1.7170us         3     572ns     207ns  1.2760us  cudaGetDevice
  0.00%  1.6920us         2     846ns     283ns  1.4090us  cuDeviceGetCount
  0.00%  1.2710us         1  1.2710us  1.2710us  1.2710us  cudaEventRecord
  0.00%  1.1560us         2     578ns     347ns     809ns  cudaConfigureCall
  0.00%  1.0020us         1  1.0020us  1.0020us  1.0020us  cudaEventDestroy
  0.00%     548ns         2     274ns     118ns     430ns  cuDeviceGet
