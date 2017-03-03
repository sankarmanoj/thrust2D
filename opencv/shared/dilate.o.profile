==16546== NVPROF is profiling process 16546, command: ./dilate.o
==16546== Profiling application: ./dilate.o
==16546== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.42%  44.414us         6  7.4020us     704ns  40.254us  [CUDA memcpy HtoD]
 34.07%  39.390us         1  39.390us  39.390us  39.390us  [CUDA memcpy DtoH]
 27.51%  31.806us         1  31.806us  31.806us  31.806us  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)

==16546== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.88%  431.07ms         3  143.69ms  6.8610us  431.05ms  cudaMallocPitch
  0.53%  2.3133ms         2  1.1566ms  190.42us  2.1228ms  cudaGetDeviceProperties
  0.34%  1.4675ms         5  293.50us  5.9700us  1.4210ms  cudaMalloc
  0.09%  413.03us         2  206.52us  56.480us  356.55us  cudaMemcpy2D
  0.05%  238.27us        90  2.6470us     133ns  85.248us  cuDeviceGetAttribute
  0.05%  196.81us         5  39.362us  8.0970us  50.254us  cudaMemcpy
  0.04%  179.69us         1  179.69us  179.69us  179.69us  cuDeviceTotalMem
  0.01%  33.596us         1  33.596us  33.596us  33.596us  cudaLaunch
  0.01%  29.304us         1  29.304us  29.304us  29.304us  cuDeviceGetName
  0.00%  4.8310us         2  2.4150us     307ns  4.5240us  cuDeviceGetCount
  0.00%  1.6010us         1  1.6010us  1.6010us  1.6010us  cudaConfigureCall
  0.00%  1.2690us         4     317ns     196ns     451ns  cudaSetupArgument
  0.00%  1.0300us         2     515ns     170ns     860ns  cuDeviceGet
