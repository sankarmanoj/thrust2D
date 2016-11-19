==7343== NVPROF is profiling process 7343, command: ./scharr_filter.o
==7343== Profiling application: ./scharr_filter.o
==7343== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.36%  41.856us         2  20.928us  20.928us  20.928us  [CUDA memcpy DtoH]
 23.90%  26.080us         5  5.2160us  1.1840us  21.280us  [CUDA memcpy HtoD]
 17.48%  19.072us         2  9.5360us  9.4400us  9.6320us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 15.81%  17.248us         2  8.6240us  8.5440us  8.7040us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.46%  4.8640us         4  1.2160us  1.0240us  1.6000us  [CUDA memcpy DtoD]

==7343== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.39%  1.24015s         5  248.03ms  3.3020us  1.23979s  cudaMallocPitch
  0.39%  4.8794ms        90  54.215us     104ns  1.7709ms  cuDeviceGetAttribute
  0.06%  769.63us         5  153.93us  5.8840us  381.47us  cudaMalloc
  0.05%  573.43us         1  573.43us  573.43us  573.43us  cuDeviceTotalMem
  0.03%  359.90us         7  51.414us  5.5390us  113.14us  cudaMemcpy2D
  0.02%  300.91us         1  300.91us  300.91us  300.91us  cuDeviceGetName
  0.02%  281.59us         9  31.287us  3.7410us  104.27us  cudaFree
  0.02%  239.32us         1  239.32us  239.32us  239.32us  cudaGetDeviceProperties
  0.01%  138.76us         4  34.688us  2.6220us  70.411us  cudaDeviceSynchronize
  0.00%  48.507us         4  12.126us  6.1840us  22.917us  cudaMemcpyToSymbol
  0.00%  27.000us         4  6.7500us  4.4910us  10.089us  cudaLaunch
  0.00%  2.8910us         5     578ns     268ns  1.0250us  cudaGetDevice
  0.00%  2.4520us        16     153ns     115ns     281ns  cudaSetupArgument
  0.00%  2.0360us         2  1.0180us     246ns  1.7900us  cuDeviceGetCount
  0.00%  1.5540us         4     388ns     186ns     813ns  cudaConfigureCall
  0.00%     905ns         4     226ns     159ns     284ns  cudaGetLastError
  0.00%     461ns         4     115ns      76ns     164ns  cudaGetDeviceCount
  0.00%     425ns         2     212ns     134ns     291ns  cuDeviceGet
