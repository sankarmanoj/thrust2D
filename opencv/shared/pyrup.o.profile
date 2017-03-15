==6530== NVPROF is profiling process 6530, command: ./pyrup.o
==6530== Profiling application: ./pyrup.o
==6530== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.83%  98.336us         1  98.336us  98.336us  98.336us  [CUDA memcpy DtoH]
 33.34%  94.112us         1  94.112us  94.112us  94.112us  void thrust::for_each_kernel<unsigned char, pyrupTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, pyrupTransformFunctor)
 11.28%  31.840us         1  31.840us  31.840us  31.840us  void thrust::convolutionColumnsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
  9.42%  26.592us         1  26.592us  26.592us  26.592us  void thrust::convolutionRowsKernel<unsigned char, float>(unsigned char*, unsigned char, int, int, int, int, thrust::constant_vector<float>)
  8.51%  24.032us         5  4.8060us     544ns  21.664us  [CUDA memcpy HtoD]
  2.41%  6.8160us         1  6.8160us  6.8160us  6.8160us  [CUDA memcpy DtoD]
  0.20%     576ns         1     576ns     576ns     576ns  [CUDA memset]

==6530== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.70%  153.01ms         3  51.003ms  4.0040us  152.69ms  cudaMallocPitch
  0.41%  640.53us         5  128.10us  3.9040us  313.52us  cudaMalloc
  0.36%  553.50us         3  184.50us  12.634us  516.55us  cudaMemcpy2D
  0.15%  236.92us        90  2.6320us     104ns  91.150us  cuDeviceGetAttribute
  0.14%  217.85us         1  217.85us  217.85us  217.85us  cudaGetDeviceProperties
  0.10%  158.98us         1  158.98us  158.98us  158.98us  cuDeviceTotalMem
  0.06%  95.022us         1  95.022us  95.022us  95.022us  cudaDeviceSynchronize
  0.02%  34.741us         3  11.580us  6.6300us  15.520us  cudaLaunch
  0.02%  24.337us         3  8.1120us  3.9790us  12.180us  cudaMemcpy
  0.01%  22.520us         1  22.520us  22.520us  22.520us  cuDeviceGetName
  0.01%  19.439us         1  19.439us  19.439us  19.439us  cudaMemset2D
  0.00%  6.2710us         1  6.2710us  6.2710us  6.2710us  cudaMemcpyToSymbol
  0.00%  2.3590us        17     138ns     107ns     379ns  cudaSetupArgument
  0.00%  1.4670us         3     489ns     173ns     921ns  cudaConfigureCall
  0.00%  1.4050us         2     702ns     211ns  1.1940us  cuDeviceGetCount
  0.00%     279ns         2     139ns     100ns     179ns  cuDeviceGet
