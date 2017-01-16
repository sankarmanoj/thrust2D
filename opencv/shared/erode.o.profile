==2799== NVPROF is profiling process 2799, command: ./erode.o
==2799== Profiling application: ./erode.o
==2799== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.73%  28.352us         1  28.352us  28.352us  28.352us  void thrust::transform_kernel<unsigned char, erodeFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
 34.41%  25.857us         6  4.3090us     576ns  21.377us  [CUDA memcpy HtoD]
 27.85%  20.928us         1  20.928us  20.928us  20.928us  [CUDA memcpy DtoH]

==2799== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.31%  218.44ms         3  72.813ms  3.7240us  218.43ms  cudaMallocPitch
  1.00%  2.2229ms         2  1.1115ms  243.05us  1.9799ms  cudaGetDeviceProperties
  0.36%  796.65us         5  159.33us  4.0680us  766.84us  cudaMalloc
  0.13%  288.23us        90  3.2020us     161ns  109.49us  cuDeviceGetAttribute
  0.09%  207.54us         1  207.54us  207.54us  207.54us  cuDeviceTotalMem
  0.05%  103.97us         2  51.986us  26.063us  77.910us  cudaMemcpy2D
  0.04%  87.608us         5  17.521us  3.3240us  40.371us  cudaMemcpy
  0.01%  25.273us         1  25.273us  25.273us  25.273us  cuDeviceGetName
  0.01%  24.851us         1  24.851us  24.851us  24.851us  cudaLaunch
  0.00%  1.6320us         2     816ns     293ns  1.3390us  cuDeviceGetCount
  0.00%  1.3850us         4     346ns     126ns     632ns  cudaSetupArgument
  0.00%  1.2540us         1  1.2540us  1.2540us  1.2540us  cudaConfigureCall
  0.00%     540ns         2     270ns     202ns     338ns  cuDeviceGet
