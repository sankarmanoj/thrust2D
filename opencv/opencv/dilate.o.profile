==7699== NVPROF is profiling process 7699, command: ./dilate.o
==7699== Profiling application: ./dilate.o
==7699== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 30.34%  24.212us         2  12.106us  2.5620us  21.650us  [CUDA memcpy HtoD]
 24.56%  19.600us         1  19.600us  19.600us  19.600us  [CUDA memcpy DtoH]
 21.35%  17.038us         1  17.038us  17.038us  17.038us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 18.42%  14.700us         1  14.700us  14.700us  14.700us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__62_tmpxft_00003911_00000000_9_copy_make_border_compute_61_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
  5.34%  4.2600us         1  4.2600us  4.2600us  4.2600us  void ForEachPixelNaive<unsigned char, int=1, DilateReplicateBorderNewFunctor<unsigned char, int=1>>(Image<unsigned char, int=1>, NppiSize, unsigned char)

==7699== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 78.95%  2.71444s         3  904.81ms  6.6970us  2.71440s  cudaMallocPitch
 19.98%  687.13ms         3  229.04ms  11.510us  687.09ms  cudaLaunch
  0.57%  19.750ms       264  74.810us     101ns  3.4514ms  cuDeviceGetAttribute
  0.20%  6.9577ms         3  2.3192ms  285.77us  4.8527ms  cudaGetDeviceProperties
  0.10%  3.3725ms         3  1.1242ms  720.42us  1.4005ms  cuDeviceTotalMem
  0.10%  3.2951ms         3  1.0984ms  31.337us  3.1801ms  cuDeviceGetName
  0.08%  2.6677ms         2  1.3339ms  933.31us  1.7344ms  cudaMalloc
  0.01%  245.93us         4  61.481us  7.5220us  141.82us  cudaFree
  0.00%  171.80us         3  57.265us  17.641us  77.579us  cudaMemcpy2D
  0.00%  77.502us         2  38.751us  4.0400us  73.462us  cudaDeviceSynchronize
  0.00%  62.713us         3  20.904us  12.977us  33.962us  cudaStreamCreate
  0.00%  10.970us         6  1.8280us     282ns  7.2160us  cudaGetDevice
  0.00%  10.143us         3  3.3810us     602ns  8.2010us  cudaConfigureCall
  0.00%  4.9030us        12     408ns     127ns  2.5270us  cudaSetupArgument
  0.00%  3.4080us         4     852ns     254ns  1.5880us  cuDeviceGetCount
  0.00%  1.8840us         3     628ns     391ns  1.0580us  cudaEventCreateWithFlags
  0.00%  1.7110us         1  1.7110us  1.7110us  1.7110us  cudaEventRecord
  0.00%  1.6290us         1  1.6290us  1.6290us  1.6290us  cudaStreamWaitEvent
  0.00%  1.5160us         2     758ns     405ns  1.1110us  cuInit
  0.00%  1.3370us         4     334ns     152ns     506ns  cuDeviceGet
  0.00%  1.2510us         3     417ns     225ns     685ns  cudaGetLastError
  0.00%     857ns         2     428ns     247ns     610ns  cuDriverGetVersion
  0.00%     650ns         4     162ns      86ns     304ns  cudaGetDeviceCount
