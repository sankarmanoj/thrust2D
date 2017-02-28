==8040== NVPROF is profiling process 8040, command: ./dilate.o
==8040== Profiling application: ./dilate.o
==8040== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.66%  6.1118ms         1  6.1118ms  6.1118ms  6.1118ms  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::device_malloc_allocator<thrust::window_iterator>, thrust::warp_launcher_config, dilateFunctor)
  0.70%  43.170us         4  10.792us     704ns  40.290us  [CUDA memcpy HtoD]
  0.64%  39.714us         1  39.714us  39.714us  39.714us  [CUDA memcpy DtoH]

==8040== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.56%  264.24ms         3  88.079ms  3.3090us  264.23ms  cudaMallocPitch
  2.29%  6.2567ms         2  3.1284ms  23.340us  6.2334ms  cudaMemcpy2D
  0.47%  1.2891ms         3  429.70us  3.5220us  1.2817ms  cudaMalloc
  0.40%  1.0876ms         2  543.79us  442.67us  644.92us  cudaGetDeviceProperties
  0.18%  480.87us        90  5.3420us      96ns  198.86us  cuDeviceGetAttribute
  0.07%  184.64us         1  184.64us  184.64us  184.64us  cuDeviceTotalMem
  0.02%  43.198us         1  43.198us  43.198us  43.198us  cuDeviceGetName
  0.01%  27.958us         1  27.958us  27.958us  27.958us  cudaLaunch
  0.01%  17.851us         3  5.9500us  2.8770us  11.355us  cudaMemcpy
  0.00%  11.048us         1  11.048us  11.048us  11.048us  cudaConfigureCall
  0.00%  1.2510us         2     625ns     192ns  1.0590us  cuDeviceGetCount
  0.00%  1.0520us         4     263ns     137ns     401ns  cudaSetupArgument
  0.00%     279ns         2     139ns      99ns     180ns  cuDeviceGet
