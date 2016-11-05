==7646== NVPROF is profiling process 7646, command: ./scharr_filter.o
==7646== Profiling application: ./scharr_filter.o
==7646== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.35%  39.008us         2  19.504us  19.408us  19.600us  [CUDA memcpy DtoH]
 24.23%  25.300us         5  5.0600us     832ns  20.689us  [CUDA memcpy HtoD]
 18.31%  19.119us         2  9.5590us  9.3190us  9.8000us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 15.30%  15.981us         2  7.9900us  7.3020us  8.6790us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.82%  5.0290us         4  1.2570us     993ns  1.5370us  [CUDA memcpy DtoD]

==7646== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.40%  3.07224s         5  614.45ms  5.6070us  3.07163s  cudaMallocPitch
  0.30%  9.4199ms        90  104.67us     102ns  6.5403ms  cuDeviceGetAttribute
  0.11%  3.2459ms         9  360.65us  4.0810us  2.3639ms  cudaFree
  0.06%  1.8772ms         1  1.8772ms  1.8772ms  1.8772ms  cuDeviceGetName
  0.03%  1.0698ms         7  152.83us  10.546us  454.27us  cudaMemcpy2D
  0.03%  907.92us         5  181.58us  8.9930us  433.21us  cudaMalloc
  0.03%  855.34us         4  213.83us  89.409us  477.90us  cudaDeviceSynchronize
  0.02%  596.82us         1  596.82us  596.82us  596.82us  cuDeviceTotalMem
  0.01%  325.24us         1  325.24us  325.24us  325.24us  cudaGetDeviceProperties
  0.00%  93.522us         4  23.380us  11.563us  28.154us  cudaMemcpyToSymbol
  0.00%  43.289us         4  10.822us  8.0950us  14.391us  cudaLaunch
  0.00%  4.4370us         5     887ns     391ns  1.4700us  cudaGetDevice
  0.00%  3.6810us        16     230ns     112ns     532ns  cudaSetupArgument
  0.00%  2.5240us         4     631ns     395ns     999ns  cudaConfigureCall
  0.00%  1.7680us         2     884ns     152ns  1.6160us  cuDeviceGetCount
  0.00%  1.4200us         4     355ns     249ns     519ns  cudaGetLastError
  0.00%     701ns         4     175ns     136ns     259ns  cudaGetDeviceCount
  0.00%     495ns         2     247ns     131ns     364ns  cuDeviceGet
