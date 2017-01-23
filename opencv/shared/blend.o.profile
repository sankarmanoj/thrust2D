==10999== NVPROF is profiling process 10999, command: ./blend.o
==10999== Profiling application: ./blend.o
==10999== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.91%  48.431us         8  6.0530us     608ns  21.510us  [CUDA memcpy HtoD]
 31.38%  31.721us         1  31.721us  31.721us  31.721us  void thrust::binary_transform_kernel<unsigned char, blendFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, blendFunctor)
 20.71%  20.934us         1  20.934us  20.934us  20.934us  [CUDA memcpy DtoH]

==10999== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 90.45%  600.25ms         3  200.08ms  3.8670us  600.25ms  cudaMallocPitch
  6.04%  40.097ms         6  6.6828ms  4.0180us  40.069ms  cudaMalloc
  1.64%  10.889ms        90  120.99us     120ns  7.5993ms  cuDeviceGetAttribute
  1.53%  10.163ms         2  5.0817ms  2.1662ms  7.9972ms  cudaGetDeviceProperties
  0.22%  1.4640ms         1  1.4640ms  1.4640ms  1.4640ms  cuDeviceTotalMem
  0.06%  412.33us         1  412.33us  412.33us  412.33us  cuDeviceGetName
  0.04%  251.69us         3  83.897us  17.372us  215.88us  cudaMemcpy2D
  0.02%  105.58us         6  17.596us  4.1780us  40.836us  cudaMemcpy
  0.00%  21.539us         1  21.539us  21.539us  21.539us  cudaLaunch
  0.00%  4.3360us         2  2.1680us     587ns  3.7490us  cuDeviceGetCount
  0.00%  1.0990us         5     219ns     128ns     326ns  cudaSetupArgument
  0.00%     957ns         1     957ns     957ns     957ns  cudaConfigureCall
  0.00%     890ns         2     445ns     214ns     676ns  cuDeviceGet
