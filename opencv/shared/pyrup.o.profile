==10996== NVPROF is profiling process 10996, command: ./pyrup.o
==10996== Profiling application: ./pyrup.o
==10996== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.90%  136.10us         1  136.10us  136.10us  136.10us  void thrust::for_each_kernel<unsigned char, pyrupTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrupTransformFunctor)
 24.84%  82.649us         1  82.649us  82.649us  82.649us  [CUDA memcpy DtoH]
  9.52%  31.690us         1  31.690us  31.690us  31.690us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  8.17%  27.176us         1  27.176us  27.176us  27.176us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  8.02%  26.696us         6  4.4490us     704ns  21.191us  [CUDA memcpy HtoD]
  3.36%  11.171us         1  11.171us  11.171us  11.171us  [CUDA memset]
  3.27%  10.883us         1  10.883us  10.883us  10.883us  [CUDA memcpy DtoA]
  1.91%  6.3700us         1  6.3700us  6.3700us  6.3700us  [CUDA memcpy DtoD]

==10996== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.66%  646.62ms         3  215.54ms  8.3360us  645.41ms  cudaMallocPitch
  1.19%  7.9543ms         1  7.9543ms  7.9543ms  7.9543ms  cudaGetDeviceProperties
  0.79%  5.2862ms         1  5.2862ms  5.2862ms  5.2862ms  cudaMallocArray
  0.57%  3.7931ms        90  42.145us     103ns  1.7113ms  cuDeviceGetAttribute
  0.52%  3.4791ms         5  695.82us  6.3320us  3.4314ms  cudaMalloc
  0.09%  610.09us         1  610.09us  610.09us  610.09us  cuDeviceTotalMem
  0.08%  559.82us         3  186.61us  13.396us  515.59us  cudaMemcpy2D
  0.03%  213.99us         1  213.99us  213.99us  213.99us  cuDeviceGetName
  0.02%  152.38us         1  152.38us  152.38us  152.38us  cudaDeviceSynchronize
  0.02%  103.82us         4  25.955us  9.7510us  35.561us  cudaMemcpy
  0.01%  49.004us         1  49.004us  49.004us  49.004us  cudaMemcpy2DToArray
  0.01%  48.568us         3  16.189us  8.0790us  26.518us  cudaLaunch
  0.00%  21.538us         1  21.538us  21.538us  21.538us  cudaMemset2D
  0.00%  21.264us         1  21.264us  21.264us  21.264us  cudaMemcpyToSymbol
  0.00%  11.599us         2  5.7990us  3.4180us  8.1810us  cudaCreateTextureObject
  0.00%  3.0910us        11     281ns     152ns     637ns  cudaSetupArgument
  0.00%  2.5280us         3     842ns     312ns  1.3840us  cudaConfigureCall
  0.00%  2.2570us         1  2.2570us  2.2570us  2.2570us  cudaMemcpyToArray
  0.00%  2.0100us         2  1.0050us     299ns  1.7110us  cuDeviceGetCount
  0.00%     408ns         2     204ns     141ns     267ns  cuDeviceGet
  0.00%     141ns         1     141ns     141ns     141ns  cudaCreateChannelDesc
