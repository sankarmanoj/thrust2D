==26829== NVPROF is profiling process 26829, command: ./pyrdown.o
==26829== Profiling application: ./pyrdown.o
==26829== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.87%  5.4080us         1  5.4080us  5.4080us  5.4080us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
 28.90%  2.4470us         1  2.4470us  2.4470us  2.4470us  [CUDA memcpy HtoD]
  7.23%     612ns         1     612ns     612ns     612ns  [CUDA memcpy DtoH]

==26829== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.57%  176.43ms         2  88.215ms  5.0740us  176.42ms  cudaMallocPitch
  0.10%  180.51us         1  180.51us  180.51us  180.51us  cudaMalloc
  0.09%  152.65us         1  152.65us  152.65us  152.65us  cuDeviceTotalMem
  0.09%  152.45us        90  1.6930us      99ns  57.584us  cuDeviceGetAttribute
  0.08%  140.17us         1  140.17us  140.17us  140.17us  cudaGetDeviceProperties
  0.04%  62.515us         2  31.257us  8.2810us  54.234us  cudaFree
  0.02%  31.823us         2  15.911us  12.786us  19.037us  cudaMemcpy2D
  0.01%  20.669us         1  20.669us  20.669us  20.669us  cudaLaunch
  0.01%  14.367us         1  14.367us  14.367us  14.367us  cuDeviceGetName
  0.00%  7.1010us         1  7.1010us  7.1010us  7.1010us  cudaDeviceSynchronize
  0.00%  1.6820us         2     841ns     245ns  1.4370us  cuDeviceGetCount
  0.00%  1.3300us         2     665ns     241ns  1.0890us  cudaGetDevice
  0.00%     898ns         4     224ns     132ns     376ns  cudaSetupArgument
  0.00%     830ns         1     830ns     830ns     830ns  cudaConfigureCall
  0.00%     590ns         4     147ns      82ns     210ns  cudaGetDeviceCount
  0.00%     437ns         2     218ns     144ns     293ns  cuDeviceGet
  0.00%     381ns         1     381ns     381ns     381ns  cudaGetLastError
