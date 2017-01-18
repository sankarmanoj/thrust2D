==25338== NVPROF is profiling process 25338, command: ./blend.o
==25338== Profiling application: ./blend.o
==25338== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.32%  90.238us         8  11.279us     704ns  44.831us  [CUDA memcpy HtoD]
 24.37%  39.040us         1  39.040us  39.040us  39.040us  [CUDA memcpy DtoH]
 19.31%  30.943us         1  30.943us  30.943us  30.943us  void thrust::binary_transform_kernel<unsigned char, blendFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, blendFunctor)

==25338== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.89%  139.01ms         3  46.338ms  3.1430us  139.01ms  cudaMallocPitch
  0.27%  384.74us         2  192.37us  186.34us  198.40us  cudaGetDeviceProperties
  0.24%  334.55us         6  55.758us  3.4060us  314.08us  cudaMalloc
  0.19%  274.04us        90  3.0440us      97ns  84.329us  cuDeviceGetAttribute
  0.15%  205.18us         1  205.18us  205.18us  205.18us  cuDeviceTotalMem
  0.13%  188.77us         3  62.923us  20.025us  145.79us  cudaMemcpy2D
  0.10%  134.28us         1  134.28us  134.28us  134.28us  cuDeviceGetName
  0.02%  28.197us         6  4.6990us  2.8780us  10.891us  cudaMemcpy
  0.01%  12.187us         1  12.187us  12.187us  12.187us  cudaLaunch
  0.00%  1.4710us         2     735ns     173ns  1.2980us  cuDeviceGetCount
  0.00%  1.0840us         5     216ns     123ns     390ns  cudaSetupArgument
  0.00%     943ns         1     943ns     943ns     943ns  cudaConfigureCall
  0.00%     391ns         2     195ns     111ns     280ns  cuDeviceGet
