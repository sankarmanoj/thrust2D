==4049== NVPROF is profiling process 4049, command: ./blend.o
==4049== Profiling application: ./blend.o
==4049== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.99%  66.947us         8  8.3680us     544ns  36.482us  [CUDA memcpy HtoD]
 25.09%  29.473us         1  29.473us  29.473us  29.473us  void thrust::binary_transform_kernel<unsigned char, blendFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, blendFunctor)
 17.92%  21.057us         1  21.057us  21.057us  21.057us  [CUDA memcpy DtoH]

==4049== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.70%  129.46ms         3  43.152ms  3.3250us  129.45ms  cudaMallocPitch
  0.44%  574.06us         2  287.03us  249.43us  324.64us  cudaGetDeviceProperties
  0.27%  354.04us         6  59.007us  3.4520us  332.54us  cudaMalloc
  0.26%  338.26us        90  3.7580us     100ns  133.75us  cuDeviceGetAttribute
  0.15%  191.63us         3  63.875us  35.519us  115.83us  cudaMemcpy2D
  0.13%  166.57us         1  166.57us  166.57us  166.57us  cuDeviceTotalMem
  0.02%  32.768us         6  5.4610us  3.0120us  13.234us  cudaMemcpy
  0.02%  29.700us         1  29.700us  29.700us  29.700us  cuDeviceGetName
  0.01%  15.474us         1  15.474us  15.474us  15.474us  cudaLaunch
  0.00%  1.2890us         2     644ns     149ns  1.1400us  cuDeviceGetCount
  0.00%  1.1450us         5     229ns     124ns     406ns  cudaSetupArgument
  0.00%  1.0890us         1  1.0890us  1.0890us  1.0890us  cudaConfigureCall
  0.00%     298ns         2     149ns      98ns     200ns  cuDeviceGet
