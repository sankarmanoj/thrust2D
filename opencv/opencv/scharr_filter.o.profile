==10274== NVPROF is profiling process 10274, command: ./scharr_filter.o
==10274== Profiling application: ./scharr_filter.o
==10274== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.79%  39.775us         2  19.887us  19.775us  20.000us  [CUDA memcpy DtoH]
 24.38%  25.664us         5  5.1320us     544ns  21.376us  [CUDA memcpy HtoD]
 18.39%  19.360us         2  9.6800us  9.4720us  9.8880us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 14.44%  15.200us         2  7.6000us  6.9120us  8.2880us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.99%  5.2480us         4  1.3120us     992ns  1.6000us  [CUDA memcpy DtoD]

==10274== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.60%  2.41527s         5  483.05ms  5.9480us  2.41468s  cudaMallocPitch
  0.22%  5.4547ms        90  60.608us     121ns  3.6484ms  cuDeviceGetAttribute
  0.06%  1.5062ms         1  1.5062ms  1.5062ms  1.5062ms  cuDeviceTotalMem
  0.04%  953.41us         5  190.68us  9.2530us  454.91us  cudaMalloc
  0.03%  675.11us         7  96.444us  12.876us  220.66us  cudaMemcpy2D
  0.02%  365.14us         9  40.570us  5.9910us  122.54us  cudaFree
  0.01%  324.77us         1  324.77us  324.77us  324.77us  cudaGetDeviceProperties
  0.01%  264.80us         4  66.200us  3.7850us  178.80us  cudaDeviceSynchronize
  0.00%  80.846us         4  20.211us  12.065us  27.476us  cudaMemcpyToSymbol
  0.00%  42.950us         4  10.737us  7.9190us  13.617us  cudaLaunch
  0.00%  42.110us         1  42.110us  42.110us  42.110us  cuDeviceGetName
  0.00%  4.2790us         5     855ns     433ns  1.3580us  cudaGetDevice
  0.00%  4.1220us        16     257ns     150ns     621ns  cudaSetupArgument
  0.00%  3.3880us         2  1.6940us     988ns  2.4000us  cuDeviceGetCount
  0.00%  2.5760us         4     644ns     355ns  1.0600us  cudaConfigureCall
  0.00%  1.3060us         4     326ns     257ns     380ns  cudaGetLastError
  0.00%     894ns         2     447ns     244ns     650ns  cuDeviceGet
  0.00%     689ns         4     172ns     131ns     242ns  cudaGetDeviceCount
