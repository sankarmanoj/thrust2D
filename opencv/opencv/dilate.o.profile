==13812== NVPROF is profiling process 13812, command: ./dilate.o
==13812== Profiling application: ./dilate.o
==13812== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.06%  34.400us         2  17.200us  1.3120us  33.088us  [CUDA memcpy HtoD]
 24.95%  24.480us         1  24.480us  24.480us  24.480us  [CUDA memcpy DtoH]
 19.99%  19.616us         1  19.616us  19.616us  19.616us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__63_tmpxft_00002814_00000000_11_copy_make_border_compute_35_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)
 19.99%  19.616us         1  19.616us  19.616us  19.616us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)

==13812== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.17%  37.6319s         3  12.5440s  6.0320us  37.6316s  cudaMallocPitch
  2.77%  1.07382s         2  536.91ms  39.222us  1.07378s  cudaLaunch
  0.04%  16.326ms       264  61.842us      94ns  8.4674ms  cuDeviceGetAttribute
  0.01%  2.6672ms         3  889.07us  22.577us  2.6112ms  cuDeviceGetName
  0.00%  1.6856ms         3  561.86us  139.94us  1.4050ms  cuDeviceTotalMem
  0.00%  826.11us         2  413.06us  326.56us  499.55us  cudaMalloc
  0.00%  628.75us         4  157.19us  7.9860us  361.61us  cudaFree
  0.00%  425.79us         2  212.89us  203.84us  221.94us  cudaGetDeviceProperties
  0.00%  296.75us         3  98.916us  28.163us  177.68us  cudaMemcpy2D
  0.00%  95.667us         2  47.833us  35.718us  59.949us  cudaDeviceSynchronize
  0.00%  8.0070us         2  4.0030us  1.0370us  6.9700us  cudaConfigureCall
  0.00%  3.2970us         9     366ns     111ns  1.3770us  cudaSetupArgument
  0.00%  2.8430us         3     947ns     245ns  1.3030us  cudaGetDevice
  0.00%  2.7130us         4     678ns     141ns  1.9250us  cuDeviceGetCount
  0.00%  1.3470us         2     673ns     637ns     710ns  cudaGetLastError
  0.00%  1.0510us         2     525ns     476ns     575ns  cuInit
  0.00%     741ns         4     185ns     133ns     269ns  cuDeviceGet
  0.00%     599ns         2     299ns     284ns     315ns  cuDriverGetVersion
  0.00%     519ns         4     129ns      84ns     203ns  cudaGetDeviceCount
