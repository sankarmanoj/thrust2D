==4392== NVPROF is profiling process 4392, command: ./scharr_filter.o
==4392== Profiling application: ./scharr_filter.o
==4392== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.11%  48.487us         2  24.243us  24.131us  24.356us  [CUDA memcpy DtoH]
 26.82%  35.044us         5  7.0080us     544ns  32.644us  [CUDA memcpy HtoD]
 17.39%  22.723us         2  11.361us  11.297us  11.426us  void column_filter::linearColumnFilter<int=3, float, unsigned char, cv::cuda::device::BrdColReflect101<float>>(cv::cuda::PtrStepSz<float>, cv::cuda::PtrStep<unsigned char>, int, float)
 14.43%  18.851us         2  9.4250us  8.2250us  10.626us  void row_filter::linearRowFilter<int=3, unsigned char, float, cv::cuda::device::BrdRowReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<float>, int, unsigned char)
  4.26%  5.5680us         4  1.3920us  1.0240us  2.3680us  [CUDA memcpy DtoD]

==4392== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
100.00%  99.7018s         5  19.9404s  3.0810us  99.7016s  cudaMallocPitch
  0.00%  509.31us         5  101.86us  5.2800us  272.25us  cudaMalloc
  0.00%  357.06us         7  51.008us  3.3290us  107.12us  cudaMemcpy2D
  0.00%  211.51us         9  23.501us  3.5950us  87.559us  cudaFree
  0.00%  173.18us        90  1.9240us      95ns  58.960us  cuDeviceGetAttribute
  0.00%  171.58us         1  171.58us  171.58us  171.58us  cuDeviceTotalMem
  0.00%  151.86us         1  151.86us  151.86us  151.86us  cudaGetDeviceProperties
  0.00%  57.781us         4  14.445us  7.2130us  26.206us  cudaMemcpyToSymbol
  0.00%  36.106us         4  9.0260us  3.7750us  14.322us  cudaDeviceSynchronize
  0.00%  30.408us         4  7.6020us  4.9060us  11.161us  cudaLaunch
  0.00%  26.848us         1  26.848us  26.848us  26.848us  cuDeviceGetName
  0.00%  3.0160us         5     603ns     229ns  1.2460us  cudaGetDevice
  0.00%  2.9650us         2  1.4820us     595ns  2.3700us  cuDeviceGetCount
  0.00%  2.4670us        16     154ns     113ns     384ns  cudaSetupArgument
  0.00%  2.0690us         4     517ns     297ns     993ns  cudaConfigureCall
  0.00%  1.2750us         4     318ns     216ns     501ns  cudaGetLastError
  0.00%     507ns         4     126ns      85ns     203ns  cudaGetDeviceCount
  0.00%     345ns         2     172ns     138ns     207ns  cuDeviceGet
