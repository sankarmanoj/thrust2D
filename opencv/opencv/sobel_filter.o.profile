==11606== NVPROF is profiling process 11606, command: ./sobel_filter.o
==11606== Profiling application: ./sobel_filter.o
==11606== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.84%  42.732us         2  21.366us  21.254us  21.478us  [CUDA memcpy DtoH]
 23.35%  27.081us         5  5.4160us  1.2160us  22.054us  [CUDA memcpy HtoD]
 18.32%  21.254us         2  10.627us  10.563us  10.691us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 16.83%  19.526us         2  9.7630us  9.0910us  10.435us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.66%  5.4100us         4  1.3520us  1.1840us  1.8570us  [CUDA memcpy DtoD]

==11606== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.39%  1.38478s         5  276.96ms  4.3600us  1.38007s  cudaMallocPitch
  0.80%  11.292ms         1  11.292ms  11.292ms  11.292ms  cudaGetDeviceProperties
  0.44%  6.1912ms         5  1.2382ms  6.1630us  4.1092ms  cudaMalloc
  0.23%  3.2641ms         9  362.67us  4.4550us  1.5073ms  cudaFree
  0.04%  566.17us         4  141.54us  3.7450us  508.31us  cudaDeviceSynchronize
  0.03%  476.30us         7  68.042us  14.245us  168.04us  cudaMemcpy2D
  0.03%  435.27us        90  4.8360us     130ns  168.41us  cuDeviceGetAttribute
  0.02%  222.49us         1  222.49us  222.49us  222.49us  cuDeviceTotalMem
  0.01%  104.46us         4  26.114us  16.666us  34.586us  cudaMemcpyToSymbol
  0.00%  48.531us         1  48.531us  48.531us  48.531us  cuDeviceGetName
  0.00%  46.036us         4  11.509us  7.6410us  19.942us  cudaLaunch
  0.00%  5.1810us         5  1.0360us     259ns  2.3410us  cudaGetDevice
  0.00%  3.6500us        16     228ns     115ns     606ns  cudaSetupArgument
  0.00%  3.6270us         2  1.8130us     536ns  3.0910us  cuDeviceGetCount
  0.00%  2.6380us         4     659ns     394ns     956ns  cudaConfigureCall
  0.00%  2.1160us         4     529ns     234ns  1.2810us  cudaGetLastError
  0.00%     921ns         2     460ns     312ns     609ns  cuDeviceGet
  0.00%     609ns         4     152ns      81ns     299ns  cudaGetDeviceCount
