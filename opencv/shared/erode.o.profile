==10923== NVPROF is profiling process 10923, command: ./erode.o
==10923== Profiling application: ./erode.o
==10923== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.16%  28.392us         6  4.7320us     864ns  22.695us  [CUDA memcpy HtoD]
 35.36%  27.016us         1  27.016us  27.016us  27.016us  void thrust::transform_kernel<unsigned char, erodeFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
 27.48%  20.998us         1  20.998us  20.998us  20.998us  [CUDA memcpy DtoH]

==10923== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.51%  471.59ms         3  157.20ms  3.7830us  471.58ms  cudaMallocPitch
  3.73%  18.627ms         2  9.3134ms  378.25us  18.249ms  cudaGetDeviceProperties
  1.43%  7.1358ms         5  1.4272ms  3.9620us  7.0755ms  cudaMalloc
  0.11%  545.41us         5  109.08us  3.2840us  487.09us  cudaMemcpy
  0.09%  435.02us        90  4.8330us     127ns  168.28us  cuDeviceGetAttribute
  0.04%  212.14us         2  106.07us  28.100us  184.04us  cudaMemcpy2D
  0.04%  210.27us         1  210.27us  210.27us  210.27us  cuDeviceTotalMem
  0.04%  182.56us         1  182.56us  182.56us  182.56us  cuDeviceGetName
  0.01%  29.249us         1  29.249us  29.249us  29.249us  cudaLaunch
  0.00%  3.0170us         2  1.5080us     672ns  2.3450us  cuDeviceGetCount
  0.00%  1.5280us         4     382ns     189ns     700ns  cudaSetupArgument
  0.00%  1.3720us         1  1.3720us  1.3720us  1.3720us  cudaConfigureCall
  0.00%     709ns         2     354ns     259ns     450ns  cuDeviceGet
