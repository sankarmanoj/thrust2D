==9296== NVPROF is profiling process 9296, command: ./dilate.o
==9296== Profiling application: ./dilate.o
==9296== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 26.83%  22.688us         2  11.344us  1.3120us  21.376us  [CUDA memcpy HtoD]
 25.84%  21.856us         1  21.856us  21.856us  21.856us  void ForEachTupleByteQuad<unsigned char, int=1, TupleByteQuadFunctor<unsigned char, int=1, DilateReplicateBorderQuadNewFunctor<unsigned char, int=1>>>(Tuple8<unsigned char, int=1>*, int, NppiSize, unsigned char)
 24.21%  20.480us         1  20.480us  20.480us  20.480us  [CUDA memcpy DtoH]
 23.12%  19.552us         1  19.552us  19.552us  19.552us  void cv::cudev::grid_copy_detail::copy<cv::cudev::RemapPtr1<cv::cudev::BrdBase<cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>>, _GLOBAL__N__63_tmpxft_00002814_00000000_11_copy_make_border_compute_35_cpp1_ii_71482d89::ShiftMap>, unsigned char, cv::cudev::WithOutMask>(cv::cudev::BrdReflect101, cv::cudev::GlobPtr<unsigned char>, cv::cudev::GlobPtr<unsigned char>, int, int)

==9296== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 70.97%  823.10ms         3  274.37ms  6.9800us  822.91ms  cudaMallocPitch
 28.85%  334.62ms         2  167.31ms  23.277us  334.60ms  cudaLaunch
  0.04%  458.44us         3  152.81us  149.05us  159.18us  cuDeviceTotalMem
  0.04%  455.81us       265  1.7200us      95ns  71.167us  cuDeviceGetAttribute
  0.03%  404.52us         2  202.26us  192.65us  211.87us  cudaMalloc
  0.02%  266.68us         2  133.34us  125.80us  140.88us  cudaGetDeviceProperties
  0.02%  190.89us         3  63.630us  10.676us  109.20us  cudaMemcpy2D
  0.02%  181.62us         4  45.404us  5.7880us  93.960us  cudaFree
  0.00%  52.137us         3  17.379us  13.933us  19.874us  cuDeviceGetName
  0.00%  35.767us         2  17.883us  15.670us  20.097us  cudaDeviceSynchronize
  0.00%  5.3650us         3  1.7880us     238ns  3.7930us  cudaGetDevice
  0.00%  5.0430us         2  2.5210us     813ns  4.2300us  cudaConfigureCall
  0.00%  3.1150us         9     346ns     104ns  1.4590us  cudaSetupArgument
  0.00%  2.7730us         5     554ns      98ns  1.8200us  cuDeviceGetCount
  0.00%  1.4810us         5     296ns     140ns     752ns  cuDeviceGet
  0.00%  1.1680us         2     584ns     371ns     797ns  cudaGetLastError
  0.00%     868ns         2     434ns     275ns     593ns  cuInit
  0.00%     512ns         4     128ns      80ns     178ns  cudaGetDeviceCount
  0.00%     491ns         2     245ns     175ns     316ns  cuDriverGetVersion
