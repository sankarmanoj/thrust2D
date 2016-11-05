==7546== NVPROF is profiling process 7546, command: ./blend.o
==7546== Profiling application: ./blend.o
==7546== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 61.32%  43.302us         2  21.651us  20.979us  22.323us  [CUDA memcpy HtoD]
 27.39%  19.345us         1  19.345us  19.345us  19.345us  [CUDA memcpy DtoH]
 11.29%  7.9750us         1  7.9750us  7.9750us  7.9750us  void cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float>, cv::cudev::WithOutMask>(cv::cudev::GlobPtr<unsigned char>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, unsigned char, unsigned char, int, int)

==7546== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.33%  897.52ms         3  299.17ms  8.7850us  897.49ms  cudaMallocPitch
  1.63%  15.048ms         1  15.048ms  15.048ms  15.048ms  cudaGetDeviceProperties
  0.53%  4.9294ms         1  4.9294ms  4.9294ms  4.9294ms  cudaMalloc
  0.27%  2.4534ms        90  27.259us     117ns  1.1342ms  cuDeviceGetAttribute
  0.15%  1.3916ms         3  463.88us  4.3710us  1.3621ms  cudaFree
  0.03%  253.22us         3  84.405us  52.011us  147.41us  cudaMemcpy2D
  0.03%  239.14us         1  239.14us  239.14us  239.14us  cuDeviceTotalMem
  0.02%  213.52us         1  213.52us  213.52us  213.52us  cuDeviceGetName
  0.00%  45.344us         1  45.344us  45.344us  45.344us  cudaDeviceSynchronize
  0.00%  31.013us         1  31.013us  31.013us  31.013us  cudaLaunch
  0.00%  3.3540us         2  1.6770us  1.0230us  2.3310us  cuDeviceGetCount
  0.00%  2.0110us         7     287ns     180ns     536ns  cudaSetupArgument
  0.00%  1.8360us         2     918ns     541ns  1.2950us  cudaGetDevice
  0.00%  1.6360us         1  1.6360us  1.6360us  1.6360us  cudaConfigureCall
  0.00%     951ns         4     237ns     175ns     370ns  cudaGetDeviceCount
  0.00%     950ns         2     475ns     182ns     768ns  cuDeviceGet
  0.00%     409ns         1     409ns     409ns     409ns  cudaGetLastError
