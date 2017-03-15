==3855== NVPROF is profiling process 3855, command: ./affine.o
==3855== Profiling application: ./affine.o
==3855== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.16%  51.210us         1  51.210us  51.210us  51.210us  void thrust::for_each_kernel<unsigned char, AffineTransformFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, AffineTransformFunctor)
 30.61%  33.959us         5  6.7910us     544ns  30.886us  [CUDA memcpy HtoD]
 22.30%  24.742us         1  24.742us  24.742us  24.742us  [CUDA memcpy DtoH]
  0.92%  1.0250us         2     512ns     512ns     513ns  [CUDA memset]

==3855== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.17%  431.29ms         3  143.76ms  7.0490us  431.27ms  cudaMallocPitch
  0.27%  1.1820ms         2  590.98us  271.83us  910.14us  cudaGetDeviceProperties
  0.25%  1.0741ms        90  11.934us     134ns  354.32us  cuDeviceGetAttribute
  0.13%  581.55us         3  193.85us  4.6590us  569.73us  cudaMalloc
  0.07%  301.87us         3  100.62us  50.204us  190.53us  cudaMemcpy2D
  0.05%  206.11us         1  206.11us  206.11us  206.11us  cuDeviceTotalMem
  0.02%  107.48us         3  35.828us  19.004us  67.707us  cudaMemcpy
  0.01%  59.723us         1  59.723us  59.723us  59.723us  cuDeviceGetName
  0.01%  55.574us         2  27.787us  16.044us  39.530us  cudaMemset2D
  0.01%  22.020us         1  22.020us  22.020us  22.020us  cudaLaunch
  0.00%  4.9440us         2  2.4720us  1.1710us  3.7730us  cuDeviceGetCount
  0.00%  1.4360us         1  1.4360us  1.4360us  1.4360us  cudaConfigureCall
  0.00%  1.2640us         2     632ns     195ns  1.0690us  cuDeviceGet
  0.00%  1.1150us         3     371ns     215ns     664ns  cudaSetupArgument
