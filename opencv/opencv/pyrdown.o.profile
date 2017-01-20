==5056== NVPROF is profiling process 5056, command: ./pyrdown.o
==5056== Profiling application: ./pyrdown.o
==5056== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.79%  40.159us         1  40.159us  40.159us  40.159us  [CUDA memcpy HtoD]
 33.26%  24.831us         1  24.831us  24.831us  24.831us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
 12.95%  9.6640us         1  9.6640us  9.6640us  9.6640us  [CUDA memcpy DtoH]

==5056== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.97%  6.80636s         2  3.40318s  5.8370us  6.80635s  cudaMallocPitch
  0.01%  536.75us         1  536.75us  536.75us  536.75us  cudaMalloc
  0.01%  511.05us         1  511.05us  511.05us  511.05us  cudaGetDeviceProperties
  0.01%  428.39us        90  4.7590us     132ns  172.67us  cuDeviceGetAttribute
  0.00%  169.72us         1  169.72us  169.72us  169.72us  cuDeviceTotalMem
  0.00%  134.56us         2  67.279us  64.400us  70.159us  cudaMemcpy2D
  0.00%  92.946us         2  46.473us  11.428us  81.518us  cudaFree
  0.00%  28.811us         1  28.811us  28.811us  28.811us  cuDeviceGetName
  0.00%  26.802us         1  26.802us  26.802us  26.802us  cudaDeviceSynchronize
  0.00%  22.811us         1  22.811us  22.811us  22.811us  cudaLaunch
  0.00%  2.3730us         2  1.1860us     568ns  1.8050us  cuDeviceGetCount
  0.00%  1.4900us         2     745ns     309ns  1.1810us  cudaGetDevice
  0.00%     993ns         1     993ns     993ns     993ns  cudaConfigureCall
  0.00%     864ns         4     216ns     125ns     354ns  cudaSetupArgument
  0.00%     689ns         2     344ns     290ns     399ns  cuDeviceGet
  0.00%     559ns         1     559ns     559ns     559ns  cudaGetLastError
  0.00%     484ns         4     121ns      80ns     184ns  cudaGetDeviceCount
