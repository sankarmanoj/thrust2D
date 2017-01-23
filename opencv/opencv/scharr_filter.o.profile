==11742== NVPROF is profiling process 11742, command: ./scharr_filter.o
==11742== Profiling application: ./scharr_filter.o
==11742== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.34%  41.772us         2  20.886us  20.742us  21.030us  [CUDA memcpy DtoH]
 23.42%  24.870us         5  4.9740us     544ns  21.734us  [CUDA memcpy HtoD]
 17.97%  19.078us         2  9.5390us  9.5070us  9.5710us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 15.13%  16.069us         2  8.0340us  7.5540us  8.5150us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.13%  4.3860us         4  1.0960us     864ns  1.5040us  [CUDA memcpy DtoD]

==11742== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.44%  2.41841s         5  483.68ms  3.4410us  2.41787s  cudaMallocPitch
  0.41%  9.9807ms        90  110.90us     105ns  3.1601ms  cuDeviceGetAttribute
  0.05%  1.1509ms         5  230.17us  5.5670us  666.03us  cudaMalloc
  0.02%  530.68us         1  530.68us  530.68us  530.68us  cuDeviceTotalMem
  0.02%  453.24us         1  453.24us  453.24us  453.24us  cuDeviceGetName
  0.02%  450.91us         1  450.91us  450.91us  450.91us  cudaGetDeviceProperties
  0.02%  372.94us         7  53.276us  6.0510us  133.17us  cudaMemcpy2D
  0.02%  364.87us         9  40.540us  5.6110us  122.62us  cudaFree
  0.01%  196.41us         4  49.102us  11.277us  84.069us  cudaDeviceSynchronize
  0.00%  43.889us         4  10.972us  6.0670us  19.627us  cudaMemcpyToSymbol
  0.00%  26.143us         4  6.5350us  4.9410us  9.3190us  cudaLaunch
  0.00%  2.5770us         2  1.2880us  1.1200us  1.4570us  cuDeviceGetCount
  0.00%  2.4710us         5     494ns     279ns     758ns  cudaGetDevice
  0.00%  2.4120us        16     150ns     115ns     285ns  cudaSetupArgument
  0.00%  1.4820us         4     370ns     182ns     820ns  cudaConfigureCall
  0.00%     748ns         4     187ns     152ns     244ns  cudaGetLastError
  0.00%     481ns         2     240ns     192ns     289ns  cuDeviceGet
  0.00%     450ns         4     112ns      82ns     164ns  cudaGetDeviceCount
