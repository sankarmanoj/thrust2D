==8186== NVPROF is profiling process 8186, command: ./affine.o
==8186== Profiling application: ./affine.o
==8186== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.08%  9.8973ms         1  9.8973ms  9.8973ms  9.8973ms  void thrust::for_each_kernel<unsigned char, AffineTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, AffineTransformFunctor)
  0.44%  43.555us         5  8.7110us     736ns  40.035us  [CUDA memcpy HtoD]
  0.40%  39.779us         1  39.779us  39.779us  39.779us  [CUDA memcpy DtoH]
  0.09%  8.6080us         2  4.3040us  3.6480us  4.9600us  [CUDA memset]

==8186== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.70%  251.16ms         3  83.721ms  3.9120us  251.15ms  cudaMallocPitch
  3.83%  10.041ms         3  3.3470ms  7.4680us  9.9990ms  cudaMemcpy2D
  0.14%  362.41us         2  181.21us  176.84us  185.58us  cudaGetDeviceProperties
  0.13%  344.25us         3  114.75us  2.6920us  336.67us  cudaMalloc
  0.10%  251.87us        90  2.7980us      95ns  110.57us  cuDeviceGetAttribute
  0.07%  183.64us         1  183.64us  183.64us  183.64us  cuDeviceTotalMem
  0.01%  30.827us         1  30.827us  30.827us  30.827us  cuDeviceGetName
  0.01%  25.069us         2  12.534us  9.1740us  15.895us  cudaMemset2D
  0.01%  23.166us         3  7.7220us  4.6880us  10.534us  cudaMemcpy
  0.01%  13.541us         1  13.541us  13.541us  13.541us  cudaLaunch
  0.00%  1.4090us         2     704ns     213ns  1.1960us  cuDeviceGetCount
  0.00%  1.0560us         1  1.0560us  1.0560us  1.0560us  cudaConfigureCall
  0.00%     598ns         3     199ns     116ns     330ns  cudaSetupArgument
  0.00%     321ns         2     160ns     126ns     195ns  cuDeviceGet
