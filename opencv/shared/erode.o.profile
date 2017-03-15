==3853== NVPROF is profiling process 3853, command: ./erode.o
==3853== Profiling application: ./erode.o
==3853== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.12%  39.209us         6  6.5340us     544ns  36.137us  [CUDA memcpy HtoD]
 30.20%  27.463us         1  27.463us  27.463us  27.463us  void thrust::transform_kernel<unsigned char, erodeFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
 26.68%  24.262us         1  24.262us  24.262us  24.262us  [CUDA memcpy DtoH]

==3853== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.80%  439.52ms         3  146.51ms  3.3290us  439.51ms  cudaMallocPitch
  0.80%  3.5454ms         2  1.7727ms  1.7165ms  1.8289ms  cudaGetDeviceProperties
  0.16%  713.40us        90  7.9260us     103ns  234.54us  cuDeviceGetAttribute
  0.13%  588.55us         5  117.71us  3.6780us  558.87us  cudaMalloc
  0.04%  192.00us         1  192.00us  192.00us  192.00us  cuDeviceTotalMem
  0.04%  172.17us         2  86.083us  48.030us  124.14us  cudaMemcpy2D
  0.01%  48.521us         5  9.7040us  3.1630us  18.328us  cudaMemcpy
  0.01%  39.056us         1  39.056us  39.056us  39.056us  cuDeviceGetName
  0.01%  35.637us         1  35.637us  35.637us  35.637us  cudaLaunch
  0.00%  5.9410us         2  2.9700us     372ns  5.5690us  cuDeviceGetCount
  0.00%  1.4080us         4     352ns     168ns     578ns  cudaSetupArgument
  0.00%  1.1710us         1  1.1710us  1.1710us  1.1710us  cudaConfigureCall
  0.00%     450ns         2     225ns     176ns     274ns  cuDeviceGet
