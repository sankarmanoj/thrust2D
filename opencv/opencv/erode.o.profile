==10259== NVPROF is profiling process 10259, command: ./erode.o
==10259== Profiling application: ./erode.o
==10259== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 29.84%  23.519us         2  11.759us  2.5280us  20.991us  [CUDA memcpy HtoD]
 25.01%  19.712us         1  19.712us  19.712us  19.712us  [CUDA memcpy DtoH]
 21.32%  16.800us         1  16.800us  16.800us  16.800us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, ErodeReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 18.31%  14.431us         1  14.431us  14.431us  14.431us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__62_tmpxft_00003911_00000000_9_copy_make_border_compute_61_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
  5.52%  4.3520us         1  4.3520us  4.3520us  4.3520us  void ForEachPixelNaive<unsigned char, int=1, ErodeReplicateBorderNewFunctor<unsigned char, int=1>>(Image<unsigned char, int=1>, NppiSize, unsigned char)

==10259== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 62.16%  2.24292s         3  747.64ms  4.9020us  2.24291s  cudaMallocPitch
 37.73%  1.36120s         3  453.73ms  10.598us  1.36117s  cudaLaunch
  0.02%  808.31us       264  3.0610us      98ns  115.19us  cuDeviceGetAttribute
  0.02%  784.42us         3  261.47us  245.04us  282.56us  cudaGetDeviceProperties
  0.02%  687.28us         2  343.64us  342.15us  345.12us  cudaMalloc
  0.02%  587.45us         4  146.86us  10.104us  425.15us  cudaFree
  0.02%  553.74us         3  184.58us  175.37us  200.14us  cuDeviceTotalMem
  0.01%  188.90us         3  62.965us  10.527us  141.31us  cudaMemcpy2D
  0.00%  133.94us         2  66.968us  35.272us  98.664us  cudaDeviceSynchronize
  0.00%  101.28us         3  33.758us  25.961us  44.007us  cuDeviceGetName
  0.00%  62.332us         3  20.777us  12.552us  32.506us  cudaStreamCreate
  0.00%  7.2020us         6  1.2000us     280ns  4.0990us  cudaGetDevice
  0.00%  4.7910us         3  1.5970us     501ns  3.2400us  cudaConfigureCall
  0.00%  4.1960us        12     349ns     116ns  1.0720us  cudaSetupArgument
  0.00%  3.7050us         4     926ns     155ns  3.1620us  cuDeviceGetCount
  0.00%  1.8130us         3     604ns     369ns  1.0070us  cudaEventCreateWithFlags
  0.00%  1.5810us         1  1.5810us  1.5810us  1.5810us  cudaEventRecord
  0.00%  1.4640us         1  1.4640us  1.4640us  1.4640us  cudaStreamWaitEvent
  0.00%  1.3230us         4     330ns     156ns     850ns  cuDeviceGet
  0.00%  1.2230us         3     407ns     189ns     659ns  cudaGetLastError
  0.00%     789ns         2     394ns     256ns     533ns  cuInit
  0.00%     504ns         2     252ns     173ns     331ns  cuDriverGetVersion
  0.00%     487ns         4     121ns      76ns     164ns  cudaGetDeviceCount
