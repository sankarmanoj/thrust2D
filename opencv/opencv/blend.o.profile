==10316== NVPROF is profiling process 10316, command: ./blend.o
==10316== Profiling application: ./blend.o
==10316== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 61.83%  43.999us         2  21.999us  20.512us  23.487us  [CUDA memcpy HtoD]
 28.15%  20.032us         1  20.032us  20.032us  20.032us  [CUDA memcpy DtoH]
 10.03%  7.1360us         1  7.1360us  7.1360us  7.1360us  void cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float>, cv::cudev::WithOutMask>(cv::cudev::GlobPtr<unsigned char>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, cv::cudev::grid_transform_detail::transformSmart<int=4, unsigned char, unsigned char, unsigned char, _GLOBAL__N__58_tmpxft_00003916_00000000_9_add_weighted_compute_61_cpp1_ii_71482d89::AddWeightedOp<unsigned char, unsigned char, unsigned char, float, unsigned char>, cv::cudev::WithOutMask>, unsigned char, unsigned char, int, int)

==10316== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.06%  1.59533s         3  531.78ms  8.1890us  1.59531s  cudaMallocPitch
  0.75%  12.058ms        90  133.98us     120ns  5.6484ms  cuDeviceGetAttribute
  0.05%  830.34us         1  830.34us  830.34us  830.34us  cudaMalloc
  0.05%  791.99us         1  791.99us  791.99us  791.99us  cuDeviceGetName
  0.03%  471.50us         3  157.17us  62.889us  218.89us  cudaMemcpy2D
  0.03%  410.54us         1  410.54us  410.54us  410.54us  cuDeviceTotalMem
  0.02%  262.99us         1  262.99us  262.99us  262.99us  cudaGetDeviceProperties
  0.01%  180.49us         3  60.164us  7.0300us  146.12us  cudaFree
  0.01%  95.319us         1  95.319us  95.319us  95.319us  cudaDeviceSynchronize
  0.00%  44.614us         1  44.614us  44.614us  44.614us  cudaLaunch
  0.00%  4.1420us         7     591ns     154ns  2.6830us  cudaSetupArgument
  0.00%  3.9540us         2  1.9770us  1.5620us  2.3920us  cuDeviceGetCount
  0.00%  2.2810us         1  2.2810us  2.2810us  2.2810us  cudaConfigureCall
  0.00%  1.7070us         2     853ns     500ns  1.2070us  cudaGetDevice
  0.00%     951ns         2     475ns     374ns     577ns  cuDeviceGet
  0.00%     752ns         4     188ns     134ns     243ns  cudaGetDeviceCount
  0.00%     569ns         1     569ns     569ns     569ns  cudaGetLastError
