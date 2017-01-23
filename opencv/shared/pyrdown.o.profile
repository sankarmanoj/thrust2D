==11069== NVPROF is profiling process 11069, command: ./pyrdown.o
==11069== Profiling application: ./pyrdown.o
==11069== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.88%  26.120us         5  5.2240us  1.2160us  21.254us  [CUDA memcpy HtoD]
 15.34%  10.307us         1  10.307us  10.307us  10.307us  void thrust::for_each_kernel<unsigned char, pyrdownTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, pyrdownTransformFunctor)
 12.15%  8.1630us         1  8.1630us  8.1630us  8.1630us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 11.86%  7.9710us         1  7.9710us  7.9710us  7.9710us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  8.43%  5.6650us         1  5.6650us  5.6650us  5.6650us  [CUDA memcpy DtoH]
  5.24%  3.5210us         1  3.5210us  3.5210us  3.5210us  [CUDA memset]
  4.86%  3.2650us         1  3.2650us  3.2650us  3.2650us  [CUDA memcpy DtoA]
  3.24%  2.1770us         1  2.1770us  2.1770us  2.1770us  [CUDA memcpy DtoD]

==11069== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.79%  624.91ms         2  312.46ms  4.3050us  624.91ms  cudaMallocPitch
  1.45%  9.2555ms        90  102.84us     105ns  4.6008ms  cuDeviceGetAttribute
  0.39%  2.4969ms         1  2.4969ms  2.4969ms  2.4969ms  cuDeviceTotalMem
  0.17%  1.1114ms         1  1.1114ms  1.1114ms  1.1114ms  cuDeviceGetName
  0.06%  397.13us         4  99.282us  4.3520us  381.62us  cudaMalloc
  0.06%  382.71us         1  382.71us  382.71us  382.71us  cudaMallocArray
  0.04%  269.03us         1  269.03us  269.03us  269.03us  cudaGetDeviceProperties
  0.01%  66.210us         3  22.070us  7.7200us  39.894us  cudaMemcpy2D
  0.01%  33.019us         1  33.019us  33.019us  33.019us  cudaMemcpy2DToArray
  0.00%  24.498us         3  8.1660us  6.1480us  10.790us  cudaMemcpy
  0.00%  23.636us         3  7.8780us  5.5660us  9.1830us  cudaLaunch
  0.00%  15.403us         1  15.403us  15.403us  15.403us  cudaMemset2D
  0.00%  7.3470us         1  7.3470us  7.3470us  7.3470us  cudaMemcpyToSymbol
  0.00%  6.9690us         2  3.4840us  2.2620us  4.7070us  cudaCreateTextureObject
  0.00%  4.7460us        11     431ns     119ns  3.0960us  cudaSetupArgument
  0.00%  1.7640us         2     882ns     271ns  1.4930us  cuDeviceGetCount
  0.00%  1.6510us         1  1.6510us  1.6510us  1.6510us  cudaMemcpyToArray
  0.00%  1.0060us         3     335ns     213ns     544ns  cudaConfigureCall
  0.00%     507ns         2     253ns     163ns     344ns  cuDeviceGet
  0.00%     122ns         1     122ns     122ns     122ns  cudaCreateChannelDesc
