==11714== NVPROF is profiling process 11714, command: ./erode.o
==11714== Profiling application: ./erode.o
==11714== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 30.34%  24.998us         2  12.499us  2.5600us  22.438us  [CUDA memcpy HtoD]
 25.41%  20.934us         1  20.934us  20.934us  20.934us  [CUDA memcpy DtoH]
 24.36%  20.070us         1  20.070us  20.070us  20.070us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, ErodeReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 19.89%  16.389us         1  16.389us  16.389us  16.389us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__62_tmpxft_00003911_00000000_9_copy_make_border_compute_61_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)

==11714== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 75.89%  2.47264s         3  824.21ms  8.9530us  2.47219s  cudaMallocPitch
 23.76%  774.06ms         2  387.03ms  29.093us  774.03ms  cudaLaunch
  0.24%  7.9143ms       264  29.978us     102ns  3.3861ms  cuDeviceGetAttribute
  0.04%  1.2422ms         2  621.12us  529.19us  713.04us  cudaMalloc
  0.03%  883.07us         3  294.36us  187.90us  505.29us  cuDeviceTotalMem
  0.02%  540.32us         2  270.16us  236.36us  303.96us  cudaGetDeviceProperties
  0.01%  382.30us         3  127.43us  25.001us  325.73us  cuDeviceGetName
  0.01%  331.10us         4  82.775us  6.9370us  144.48us  cudaFree
  0.01%  185.44us         3  61.812us  17.041us  115.92us  cudaMemcpy2D
  0.00%  66.760us         2  33.380us  18.454us  48.306us  cudaDeviceSynchronize
  0.00%  10.350us         2  5.1750us  1.5390us  8.8110us  cudaConfigureCall
  0.00%  6.5390us         3  2.1790us     466ns  4.7150us  cudaGetDevice
  0.00%  4.0020us         9     444ns     184ns  1.7660us  cudaSetupArgument
  0.00%  2.2340us         4     558ns     209ns  1.4010us  cuDeviceGetCount
  0.00%  1.2420us         2     621ns     454ns     788ns  cudaGetLastError
  0.00%     980ns         2     490ns     361ns     619ns  cuInit
  0.00%     839ns         4     209ns     118ns     310ns  cuDeviceGet
  0.00%     733ns         2     366ns     272ns     461ns  cuDriverGetVersion
  0.00%     703ns         4     175ns     143ns     231ns  cudaGetDeviceCount
