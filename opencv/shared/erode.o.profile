==16512== NVPROF is profiling process 16512, command: ./erode.o
==16512== Profiling application: ./erode.o
==16512== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.03%  47.326us         1  47.326us  47.326us  47.326us  [CUDA memcpy DtoH]
 37.77%  45.790us         6  7.6310us     704ns  41.566us  [CUDA memcpy HtoD]
 23.20%  28.127us         1  28.127us  28.127us  28.127us  void thrust::transform_kernel<unsigned char, erodeFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)

==16512== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.72%  598.13ms         3  199.38ms  5.2130us  598.10ms  cudaMallocPitch
  1.55%  9.5092ms         2  4.7546ms  222.16us  9.2871ms  cudaGetDeviceProperties
  0.49%  2.9905ms         5  598.09us  5.6710us  2.9376ms  cudaMalloc
  0.10%  612.54us         5  122.51us  5.5450us  537.35us  cudaMemcpy
  0.05%  284.28us         2  142.14us  128.56us  155.72us  cudaMemcpy2D
  0.04%  272.27us        90  3.0250us     130ns  99.276us  cuDeviceGetAttribute
  0.03%  183.22us         1  183.22us  183.22us  183.22us  cuDeviceTotalMem
  0.01%  82.894us         1  82.894us  82.894us  82.894us  cuDeviceGetName
  0.01%  37.250us         1  37.250us  37.250us  37.250us  cudaLaunch
  0.00%  2.6000us         2  1.3000us     281ns  2.3190us  cuDeviceGetCount
  0.00%  1.6260us         4     406ns     189ns     638ns  cudaSetupArgument
  0.00%  1.5970us         1  1.5970us  1.5970us  1.5970us  cudaConfigureCall
  0.00%     793ns         2     396ns     378ns     415ns  cuDeviceGet
