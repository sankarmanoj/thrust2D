==7567== NVPROF is profiling process 7567, command: ./erode.o
==7567== Profiling application: ./erode.o
==7567== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 30.40%  24.084us         2  12.042us  2.5300us  21.554us  [CUDA memcpy HtoD]
 24.78%  19.632us         1  19.632us  19.632us  19.632us  [CUDA memcpy DtoH]
 21.22%  16.814us         1  16.814us  16.814us  16.814us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, ErodeReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 18.19%  14.412us         1  14.412us  14.412us  14.412us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__62_tmpxft_00003911_00000000_9_copy_make_border_compute_61_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
  5.42%  4.2920us         1  4.2920us  4.2920us  4.2920us  void ForEachPixelNaive<unsigned char, int=1, ErodeReplicateBorderNewFunctor<unsigned char, int=1>>(Image<unsigned char, int=1>, NppiSize, unsigned char)

==7567== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.73%  2.38177s         3  793.92ms  6.6750us  2.38176s  cudaMallocPitch
 42.17%  1.73960s         3  579.87ms  11.614us  1.73956s  cudaLaunch
  0.03%  1.1242ms       264  4.2580us     100ns  157.33us  cuDeviceGetAttribute
  0.02%  818.32us         3  272.77us  248.25us  285.89us  cudaGetDeviceProperties
  0.02%  685.45us         2  342.73us  337.85us  347.60us  cudaMalloc
  0.02%  633.37us         3  211.12us  173.19us  283.92us  cuDeviceTotalMem
  0.01%  235.36us         2  117.68us  4.6970us  230.66us  cudaDeviceSynchronize
  0.01%  232.05us         3  77.349us  26.436us  175.85us  cuDeviceGetName
  0.01%  225.84us         4  56.460us  11.877us  120.65us  cudaFree
  0.00%  123.29us         3  41.096us  9.6780us  79.506us  cudaMemcpy2D
  0.00%  84.340us         3  28.113us  13.060us  51.311us  cudaStreamCreate
  0.00%  5.6120us         3  1.8700us     635ns  4.2280us  cudaConfigureCall
  0.00%  4.7510us         4  1.1870us     236ns  2.7270us  cuDeviceGetCount
  0.00%  3.9830us        12     331ns     118ns  1.5300us  cudaSetupArgument
  0.00%  3.9750us         6     662ns     271ns  1.1600us  cudaGetDevice
  0.00%  2.0260us         3     675ns     391ns  1.2050us  cudaEventCreateWithFlags
  0.00%  1.6980us         1  1.6980us  1.6980us  1.6980us  cudaEventRecord
  0.00%  1.5630us         1  1.5630us  1.5630us  1.5630us  cudaStreamWaitEvent
  0.00%  1.3790us         4     344ns     154ns     729ns  cuDeviceGet
  0.00%  1.1240us         3     374ns     191ns     624ns  cudaGetLastError
  0.00%     746ns         2     373ns     275ns     471ns  cuInit
  0.00%     649ns         4     162ns      80ns     269ns  cudaGetDeviceCount
  0.00%     487ns         2     243ns     185ns     302ns  cuDriverGetVersion
