==3688== NVPROF is profiling process 3688, command: ./harris.o
==3688== Profiling application: ./harris.o
==3688== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.37%  735.60us         1  735.60us  735.60us  735.60us  void cv::cuda::device::imgproc::cornerHarris_kernel<cv::cuda::device::BrdRowReflect101<void>, cv::cuda::device::BrdColReflect101<void>>(int, float, cv::cuda::PtrStepSz<float>, void, cv::cuda::device::BrdRowReflect101<void>)
 17.89%  217.97us         6  36.328us  1.1840us  170.17us  [CUDA memcpy HtoD]
 14.15%  172.37us         1  172.37us  172.37us  172.37us  [CUDA memcpy DtoH]
  4.24%  51.645us         2  25.822us  25.503us  26.142us  void column_filter::linearColumnFilter<int=5, float, float, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<float>, int, float)
  2.89%  35.230us         2  17.615us  17.599us  17.631us  void row_filter::linearRowFilter<int=5, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  0.47%  5.6960us         4  1.4240us  1.1200us  1.7280us  [CUDA memcpy DtoD]

==3688== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.28%  494.74ms         6  82.456ms  374.02us  492.83ms  cudaMallocPitch
  0.17%  843.81us         5  168.76us  17.644us  741.77us  cudaDeviceSynchronize
  0.15%  763.67us         5  152.73us  5.3570us  391.54us  cudaMalloc
  0.11%  547.39us         7  78.199us  3.5110us  333.75us  cudaMemcpy2D
  0.11%  536.75us        10  53.674us  4.8520us  105.76us  cudaFree
  0.06%  293.29us        90  3.2580us     102ns  117.22us  cuDeviceGetAttribute
  0.06%  274.80us         1  274.80us  274.80us  274.80us  cudaGetDeviceProperties
  0.04%  190.86us         1  190.86us  190.86us  190.86us  cuDeviceTotalMem
  0.01%  56.667us         5  11.333us  4.2920us  29.626us  cudaLaunch
  0.01%  47.226us         4  11.806us  7.7630us  20.078us  cudaMemcpyToSymbol
  0.01%  26.837us         1  26.837us  26.837us  26.837us  cuDeviceGetName
  0.00%  4.6900us         2  2.3450us  1.1930us  3.4970us  cudaBindTexture2D
  0.00%  3.0270us        21     144ns     114ns     360ns  cudaSetupArgument
  0.00%  2.5860us         4     646ns     238ns  1.0790us  cudaGetDevice
  0.00%  1.7270us         5     345ns     150ns     763ns  cudaConfigureCall
  0.00%  1.3370us         2     668ns     238ns  1.0990us  cuDeviceGetCount
  0.00%  1.2430us         5     248ns     182ns     325ns  cudaGetLastError
  0.00%     463ns         4     115ns      79ns     157ns  cudaGetDeviceCount
  0.00%     290ns         2     145ns      81ns     209ns  cudaCreateChannelDesc
  0.00%     262ns         2     131ns     103ns     159ns  cuDeviceGet
