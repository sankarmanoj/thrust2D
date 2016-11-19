==7354== NVPROF is profiling process 7354, command: ./dilate.o
==7354== Profiling application: ./dilate.o
==7354== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 29.34%  23.648us         2  11.824us  2.5280us  21.120us  [CUDA memcpy HtoD]
 25.96%  20.928us         1  20.928us  20.928us  20.928us  [CUDA memcpy DtoH]
 25.13%  20.256us         1  20.256us  20.256us  20.256us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 19.57%  15.776us         1  15.776us  15.776us  15.776us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__62_tmpxft_00003911_00000000_9_copy_make_border_compute_61_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)

==7354== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 69.38%  1.17002s         3  390.01ms  5.5130us  1.16963s  cudaMallocPitch
 30.04%  506.67ms         2  253.33ms  21.571us  506.65ms  cudaLaunch
  0.39%  6.6081ms       264  25.030us     101ns  3.9846ms  cuDeviceGetAttribute
  0.06%  942.41us         2  471.21us  413.17us  529.24us  cudaMalloc
  0.04%  663.80us         3  221.27us  182.15us  297.53us  cuDeviceTotalMem
  0.03%  550.34us         2  275.17us  257.54us  292.80us  cudaGetDeviceProperties
  0.03%  469.11us         3  156.37us  26.068us  412.50us  cuDeviceGetName
  0.02%  275.82us         4  68.956us  6.5410us  127.06us  cudaFree
  0.01%  124.33us         3  41.442us  14.806us  66.491us  cudaMemcpy2D
  0.00%  37.464us         2  18.732us  17.784us  19.680us  cudaDeviceSynchronize
  0.00%  4.8090us         2  2.4040us     909ns  3.9000us  cudaConfigureCall
  0.00%  2.8390us         9     315ns     118ns  1.1170us  cudaSetupArgument
  0.00%  2.6750us         3     891ns     552ns  1.2990us  cudaGetDevice
  0.00%  2.3060us         4     576ns     151ns  1.4470us  cuDeviceGetCount
  0.00%     948ns         2     474ns     367ns     581ns  cudaGetLastError
  0.00%     774ns         2     387ns     236ns     538ns  cuInit
  0.00%     719ns         4     179ns     108ns     246ns  cuDeviceGet
  0.00%     649ns         4     162ns      98ns     239ns  cudaGetDeviceCount
  0.00%     511ns         2     255ns     180ns     331ns  cuDriverGetVersion
