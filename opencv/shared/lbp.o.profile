==5139== NVPROF is profiling process 5139, command: ./lbp.o
==5139== Profiling application: ./lbp.o
==5139== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.52%  72.320us         1  72.320us  72.320us  72.320us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 21.96%  26.240us         5  5.2480us  1.1840us  21.440us  [CUDA memcpy HtoD]
 17.51%  20.928us         1  20.928us  20.928us  20.928us  [CUDA memcpy DtoH]

==5139== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.87%  112.04ms         3  37.348ms  3.7850us  112.04ms  cudaMallocPitch
  0.57%  651.97us         2  325.98us  271.59us  380.38us  cudaGetDeviceProperties
  0.53%  610.51us         1  610.51us  610.51us  610.51us  cuDeviceTotalMem
  0.41%  469.89us        90  5.2200us     253ns  175.09us  cuDeviceGetAttribute
  0.33%  373.99us         4  93.496us  3.7400us  361.34us  cudaMalloc
  0.19%  213.33us         2  106.67us  36.978us  176.36us  cudaMemcpy2D
  0.06%  66.888us         1  66.888us  66.888us  66.888us  cuDeviceGetName
  0.02%  20.870us         4  5.2170us  3.3160us  9.0540us  cudaMemcpy
  0.01%  11.231us         1  11.231us  11.231us  11.231us  cudaLaunch
  0.01%  10.559us         1  10.559us  10.559us  10.559us  cudaCreateTextureObject
  0.00%  4.7550us         2  2.3770us  2.1070us  2.6480us  cuDeviceGetCount
  0.00%  1.1790us         2     589ns     579ns     600ns  cuDeviceGet
  0.00%     869ns         4     217ns     125ns     314ns  cudaSetupArgument
  0.00%     654ns         1     654ns     654ns     654ns  cudaConfigureCall
  0.00%     190ns         1     190ns     190ns     190ns  cudaCreateChannelDesc
