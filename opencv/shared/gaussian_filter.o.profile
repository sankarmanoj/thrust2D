==8465== NVPROF is profiling process 8465, command: ./gaussian_filter.o
==8465== Profiling application: ./gaussian_filter.o
==8465== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.22%  45.078us         1  45.078us  45.078us  45.078us  [CUDA memcpy DtoH]
 39.18%  42.840us         4  10.710us     736ns  40.088us  [CUDA memcpy HtoD]
 19.60%  21.435us         1  21.435us  21.435us  21.435us  void thrust::transform_kernel<unsigned char, thrust::convolutionFunctor<unsigned char, unsigned char>>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::device_malloc_allocator<thrust::window_iterator>, thrust::warp_launcher_config, unsigned char)

==8465== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.00%  137.76ms         2  68.882ms  3.9230us  137.76ms  cudaMallocPitch
  0.26%  366.39us         2  183.20us  179.53us  186.86us  cudaGetDeviceProperties
  0.24%  329.72us         2  164.86us  3.7620us  325.96us  cudaMalloc
  0.15%  215.65us        90  2.3960us      98ns  84.184us  cuDeviceGetAttribute
  0.15%  205.06us         2  102.53us  33.328us  171.73us  cudaMemcpy2D
  0.12%  163.93us         1  163.93us  163.93us  163.93us  cuDeviceTotalMem
  0.03%  45.331us         1  45.331us  45.331us  45.331us  cudaMemcpyToSymbol
  0.02%  24.474us         1  24.474us  24.474us  24.474us  cudaLaunch
  0.01%  19.616us         1  19.616us  19.616us  19.616us  cuDeviceGetName
  0.01%  14.563us         2  7.2810us  3.5360us  11.027us  cudaMemcpy
  0.00%  1.4120us         2     706ns     152ns  1.2600us  cuDeviceGetCount
  0.00%  1.1890us         1  1.1890us  1.1890us  1.1890us  cudaConfigureCall
  0.00%     914ns         4     228ns     128ns     339ns  cudaSetupArgument
  0.00%     335ns         2     167ns      99ns     236ns  cuDeviceGet
