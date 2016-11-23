==8844== NVPROF is profiling process 8844, command: ./gaussian_blur.o
==8844== Profiling application: ./gaussian_blur.o
==8844== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.08%  1.5799ms         1  1.5799ms  1.5799ms  1.5799ms  [CUDA memcpy DtoH]
 29.23%  980.84us         3  326.95us  1.2160us  978.41us  [CUDA memcpy HtoD]
 13.16%  441.70us         1  441.70us  441.70us  441.70us  void column_filter::linearColumnFilter<int=17, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 10.44%  350.24us         1  350.24us  350.24us  350.24us  void row_filter::linearRowFilter<int=17, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  0.09%  3.0720us         2  1.5360us  1.3440us  1.7280us  [CUDA memcpy DtoD]

==8844== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.15%  639.48ms         3  213.16ms  368.56us  638.74ms  cudaMallocPitch
  0.43%  2.7615ms         4  690.37us  4.0140us  1.7451ms  cudaMemcpy2D
  0.12%  805.53us         3  268.51us  8.9010us  407.27us  cudaMalloc
  0.08%  503.48us         5  100.70us  17.768us  172.39us  cudaFree
  0.08%  495.67us         2  247.84us  213.36us  282.32us  cudaDeviceSynchronize
  0.06%  366.94us        90  4.0770us     108ns  151.73us  cuDeviceGetAttribute
  0.04%  281.53us         1  281.53us  281.53us  281.53us  cudaGetDeviceProperties
  0.03%  209.11us         1  209.11us  209.11us  209.11us  cuDeviceTotalMem
  0.01%  32.710us         2  16.355us  11.303us  21.407us  cudaMemcpyToSymbol
  0.00%  27.706us         1  27.706us  27.706us  27.706us  cuDeviceGetName
  0.00%  16.179us         2  8.0890us  6.6500us  9.5290us  cudaLaunch
  0.00%  2.1970us         3     732ns     258ns  1.2640us  cudaGetDevice
  0.00%  1.3390us         8     167ns     114ns     348ns  cudaSetupArgument
  0.00%  1.3110us         2     655ns     137ns  1.1740us  cuDeviceGetCount
  0.00%  1.1360us         2     568ns     346ns     790ns  cudaConfigureCall
  0.00%     592ns         2     296ns     223ns     369ns  cudaGetLastError
  0.00%     460ns         4     115ns      78ns     166ns  cudaGetDeviceCount
  0.00%     303ns         2     151ns     111ns     192ns  cuDeviceGet
