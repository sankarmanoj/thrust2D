==11853== NVPROF is profiling process 11853, command: ./blend.o
==11853== Profiling application: ./blend.o
==11853== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 62.49%  43.404us         2  21.702us  21.286us  22.118us  [CUDA memcpy HtoD]
 31.47%  21.862us         1  21.862us  21.862us  21.862us  [CUDA memcpy DtoH]
  6.04%  4.1930us         1  4.1930us  4.1930us  4.1930us  void cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float>, cv::cudev::WithOutMask>(cv::cudev::GlobPtr<unsigned char>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, unsigned char, unsigned char, int, int)

==11853== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.33%  1.07783s         3  359.28ms  5.1820us  1.07782s  cudaMallocPitch
  0.41%  4.4578ms        90  49.531us     100ns  2.9818ms  cuDeviceGetAttribute
  0.09%  1.0129ms         1  1.0129ms  1.0129ms  1.0129ms  cuDeviceGetName
  0.04%  487.52us         1  487.52us  487.52us  487.52us  cuDeviceTotalMem
  0.04%  390.75us         3  130.25us  41.627us  256.36us  cudaMemcpy2D
  0.03%  376.95us         1  376.95us  376.95us  376.95us  cudaMalloc
  0.03%  275.65us         1  275.65us  275.65us  275.65us  cudaGetDeviceProperties
  0.01%  141.14us         3  47.047us  6.1960us  123.82us  cudaFree
  0.01%  95.048us         1  95.048us  95.048us  95.048us  cudaDeviceSynchronize
  0.00%  29.949us         1  29.949us  29.949us  29.949us  cudaLaunch
  0.00%  2.0560us         7     293ns     194ns     569ns  cudaSetupArgument
  0.00%  1.9660us         1  1.9660us  1.9660us  1.9660us  cudaConfigureCall
  0.00%  1.4760us         2     738ns     356ns  1.1200us  cuDeviceGetCount
  0.00%  1.3560us         2     678ns     248ns  1.1080us  cudaGetDevice
  0.00%     523ns         4     130ns      78ns     191ns  cudaGetDeviceCount
  0.00%     379ns         2     189ns     162ns     217ns  cuDeviceGet
  0.00%     348ns         1     348ns     348ns     348ns  cudaGetLastError
