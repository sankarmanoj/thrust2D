==13745== NVPROF is profiling process 13745, command: ./blend.o
==13745== Profiling application: ./blend.o
==13745== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.56%  59.841us         2  29.920us  29.312us  30.529us  [CUDA memcpy HtoD]
 37.49%  38.977us         1  38.977us  38.977us  38.977us  [CUDA memcpy DtoH]
  4.96%  5.1520us         1  5.1520us  5.1520us  5.1520us  void cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__59_tmpxft_00002802_00000000_11_add_weighted_compute_35_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float>, cv::cudev::WithOutMask>(cv::cudev::GlobPtr<unsigned char>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__59_tmpxft_00002802_00000000_11_add_weighted_compute_35_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__59_tmpxft_00002802_00000000_11_add_weighted_compute_35_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, unsigned char, unsigned char, int, int)

==13745== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.85%  16.6715s         3  5.55717s  15.137us  16.6715s  cudaMallocPitch
  0.12%  20.611ms        90  229.01us     104ns  11.294ms  cuDeviceGetAttribute
  0.01%  1.2525ms         1  1.2525ms  1.2525ms  1.2525ms  cuDeviceTotalMem
  0.00%  813.30us         3  271.10us  5.8700us  792.08us  cudaFree
  0.00%  725.89us         1  725.89us  725.89us  725.89us  cuDeviceGetName
  0.00%  547.57us         1  547.57us  547.57us  547.57us  cudaMalloc
  0.00%  347.40us         3  115.80us  95.539us  150.30us  cudaMemcpy2D
  0.00%  284.96us         1  284.96us  284.96us  284.96us  cudaGetDeviceProperties
  0.00%  44.410us         1  44.410us  44.410us  44.410us  cudaLaunch
  0.00%  11.517us         1  11.517us  11.517us  11.517us  cudaDeviceSynchronize
  0.00%  2.5750us         2  1.2870us     423ns  2.1520us  cuDeviceGetCount
  0.00%  2.3630us         2  1.1810us     490ns  1.8730us  cudaGetDevice
  0.00%  2.1140us         7     302ns     210ns     602ns  cudaSetupArgument
  0.00%  1.8640us         1  1.8640us  1.8640us  1.8640us  cudaConfigureCall
  0.00%     987ns         4     246ns     143ns     380ns  cudaGetDeviceCount
  0.00%     615ns         2     307ns     221ns     394ns  cuDeviceGet
  0.00%     517ns         1     517ns     517ns     517ns  cudaGetLastError
