==10384== NVPROF is profiling process 10384, command: ./sobel_filter.o
==10384== Profiling application: ./sobel_filter.o
==10384== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.06%  44.192us         2  22.096us  19.680us  24.512us  [CUDA memcpy DtoH]
 23.47%  25.887us         5  5.1770us     704ns  21.343us  [CUDA memcpy HtoD]
 16.80%  18.528us         2  9.2640us  9.2480us  9.2800us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 14.88%  16.416us         2  8.2080us  7.5520us  8.8640us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.79%  5.2800us         4  1.3200us  1.1200us  1.5360us  [CUDA memcpy DtoD]

==10384== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.33%  2.40083s         5  480.17ms  4.5460us  2.40036s  cudaMallocPitch
  0.51%  12.330ms        90  137.01us     102ns  6.0936ms  cuDeviceGetAttribute
  0.04%  916.73us         1  916.73us  916.73us  916.73us  cuDeviceTotalMem
  0.03%  741.64us         5  148.33us  6.8940us  359.67us  cudaMalloc
  0.03%  613.03us         7  87.575us  9.0450us  200.32us  cudaMemcpy2D
  0.02%  421.16us         1  421.16us  421.16us  421.16us  cuDeviceGetName
  0.02%  391.57us         4  97.892us  45.266us  146.60us  cudaDeviceSynchronize
  0.01%  303.17us         9  33.685us  4.3160us  116.53us  cudaFree
  0.01%  253.40us         1  253.40us  253.40us  253.40us  cudaGetDeviceProperties
  0.00%  62.320us         4  15.580us  7.7650us  23.889us  cudaMemcpyToSymbol
  0.00%  32.112us         4  8.0280us  5.8320us  10.115us  cudaLaunch
  0.00%  2.8950us         5     579ns     245ns     933ns  cudaGetDevice
  0.00%  2.6410us        16     165ns     112ns     448ns  cudaSetupArgument
  0.00%  1.8270us         2     913ns     269ns  1.5580us  cuDeviceGetCount
  0.00%  1.5240us         4     381ns     212ns     601ns  cudaConfigureCall
  0.00%     898ns         4     224ns     140ns     286ns  cudaGetLastError
  0.00%     472ns         4     118ns      78ns     173ns  cudaGetDeviceCount
  0.00%     357ns         2     178ns     117ns     240ns  cuDeviceGet
