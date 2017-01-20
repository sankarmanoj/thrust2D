==6143== NVPROF is profiling process 6143, command: ./blend.o
==6143== Profiling application: ./blend.o
==6143== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.19%  80.644us         2  40.322us  40.066us  40.578us  [CUDA memcpy HtoD]
 30.77%  39.266us         1  39.266us  39.266us  39.266us  [CUDA memcpy DtoH]
  6.04%  7.7120us         1  7.7120us  7.7120us  7.7120us  void cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__59_tmpxft_00002802_00000000_11_add_weighted_compute_35_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float>, cv::cudev::WithOutMask>(cv::cudev::GlobPtr<unsigned char>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__59_tmpxft_00002802_00000000_11_add_weighted_compute_35_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__59_tmpxft_00002802_00000000_11_add_weighted_compute_35_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, unsigned char, unsigned char, int, int)

==6143== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.99%  10.2228s         3  3.40761s  4.6660us  10.2228s  cudaMallocPitch
  0.00%  333.98us         1  333.98us  333.98us  333.98us  cudaMalloc
  0.00%  258.97us         3  86.323us  59.036us  103.60us  cudaMemcpy2D
  0.00%  254.65us        90  2.8290us     177ns  96.284us  cuDeviceGetAttribute
  0.00%  184.28us         1  184.28us  184.28us  184.28us  cuDeviceTotalMem
  0.00%  173.71us         1  173.71us  173.71us  173.71us  cudaGetDeviceProperties
  0.00%  94.995us         3  31.665us  4.2570us  80.203us  cudaFree
  0.00%  25.341us         1  25.341us  25.341us  25.341us  cuDeviceGetName
  0.00%  22.619us         1  22.619us  22.619us  22.619us  cudaLaunch
  0.00%  9.8390us         1  9.8390us  9.8390us  9.8390us  cudaDeviceSynchronize
  0.00%  2.2980us         2  1.1490us     637ns  1.6610us  cuDeviceGetCount
  0.00%  1.9150us         2     957ns     328ns  1.5870us  cudaGetDevice
  0.00%  1.5250us         7     217ns     131ns     504ns  cudaSetupArgument
  0.00%  1.0230us         1  1.0230us  1.0230us  1.0230us  cudaConfigureCall
  0.00%     620ns         2     310ns     243ns     377ns  cuDeviceGet
  0.00%     525ns         4     131ns      95ns     190ns  cudaGetDeviceCount
  0.00%     464ns         1     464ns     464ns     464ns  cudaGetLastError
