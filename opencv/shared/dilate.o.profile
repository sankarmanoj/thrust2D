==4469== NVPROF is profiling process 4469, command: ./dilate.o
==4469== Profiling application: ./dilate.o
==4469== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.69%  6.3625ms         1  6.3625ms  6.3625ms  6.3625ms  void thrust::transform_kernel<unsigned char, dilateFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  0.69%  44.574us         6  7.4290us     704ns  40.318us  [CUDA memcpy HtoD]
  0.62%  40.094us         1  40.094us  40.094us  40.094us  [CUDA memcpy DtoH]

==4469== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.60%  311.47ms         3  103.82ms  3.3730us  311.46ms  cudaMallocPitch
  2.04%  6.5172ms         2  3.2586ms  34.128us  6.4830ms  cudaMemcpy2D
  0.12%  371.62us         2  185.81us  176.56us  195.06us  cudaGetDeviceProperties
  0.10%  332.65us         5  66.530us  3.3790us  316.15us  cudaMalloc
  0.07%  216.42us        90  2.4040us      95ns  85.156us  cuDeviceGetAttribute
  0.05%  166.36us         1  166.36us  166.36us  166.36us  cuDeviceTotalMem
  0.01%  25.563us         5  5.1120us  2.8820us  11.610us  cudaMemcpy
  0.01%  23.767us         1  23.767us  23.767us  23.767us  cuDeviceGetName
  0.00%  12.436us         1  12.436us  12.436us  12.436us  cudaLaunch
  0.00%  1.7520us         2     876ns     567ns  1.1850us  cuDeviceGetCount
  0.00%     849ns         1     849ns     849ns     849ns  cudaConfigureCall
  0.00%     826ns         4     206ns     121ns     297ns  cudaSetupArgument
  0.00%     413ns         2     206ns     199ns     214ns  cuDeviceGet
