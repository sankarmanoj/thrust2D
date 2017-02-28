==10996== NVPROF is profiling process 10996, command: ./erode.o
==10996== Profiling application: ./erode.o
==10996== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.26%  28.452us         6  4.7420us  1.1840us  22.435us  [CUDA memcpy HtoD]
 35.60%  27.939us         1  27.939us  27.939us  27.939us  void thrust::transform_kernel<unsigned char, erodeFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
 28.14%  22.082us         1  22.082us  22.082us  22.082us  [CUDA memcpy DtoH]

==10996== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.53%  127.91ms         3  42.638ms  3.4470us  127.91ms  cudaMallocPitch
  0.87%  1.1462ms         2  573.09us  417.80us  728.37us  cudaGetDeviceProperties
  0.64%  844.46us        90  9.3820us     363ns  329.86us  cuDeviceGetAttribute
  0.44%  574.24us         1  574.24us  574.24us  574.24us  cuDeviceTotalMem
  0.31%  400.66us         5  80.131us  3.8270us  381.06us  cudaMalloc
  0.12%  154.36us         2  77.181us  18.091us  136.27us  cudaMemcpy2D
  0.06%  73.684us         1  73.684us  73.684us  73.684us  cuDeviceGetName
  0.02%  29.242us         5  5.8480us  3.3070us  10.275us  cudaMemcpy
  0.01%  14.715us         1  14.715us  14.715us  14.715us  cudaLaunch
  0.00%  3.2160us         2  1.6080us     438ns  2.7780us  cuDeviceGetCount
  0.00%  1.0280us         2     514ns     354ns     674ns  cuDeviceGet
  0.00%     910ns         4     227ns     136ns     362ns  cudaSetupArgument
  0.00%     720ns         1     720ns     720ns     720ns  cudaConfigureCall
