==12503== NVPROF is profiling process 12503, command: ./affine.o
==12503== Profiling application: ./affine.o
==12503== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.34%  50.403us         1  50.403us  50.403us  50.403us  void thrust::for_each_kernel<unsigned char, AffineTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
 25.30%  27.522us         6  4.5870us  1.2160us  21.281us  [CUDA memcpy HtoD]
 19.24%  20.929us         1  20.929us  20.929us  20.929us  [CUDA memcpy DtoH]
  9.12%  9.9200us         2  4.9600us  4.0320us  5.8880us  [CUDA memset]

==12503== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.70%  122.18ms         3  40.726ms  4.3920us  122.17ms  cudaMallocPitch
  0.39%  487.83us         2  243.91us  210.34us  277.49us  cudaGetDeviceProperties
  0.34%  415.11us         4  103.78us  2.7740us  399.68us  cudaMalloc
  0.20%  244.43us        90  2.7150us     102ns  95.019us  cuDeviceGetAttribute
  0.15%  182.19us         3  60.728us  11.241us  153.61us  cudaMemcpy2D
  0.15%  182.10us         1  182.10us  182.10us  182.10us  cuDeviceTotalMem
  0.02%  27.669us         2  13.834us  7.8690us  19.800us  cudaMemset2D
  0.02%  26.925us         4  6.7310us  4.5520us  10.012us  cudaMemcpy
  0.02%  24.972us         1  24.972us  24.972us  24.972us  cuDeviceGetName
  0.01%  11.000us         1  11.000us  11.000us  11.000us  cudaLaunch
  0.00%  1.7400us         2     870ns     407ns  1.3330us  cuDeviceGetCount
  0.00%  1.0620us         3     354ns     133ns     620ns  cudaSetupArgument
  0.00%     873ns         1     873ns     873ns     873ns  cudaConfigureCall
  0.00%     329ns         2     164ns     142ns     187ns  cuDeviceGet
