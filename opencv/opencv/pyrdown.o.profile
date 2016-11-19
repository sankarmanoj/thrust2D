==7346== NVPROF is profiling process 7346, command: ./pyrdown.o
==7346== Profiling application: ./pyrdown.o
==7346== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.56%  21.184us         1  21.184us  21.184us  21.184us  [CUDA memcpy HtoD]
 39.51%  17.600us         1  17.600us  17.600us  17.600us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
 12.93%  5.7600us         1  5.7600us  5.7600us  5.7600us  [CUDA memcpy DtoH]

==7346== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.58%  504.20ms         2  252.10ms  5.5560us  504.19ms  cudaMallocPitch
  1.04%  5.3262ms        90  59.180us     100ns  2.9739ms  cuDeviceGetAttribute
  0.12%  620.59us         1  620.59us  620.59us  620.59us  cuDeviceTotalMem
  0.07%  378.96us         1  378.96us  378.96us  378.96us  cudaMalloc
  0.05%  258.22us         1  258.22us  258.22us  258.22us  cudaGetDeviceProperties
  0.04%  195.44us         2  97.721us  37.944us  157.50us  cudaMemcpy2D
  0.03%  174.13us         1  174.13us  174.13us  174.13us  cuDeviceGetName
  0.03%  154.25us         1  154.25us  154.25us  154.25us  cudaDeviceSynchronize
  0.02%  104.19us         2  52.092us  9.9990us  94.186us  cudaFree
  0.00%  19.927us         1  19.927us  19.927us  19.927us  cudaLaunch
  0.00%  2.3960us         2  1.1980us     633ns  1.7630us  cuDeviceGetCount
  0.00%  1.2430us         2     621ns     288ns     955ns  cudaGetDevice
  0.00%     860ns         4     215ns     135ns     320ns  cudaSetupArgument
  0.00%     702ns         1     702ns     702ns     702ns  cudaConfigureCall
  0.00%     667ns         2     333ns     239ns     428ns  cuDeviceGet
  0.00%     442ns         4     110ns      86ns     153ns  cudaGetDeviceCount
  0.00%     323ns         1     323ns     323ns     323ns  cudaGetLastError
