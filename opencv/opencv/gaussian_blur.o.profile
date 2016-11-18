==10396== NVPROF is profiling process 10396, command: ./gaussian_blur.o
==10396== Profiling application: ./gaussian_blur.o
==10396== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.82%  23.072us         3  7.6900us     544ns  21.824us  [CUDA memcpy HtoD]
 28.40%  19.967us         1  19.967us  19.967us  19.967us  [CUDA memcpy DtoH]
 19.21%  13.504us         1  13.504us  13.504us  13.504us  void column_filter::linearColumnFilter<int=17, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 15.93%  11.200us         1  11.200us  11.200us  11.200us  void row_filter::linearRowFilter<int=17, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  3.64%  2.5600us         2  1.2800us  1.0240us  1.5360us  [CUDA memcpy DtoD]

==10396== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.13%  2.41460s         3  804.87ms  7.0210us  2.41459s  cudaMallocPitch
  0.66%  16.035ms        90  178.16us     103ns  6.6610ms  cuDeviceGetAttribute
  0.11%  2.5640ms         1  2.5640ms  2.5640ms  2.5640ms  cuDeviceTotalMem
  0.04%  992.05us         3  330.68us  7.0080us  556.53us  cudaMalloc
  0.02%  562.30us         1  562.30us  562.30us  562.30us  cudaGetDeviceProperties
  0.01%  306.41us         4  76.603us  10.095us  224.79us  cudaMemcpy2D
  0.01%  261.46us         2  130.73us  41.567us  219.90us  cudaDeviceSynchronize
  0.01%  205.98us         5  41.196us  8.2740us  106.74us  cudaFree
  0.01%  164.45us         1  164.45us  164.45us  164.45us  cuDeviceGetName
  0.00%  35.342us         2  17.671us  9.0710us  26.271us  cudaMemcpyToSymbol
  0.00%  16.964us         2  8.4820us  6.2640us  10.700us  cudaLaunch
  0.00%  1.5930us         2     796ns     277ns  1.3160us  cuDeviceGetCount
  0.00%  1.5230us         3     507ns     250ns     748ns  cudaGetDevice
  0.00%  1.2730us         8     159ns     115ns     286ns  cudaSetupArgument
  0.00%     873ns         2     436ns     256ns     617ns  cudaConfigureCall
  0.00%     500ns         2     250ns     163ns     337ns  cudaGetLastError
  0.00%     467ns         4     116ns      83ns     179ns  cudaGetDeviceCount
  0.00%     320ns         2     160ns     129ns     191ns  cuDeviceGet
