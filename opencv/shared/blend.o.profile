==4498== NVPROF is profiling process 4498, command: ./blend.o
==4498== Profiling application: ./blend.o
==4498== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.34%  52.417us         8  6.5520us  1.2160us  22.561us  [CUDA memcpy HtoD]
 33.73%  37.344us         1  37.344us  37.344us  37.344us  void thrust::binary_transform_kernel<unsigned char, blendFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, blendFunctor)
 18.93%  20.960us         1  20.960us  20.960us  20.960us  [CUDA memcpy DtoH]

==4498== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.81%  125.80ms         3  41.935ms  3.5990us  125.80ms  cudaMallocPitch
  0.37%  467.34us         2  233.67us  209.31us  258.03us  cudaGetDeviceProperties
  0.34%  426.77us         6  71.128us  3.5560us  405.93us  cudaMalloc
  0.19%  241.15us        90  2.6790us     102ns  94.329us  cuDeviceGetAttribute
  0.14%  176.29us         1  176.29us  176.29us  176.29us  cuDeviceTotalMem
  0.10%  130.90us         3  43.632us  17.804us  91.211us  cudaMemcpy2D
  0.03%  35.459us         6  5.9090us  3.1680us  10.178us  cudaMemcpy
  0.02%  22.250us         1  22.250us  22.250us  22.250us  cuDeviceGetName
  0.01%  11.521us         1  11.521us  11.521us  11.521us  cudaLaunch
  0.00%  1.1430us         2     571ns     189ns     954ns  cuDeviceGetCount
  0.00%     996ns         5     199ns     120ns     295ns  cudaSetupArgument
  0.00%     685ns         1     685ns     685ns     685ns  cudaConfigureCall
  0.00%     292ns         2     146ns     114ns     178ns  cuDeviceGet
