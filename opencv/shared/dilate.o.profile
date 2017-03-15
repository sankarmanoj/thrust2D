==4166== NVPROF is profiling process 4166, command: ./dilate.o
==4166== Profiling application: ./dilate.o
==4166== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.00%  32.062us         1  32.062us  32.062us  32.062us  [CUDA memcpy DtoH]
 34.10%  30.367us         1  30.367us  30.367us  30.367us  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
 29.90%  26.623us         6  4.4370us     544ns  23.551us  [CUDA memcpy HtoD]

==4166== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.85%  140.84ms         3  46.946ms  3.4390us  140.83ms  cudaMallocPitch
  0.32%  451.91us         2  225.96us  200.10us  251.81us  cudaGetDeviceProperties
  0.27%  387.61us         5  77.521us  3.5680us  370.12us  cudaMalloc
  0.17%  238.97us         2  119.49us  36.410us  202.56us  cudaMemcpy2D
  0.16%  233.36us        90  2.5920us     100ns  90.008us  cuDeviceGetAttribute
  0.11%  154.64us         1  154.64us  154.64us  154.64us  cuDeviceTotalMem
  0.07%  106.21us         5  21.241us  3.5080us  44.639us  cudaMemcpy
  0.03%  36.404us         1  36.404us  36.404us  36.404us  cudaLaunch
  0.01%  20.547us         1  20.547us  20.547us  20.547us  cuDeviceGetName
  0.00%  1.2900us         2     645ns     153ns  1.1370us  cuDeviceGetCount
  0.00%  1.0140us         1  1.0140us  1.0140us  1.0140us  cudaConfigureCall
  0.00%     881ns         4     220ns     122ns     364ns  cudaSetupArgument
  0.00%     367ns         2     183ns     119ns     248ns  cuDeviceGet
