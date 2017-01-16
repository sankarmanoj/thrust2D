==27247== NVPROF is profiling process 27247, command: ./dilate.o
==27247== Profiling application: ./dilate.o
==27247== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.47%  33.409us         1  33.409us  33.409us  33.409us  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
 34.22%  28.960us         6  4.8260us  1.2160us  22.880us  [CUDA memcpy HtoD]
 26.31%  22.272us         1  22.272us  22.272us  22.272us  [CUDA memcpy DtoH]

==27247== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.83%  124.26ms         3  41.422ms  3.5410us  124.26ms  cudaMallocPitch
  0.37%  465.45us         2  232.72us  208.52us  256.92us  cudaGetDeviceProperties
  0.31%  389.46us         5  77.891us  3.9290us  372.39us  cudaMalloc
  0.19%  240.60us        90  2.6730us     101ns  93.860us  cuDeviceGetAttribute
  0.14%  181.96us         1  181.96us  181.96us  181.96us  cuDeviceTotalMem
  0.10%  131.21us         2  65.606us  17.713us  113.50us  cudaMemcpy2D
  0.02%  27.363us         5  5.4720us  3.0520us  9.6640us  cudaMemcpy
  0.02%  22.362us         1  22.362us  22.362us  22.362us  cuDeviceGetName
  0.01%  11.306us         1  11.306us  11.306us  11.306us  cudaLaunch
  0.00%  1.6260us         2     813ns     173ns  1.4530us  cuDeviceGetCount
  0.00%     896ns         4     224ns     122ns     328ns  cudaSetupArgument
  0.00%     753ns         1     753ns     753ns     753ns  cudaConfigureCall
  0.00%     303ns         2     151ns     121ns     182ns  cuDeviceGet
