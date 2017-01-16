==3991== NVPROF is profiling process 3991, command: ./pyrup.o
==3991== Profiling application: ./pyrup.o
==3991== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.02%  119.87us         1  119.87us  119.87us  119.87us  void thrust::for_each_kernel<unsigned char, pyrupTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrupTransformFunctor)
 23.90%  75.360us         1  75.360us  75.360us  75.360us  [CUDA memcpy DtoH]
  9.39%  29.600us         2  14.800us  14.592us  15.008us  [CUDA memcpy DtoA]
  8.55%  26.944us         6  4.4900us  1.2160us  20.864us  [CUDA memcpy HtoD]
  8.36%  26.368us         1  26.368us  26.368us  26.368us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.86%  24.769us         1  24.769us  24.769us  24.769us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  3.92%  12.352us         1  12.352us  12.352us  12.352us  [CUDA memset]

==3991== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.31%  183.32ms         3  61.106ms  3.7290us  183.31ms  cudaMallocPitch
  0.46%  857.68us        90  9.5290us     101ns  459.63us  cuDeviceGetAttribute
  0.37%  693.66us         5  138.73us  4.2900us  342.65us  cudaMalloc
  0.24%  452.23us         2  226.12us  24.568us  427.67us  cudaMemcpy2D
  0.19%  348.88us         1  348.88us  348.88us  348.88us  cudaMallocArray
  0.14%  265.39us         1  265.39us  265.39us  265.39us  cudaGetDeviceProperties
  0.12%  230.43us         1  230.43us  230.43us  230.43us  cuDeviceTotalMem
  0.07%  126.00us         1  126.00us  126.00us  126.00us  cudaDeviceSynchronize
  0.02%  42.892us         2  21.446us  8.1350us  34.757us  cudaMemcpy2DToArray
  0.02%  39.312us         1  39.312us  39.312us  39.312us  cuDeviceGetName
  0.02%  36.185us         4  9.0460us  4.1660us  15.949us  cudaMemcpy
  0.01%  22.826us         3  7.6080us  5.1880us  10.687us  cudaLaunch
  0.01%  10.586us         1  10.586us  10.586us  10.586us  cudaMemset2D
  0.00%  8.1210us         1  8.1210us  8.1210us  8.1210us  cudaMemcpyToSymbol
  0.00%  7.0910us         2  3.5450us  2.3140us  4.7770us  cudaCreateTextureObject
  0.00%  1.9060us        11     173ns     116ns     362ns  cudaSetupArgument
  0.00%  1.5990us         2     799ns     291ns  1.3080us  cuDeviceGetCount
  0.00%  1.1690us         3     389ns     195ns     622ns  cudaConfigureCall
  0.00%     386ns         2     193ns     127ns     259ns  cuDeviceGet
  0.00%     184ns         1     184ns     184ns     184ns  cudaCreateChannelDesc
