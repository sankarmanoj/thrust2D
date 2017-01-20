==6234== NVPROF is profiling process 6234, command: ./scharr_filter.o
==6234== Profiling application: ./scharr_filter.o
==6234== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.90%  78.467us         2  39.233us  39.233us  39.234us  [CUDA memcpy DtoH]
 21.17%  43.842us         2  21.921us  20.513us  23.329us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
 20.83%  43.138us         5  8.6270us     704ns  40.130us  [CUDA memcpy HtoD]
 16.45%  34.050us         2  17.025us  16.577us  17.473us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
  3.65%  7.5530us         4  1.8880us  1.2480us  3.6170us  [CUDA memcpy DtoD]

==6234== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  45.7589s         5  9.15178s  3.2430us  45.7586s  cudaMallocPitch
  0.00%  707.51us         5  141.50us  5.8340us  350.84us  cudaMalloc
  0.00%  321.69us         7  45.955us  3.6890us  116.98us  cudaMemcpy2D
  0.00%  247.25us         9  27.472us  3.4380us  86.791us  cudaFree
  0.00%  232.01us        90  2.5770us     100ns  102.48us  cuDeviceGetAttribute
  0.00%  194.51us         1  194.51us  194.51us  194.51us  cuDeviceTotalMem
  0.00%  172.88us         1  172.88us  172.88us  172.88us  cudaGetDeviceProperties
  0.00%  57.139us         4  14.284us  3.8040us  27.194us  cudaDeviceSynchronize
  0.00%  55.766us         4  13.941us  6.6010us  25.837us  cudaMemcpyToSymbol
  0.00%  32.912us         1  32.912us  32.912us  32.912us  cuDeviceGetName
  0.00%  27.880us         4  6.9700us  4.4610us  10.852us  cudaLaunch
  0.00%  2.8510us         5     570ns     262ns  1.0210us  cudaGetDevice
  0.00%  2.3620us        16     147ns     106ns     355ns  cudaSetupArgument
  0.00%  1.7730us         4     443ns     217ns     915ns  cudaConfigureCall
  0.00%  1.7720us         2     886ns     471ns  1.3010us  cuDeviceGetCount
  0.00%     927ns         4     231ns     174ns     321ns  cudaGetLastError
  0.00%     502ns         2     251ns     246ns     256ns  cuDeviceGet
  0.00%     476ns         4     119ns      77ns     170ns  cudaGetDeviceCount
