==13704== NVPROF is profiling process 13704, command: ./erode.o
==13704== Profiling application: ./erode.o
==13704== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.19%  52.481us         2  26.240us  1.3120us  51.169us  [CUDA memcpy HtoD]
 21.16%  24.577us         1  24.577us  24.577us  24.577us  [CUDA memcpy DtoH]
 16.97%  19.712us         1  19.712us  19.712us  19.712us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, ErodeReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 16.67%  19.360us         1  19.360us  19.360us  19.360us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__63_tmpxft_00002814_00000000_11_copy_make_border_compute_35_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)

==13704== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.71%  38.5525s         3  12.8508s  6.5230us  38.5514s  cudaMallocPitch
  2.17%  854.44ms         2  427.22ms  31.087us  854.41ms  cudaLaunch
  0.06%  23.531ms       264  89.130us      96ns  9.1617ms  cuDeviceGetAttribute
  0.02%  8.6759ms         2  4.3380ms  4.1784ms  4.4976ms  cudaMalloc
  0.02%  7.9315ms         2  3.9657ms  1.4291ms  6.5024ms  cudaGetDeviceProperties
  0.01%  5.1749ms         4  1.2937ms  28.753us  4.4880ms  cudaFree
  0.00%  1.3208ms         3  440.28us  262.84us  685.49us  cuDeviceTotalMem
  0.00%  791.75us         3  263.92us  73.357us  592.42us  cuDeviceGetName
  0.00%  357.66us         3  119.22us  46.943us  191.95us  cudaMemcpy2D
  0.00%  58.437us         2  29.218us  11.793us  46.644us  cudaDeviceSynchronize
  0.00%  16.165us         2  8.0820us  1.7870us  14.378us  cudaConfigureCall
  0.00%  6.8650us         3  2.2880us     427ns  4.7010us  cudaGetDevice
  0.00%  4.7320us         9     525ns     111ns  2.8440us  cudaSetupArgument
  0.00%  2.5700us         4     642ns     240ns  1.2920us  cuDeviceGetCount
  0.00%  1.1890us         2     594ns     460ns     729ns  cudaGetLastError
  0.00%  1.0330us         2     516ns     494ns     539ns  cuInit
  0.00%  1.0100us         4     252ns     141ns     399ns  cuDeviceGet
  0.00%     767ns         4     191ns      85ns     290ns  cudaGetDeviceCount
  0.00%     701ns         2     350ns     301ns     400ns  cuDriverGetVersion
