==11739== NVPROF is profiling process 11739, command: ./dilate.o
==11739== Profiling application: ./dilate.o
==11739== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 29.63%  24.007us         2  12.003us  2.5290us  21.478us  [CUDA memcpy HtoD]
 25.96%  21.030us         1  21.030us  21.030us  21.030us  [CUDA memcpy DtoH]
 24.85%  20.133us         1  20.133us  20.133us  20.133us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 19.56%  15.844us         1  15.844us  15.844us  15.844us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__62_tmpxft_00003911_00000000_9_copy_make_border_compute_61_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)

==11739== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 78.26%  2.43331s         3  811.10ms  5.6740us  2.43259s  cudaMallocPitch
 21.04%  654.07ms         2  327.04ms  19.210us  654.05ms  cudaLaunch
  0.39%  12.228ms       264  46.317us     100ns  5.2524ms  cuDeviceGetAttribute
  0.15%  4.7460ms         4  1.1865ms  9.9410us  3.9600ms  cudaFree
  0.09%  2.7624ms         3  920.78us  163.61us  2.4187ms  cuDeviceTotalMem
  0.02%  769.37us         2  384.69us  369.67us  399.70us  cudaMalloc
  0.02%  739.06us         2  369.53us  226.65us  512.42us  cudaGetDeviceProperties
  0.01%  373.13us         3  124.38us  20.449us  320.35us  cuDeviceGetName
  0.01%  166.30us         3  55.434us  10.169us  117.78us  cudaMemcpy2D
  0.00%  65.021us         2  32.510us  16.898us  48.123us  cudaDeviceSynchronize
  0.00%  5.2680us         2  2.6340us  1.0710us  4.1970us  cudaConfigureCall
  0.00%  5.2640us         3  1.7540us     464ns  3.7120us  cudaGetDevice
  0.00%  2.9040us         9     322ns     115ns  1.2410us  cudaSetupArgument
  0.00%  2.1630us         4     540ns     160ns  1.5410us  cuDeviceGetCount
  0.00%  1.2540us         2     627ns     402ns     852ns  cudaGetLastError
  0.00%  1.1350us         2     567ns     565ns     570ns  cuInit
  0.00%     718ns         4     179ns     125ns     305ns  cuDeviceGet
  0.00%     495ns         4     123ns      99ns     142ns  cudaGetDeviceCount
  0.00%     439ns         2     219ns     163ns     276ns  cuDriverGetVersion
