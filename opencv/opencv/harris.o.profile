==7545== NVPROF is profiling process 7545, command: ./harris.o
==7545== Profiling application: ./harris.o
==7545== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.18%  282.70us         1  282.70us  282.70us  282.70us  void cv::cuda::device::imgproc::cornerHarris_kernel<cv::cuda::device::BrdRowReflect101<void>, cv::cuda::device::BrdColReflect101<void>>(int, float, cv::cuda::PtrStepSz<float>, void, cv::cuda::device::BrdRowReflect101<void>)
 20.00%  100.63us         6  16.771us     544ns  76.257us  [CUDA memcpy HtoD]
 14.92%  75.072us         1  75.072us  75.072us  75.072us  [CUDA memcpy DtoH]
  4.63%  23.316us         2  11.658us  10.249us  13.067us  void column_filter::linearColumnFilter<int=5, float, float, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<float>, int, float)
  3.30%  16.621us         2  8.3100us  7.9100us  8.7110us  void row_filter::linearRowFilter<int=5, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  0.96%  4.8350us         4  1.2080us     864ns  1.6010us  [CUDA memcpy DtoD]

==7545== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.14%  3.14846s         6  524.74ms  5.8850us  3.14574s  cudaMallocPitch
  0.45%  14.225ms        90  158.06us     103ns  5.4890ms  cuDeviceGetAttribute
  0.19%  5.9948ms         1  5.9948ms  5.9948ms  5.9948ms  cudaGetDeviceProperties
  0.08%  2.5954ms         5  519.09us  8.4710us  1.7121ms  cudaMalloc
  0.07%  2.3463ms         1  2.3463ms  2.3463ms  2.3463ms  cuDeviceGetName
  0.02%  612.49us         5  122.50us  24.794us  309.69us  cudaDeviceSynchronize
  0.02%  515.42us         7  73.631us  15.965us  208.98us  cudaMemcpy2D
  0.01%  358.41us         1  358.41us  358.41us  358.41us  cuDeviceTotalMem
  0.01%  357.37us        10  35.736us  5.0700us  113.73us  cudaFree
  0.00%  111.62us         4  27.905us  10.419us  62.354us  cudaMemcpyToSymbol
  0.00%  75.602us         5  15.120us  5.7020us  30.336us  cudaLaunch
  0.00%  5.0690us         2  2.5340us  1.0150us  4.0540us  cudaBindTexture2D
  0.00%  3.9920us         4     998ns     492ns  1.2820us  cudaGetDevice
  0.00%  3.9490us        21     188ns     113ns     653ns  cudaSetupArgument
  0.00%  2.9500us         5     590ns     142ns  1.5940us  cudaConfigureCall
  0.00%  2.1090us         2  1.0540us     511ns  1.5980us  cuDeviceGetCount
  0.00%  1.3570us         5     271ns     182ns     374ns  cudaGetLastError
  0.00%     648ns         4     162ns     100ns     248ns  cudaGetDeviceCount
  0.00%     548ns         2     274ns     212ns     336ns  cuDeviceGet
  0.00%     224ns         2     112ns      82ns     142ns  cudaCreateChannelDesc
