==8127== NVPROF is profiling process 8127, command: ./gaussian_filter.o
==8127== Profiling application: ./gaussian_filter.o
==8127== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 52.96%  52.959us         1  52.959us  52.959us  52.959us  void thrust::transform_kernel<unsigned char, convolutionFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 26.11%  26.112us         5  5.2220us  1.1840us  21.280us  [CUDA memcpy HtoD]
 20.93%  20.928us         1  20.928us  20.928us  20.928us  [CUDA memcpy DtoH]

==8127== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.44%  317.70ms         1  317.70ms  317.70ms  317.70ms  cudaMemcpyToSymbol
  0.15%  475.49us         2  237.75us  4.3280us  471.17us  cudaMallocPitch
  0.12%  397.45us         4  99.362us  4.1740us  383.45us  cudaMalloc
  0.09%  273.35us        90  3.0370us     101ns  118.81us  cuDeviceGetAttribute
  0.08%  264.78us         1  264.78us  264.78us  264.78us  cudaGetDeviceProperties
  0.06%  184.23us         1  184.23us  184.23us  184.23us  cuDeviceTotalMem
  0.04%  131.95us         2  65.973us  20.009us  111.94us  cudaMemcpy2D
  0.01%  28.965us         1  28.965us  28.965us  28.965us  cuDeviceGetName
  0.01%  25.209us         4  6.3020us  3.8940us  10.199us  cudaMemcpy
  0.00%  12.500us         1  12.500us  12.500us  12.500us  cudaLaunch
  0.00%  1.7530us         2     876ns     197ns  1.5560us  cuDeviceGetCount
  0.00%     962ns         4     240ns     136ns     374ns  cudaSetupArgument
  0.00%     552ns         1     552ns     552ns     552ns  cudaConfigureCall
  0.00%     360ns         2     180ns     134ns     226ns  cuDeviceGet
