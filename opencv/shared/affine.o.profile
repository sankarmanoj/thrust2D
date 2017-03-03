==16539== NVPROF is profiling process 16539, command: ./affine.o
==16539== Profiling application: ./affine.o
==16539== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.19%  65.789us         1  65.789us  65.789us  65.789us  [CUDA memcpy DtoH]
 30.12%  53.278us         1  53.278us  53.278us  53.278us  void thrust::for_each_kernel<unsigned char, AffineTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, AffineTransformFunctor)
 26.14%  46.237us         5  9.2470us     704ns  42.174us  [CUDA memcpy HtoD]
  6.55%  11.584us         2  5.7920us  5.1200us  6.4640us  [CUDA memset]

==16539== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.15%  477.21ms         3  159.07ms  10.751us  477.14ms  cudaMallocPitch
  1.80%  8.8266ms         2  4.4133ms  185.28us  8.6413ms  cudaGetDeviceProperties
  0.79%  3.8658ms         3  1.2886ms  8.9930us  3.8467ms  cudaMalloc
  0.10%  480.93us         3  160.31us  59.560us  285.15us  cudaMemcpy2D
  0.05%  254.09us        90  2.8230us     102ns  97.432us  cuDeviceGetAttribute
  0.04%  202.75us         3  67.582us  55.039us  86.655us  cudaMemcpy
  0.04%  174.48us         1  174.48us  174.48us  174.48us  cuDeviceTotalMem
  0.02%  95.600us         2  47.800us  46.789us  48.811us  cudaMemset2D
  0.01%  65.707us         1  65.707us  65.707us  65.707us  cudaLaunch
  0.01%  42.970us         1  42.970us  42.970us  42.970us  cuDeviceGetName
  0.00%  7.2740us         2  3.6370us  3.1060us  4.1680us  cuDeviceGetCount
  0.00%  5.4390us         1  5.4390us  5.4390us  5.4390us  cudaConfigureCall
  0.00%  1.6420us         2     821ns     761ns     881ns  cuDeviceGet
  0.00%  1.3360us         3     445ns     195ns     918ns  cudaSetupArgument
