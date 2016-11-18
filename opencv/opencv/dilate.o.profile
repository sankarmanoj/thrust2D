==10288== NVPROF is profiling process 10288, command: ./dilate.o
==10288== Profiling application: ./dilate.o
==10288== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 34.51%  26.175us         2  13.087us  4.0320us  22.143us  [CUDA memcpy HtoD]
 27.55%  20.896us         1  20.896us  20.896us  20.896us  [CUDA memcpy DtoH]
 21.14%  16.032us         1  16.032us  16.032us  16.032us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__62_tmpxft_00003911_00000000_9_copy_make_border_compute_61_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
 16.79%  12.736us         1  12.736us  12.736us  12.736us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)

==10288== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 82.01%  2.45063s         3  816.88ms  8.8540us  2.44979s  cudaMallocPitch
 17.62%  526.57ms         2  263.29ms  26.578us  526.54ms  cudaLaunch
  0.16%  4.8507ms       264  18.373us     102ns  2.3102ms  cuDeviceGetAttribute
  0.09%  2.6376ms         3  879.21us  29.106us  2.5686ms  cuDeviceGetName
  0.04%  1.1196ms         3  373.21us  183.68us  731.04us  cuDeviceTotalMem
  0.03%  982.42us         2  491.21us  487.28us  495.14us  cudaMalloc
  0.03%  840.73us         2  420.36us  322.98us  517.75us  cudaGetDeviceProperties
  0.01%  284.17us         4  71.042us  6.1960us  134.62us  cudaFree
  0.01%  178.84us         3  59.612us  13.581us  114.86us  cudaMemcpy2D
  0.00%  63.293us         2  31.646us  10.813us  52.480us  cudaDeviceSynchronize
  0.00%  6.3620us         2  3.1810us  1.1360us  5.2260us  cudaConfigureCall
  0.00%  4.5480us         9     505ns     181ns  2.1370us  cudaSetupArgument
  0.00%  2.9780us         3     992ns     432ns  1.3740us  cudaGetDevice
  0.00%  2.6870us         4     671ns     266ns  1.5460us  cuDeviceGetCount
  0.00%  1.4070us         2     703ns     513ns     894ns  cuInit
  0.00%  1.1540us         2     577ns     537ns     617ns  cudaGetLastError
  0.00%     826ns         4     206ns     146ns     238ns  cuDeviceGet
  0.00%     760ns         2     380ns     330ns     430ns  cuDriverGetVersion
  0.00%     658ns         4     164ns     150ns     197ns  cudaGetDeviceCount
