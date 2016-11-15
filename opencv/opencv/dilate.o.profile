==14457== NVPROF is profiling process 14457, command: ./dilate.o 128
==14457== Profiling application: ./dilate.o 128
==14457== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 69.17%  19.104us         1  19.104us  19.104us  19.104us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 12.86%  3.5530us         1  3.5530us  3.5530us  3.5530us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__63_tmpxft_00002814_00000000_11_copy_make_border_compute_35_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
 12.86%  3.5520us         2  1.7760us  1.3120us  2.2400us  [CUDA memcpy HtoD]
  5.10%  1.4090us         1  1.4090us  1.4090us  1.4090us  [CUDA memcpy DtoH]

==14457== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 71.49%  830.13ms         3  276.71ms  5.2440us  829.96ms  cudaMallocPitch
 28.35%  329.16ms         2  164.58ms  22.815us  329.14ms  cudaLaunch
  0.04%  513.41us         3  171.14us  150.32us  208.99us  cuDeviceTotalMem
  0.04%  426.85us       265  1.6100us      95ns  62.941us  cuDeviceGetAttribute
  0.03%  350.85us         2  175.42us  172.60us  178.25us  cudaMalloc
  0.02%  265.61us         2  132.81us  126.00us  139.61us  cudaGetDeviceProperties
  0.02%  183.45us         4  45.861us  5.6640us  95.372us  cudaFree
  0.01%  58.226us         3  19.408us  15.663us  23.102us  cuDeviceGetName
  0.00%  48.915us         3  16.305us  9.6270us  20.429us  cudaMemcpy2D
  0.00%  26.008us         2  13.004us  4.1020us  21.906us  cudaDeviceSynchronize
  0.00%  4.1920us         2  2.0960us     792ns  3.4000us  cudaConfigureCall
  0.00%  2.6410us         9     293ns     124ns  1.1040us  cudaSetupArgument
  0.00%  1.9330us         5     386ns      98ns  1.3530us  cuDeviceGetCount
  0.00%  1.7920us         3     597ns     232ns     896ns  cudaGetDevice
  0.00%     960ns         2     480ns     380ns     580ns  cudaGetLastError
  0.00%     947ns         5     189ns     100ns     307ns  cuDeviceGet
  0.00%     878ns         2     439ns     247ns     631ns  cuInit
  0.00%     492ns         2     246ns     163ns     329ns  cuDriverGetVersion
  0.00%     448ns         4     112ns      78ns     174ns  cudaGetDeviceCount
