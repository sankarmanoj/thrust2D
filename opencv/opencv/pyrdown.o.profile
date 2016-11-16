==10256== NVPROF is profiling process 10256, command: ./pyrdown.o
==10256== Profiling application: ./pyrdown.o
==10256== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.27%  20.928us         1  20.928us  20.928us  20.928us  [CUDA memcpy HtoD]
 36.74%  15.295us         1  15.295us  15.295us  15.295us  void cv::cuda::device::imgproc::pyrDown<unsigned char, cv::cuda::device::BrdReflect101<unsigned char>>(cv::cuda::PtrStepSz<unsigned char>, cv::cuda::PtrStep<cv::cuda::PtrStepSz>, unsigned char, int)
 12.99%  5.4080us         1  5.4080us  5.4080us  5.4080us  [CUDA memcpy DtoH]

==10256== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.44%  930.19ms         2  465.09ms  18.543us  930.17ms  cudaMallocPitch
  1.11%  10.642ms         1  10.642ms  10.642ms  10.642ms  cudaGetDeviceProperties
  0.85%  8.1297ms        90  90.330us     105ns  3.5534ms  cuDeviceGetAttribute
  0.21%  2.0515ms         1  2.0515ms  2.0515ms  2.0515ms  cudaMalloc
  0.21%  2.0477ms         2  1.0239ms  491.22us  1.5565ms  cudaFree
  0.11%  1.0767ms         1  1.0767ms  1.0767ms  1.0767ms  cuDeviceTotalMem
  0.02%  179.88us         2  89.940us  47.595us  132.29us  cudaMemcpy2D
  0.02%  168.24us         1  168.24us  168.24us  168.24us  cuDeviceGetName
  0.01%  71.795us         1  71.795us  71.795us  71.795us  cudaDeviceSynchronize
  0.00%  29.801us         1  29.801us  29.801us  29.801us  cudaLaunch
  0.00%  1.8950us         2     947ns     243ns  1.6520us  cuDeviceGetCount
  0.00%  1.5560us         2     778ns     433ns  1.1230us  cudaGetDevice
  0.00%  1.4930us         4     373ns     224ns     560ns  cudaSetupArgument
  0.00%  1.3770us         1  1.3770us  1.3770us  1.3770us  cudaConfigureCall
  0.00%     826ns         4     206ns     141ns     290ns  cudaGetDeviceCount
  0.00%     499ns         1     499ns     499ns     499ns  cudaGetLastError
  0.00%     428ns         2     214ns     125ns     303ns  cuDeviceGet
