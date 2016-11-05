==7626== NVPROF is profiling process 7626, command: ./gaussian_blur.o
==7626== Profiling application: ./gaussian_blur.o
==7626== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.43%  23.701us         3  7.9000us  1.2170us  21.010us  [CUDA memcpy HtoD]
 26.91%  19.665us         1  19.665us  19.665us  19.665us  [CUDA memcpy DtoH]
 19.32%  14.124us         1  14.124us  14.124us  14.124us  void column_filter::linearColumnFilter<int=17, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 15.95%  11.658us         1  11.658us  11.658us  11.658us  void row_filter::linearRowFilter<int=17, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  5.39%  3.9400us         2  1.9700us  1.2170us  2.7230us  [CUDA memcpy DtoD]

==7626== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.48%  2.99815s         3  999.38ms  5.7840us  2.99813s  cudaMallocPitch
  0.33%  9.9781ms        90  110.87us     116ns  4.9492ms  cuDeviceGetAttribute
  0.09%  2.8425ms         1  2.8425ms  2.8425ms  2.8425ms  cuDeviceGetName
  0.02%  683.56us         3  227.85us  6.9410us  349.93us  cudaMalloc
  0.02%  644.33us         1  644.33us  644.33us  644.33us  cuDeviceTotalMem
  0.02%  481.05us         2  240.52us  208.82us  272.23us  cudaDeviceSynchronize
  0.01%  441.15us         4  110.29us  8.3330us  276.89us  cudaMemcpy2D
  0.01%  281.97us         1  281.97us  281.97us  281.97us  cudaGetDeviceProperties
  0.01%  228.58us         5  45.716us  7.6530us  113.21us  cudaFree
  0.00%  35.240us         2  17.620us  8.8780us  26.362us  cudaMemcpyToSymbol
  0.00%  17.862us         2  8.9310us  5.8710us  11.991us  cudaLaunch
  0.00%  2.6000us         2  1.3000us     444ns  2.1560us  cuDeviceGetCount
  0.00%  1.7400us         3     580ns     238ns  1.0630us  cudaGetDevice
  0.00%  1.3270us         8     165ns     119ns     380ns  cudaSetupArgument
  0.00%     865ns         2     432ns     252ns     613ns  cudaConfigureCall
  0.00%     634ns         2     317ns     151ns     483ns  cuDeviceGet
  0.00%     487ns         2     243ns     159ns     328ns  cudaGetLastError
  0.00%     470ns         4     117ns      89ns     165ns  cudaGetDeviceCount
