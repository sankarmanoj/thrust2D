==10887== NVPROF is profiling process 10887, command: ./dilate.o
==10887== Profiling application: ./dilate.o
==10887== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.62%  37.451us         6  6.2410us  1.1850us  31.401us  [CUDA memcpy HtoD]
 32.83%  33.578us         1  33.578us  33.578us  33.578us  [CUDA memcpy DtoH]
 30.55%  31.242us         1  31.242us  31.242us  31.242us  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)

==10887== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.32%  532.92ms         3  177.64ms  5.4350us  532.90ms  cudaMallocPitch
  0.24%  1.2745ms         5  254.91us  5.5600us  1.2197ms  cudaMalloc
  0.22%  1.2029ms         2  601.46us  351.33us  851.59us  cudaGetDeviceProperties
  0.08%  423.53us        90  4.7050us     120ns  159.13us  cuDeviceGetAttribute
  0.06%  319.85us         2  159.93us  52.789us  267.06us  cudaMemcpy2D
  0.04%  208.42us         1  208.42us  208.42us  208.42us  cuDeviceTotalMem
  0.02%  107.93us         5  21.586us  5.8590us  64.728us  cudaMemcpy
  0.01%  62.567us         1  62.567us  62.567us  62.567us  cuDeviceGetName
  0.01%  47.208us         1  47.208us  47.208us  47.208us  cudaLaunch
  0.00%  2.9970us         2  1.4980us     689ns  2.3080us  cuDeviceGetCount
  0.00%  1.9820us         1  1.9820us  1.9820us  1.9820us  cudaConfigureCall
  0.00%  1.2300us         4     307ns     180ns     443ns  cudaSetupArgument
  0.00%     931ns         2     465ns     425ns     506ns  cuDeviceGet
