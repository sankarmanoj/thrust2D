==11382== NVPROF is profiling process 11382, command: ./erode.o
==11382== Profiling application: ./erode.o
==11382== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.68%  6.1366ms         1  6.1366ms  6.1366ms  6.1366ms  void thrust::transform_kernel<unsigned char, erodeFunctor>(thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::device_malloc_allocator<thrust::window_iterator>, thrust::warp_launcher_config, erodeFunctor)
  0.68%  42.563us         4  10.640us     704ns  40.322us  [CUDA memcpy HtoD]
  0.64%  39.618us         1  39.618us  39.618us  39.618us  [CUDA memcpy DtoH]

==11382== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.88%  230.71ms         3  76.904ms  3.2840us  230.70ms  cudaMallocPitch
  2.64%  6.2939ms         2  3.1470ms  23.775us  6.2701ms  cudaMemcpy2D
  0.15%  368.39us         2  184.20us  181.45us  186.94us  cudaGetDeviceProperties
  0.14%  324.63us         3  108.21us  3.4620us  317.33us  cudaMalloc
  0.09%  216.29us        90  2.4030us      95ns  84.444us  cuDeviceGetAttribute
  0.07%  162.83us         1  162.83us  162.83us  162.83us  cuDeviceTotalMem
  0.01%  30.067us         1  30.067us  30.067us  30.067us  cudaLaunch
  0.01%  20.081us         1  20.081us  20.081us  20.081us  cuDeviceGetName
  0.01%  18.493us         3  6.1640us  2.9330us  11.900us  cudaMemcpy
  0.00%  1.5220us         2     761ns     225ns  1.2970us  cuDeviceGetCount
  0.00%  1.2860us         1  1.2860us  1.2860us  1.2860us  cudaConfigureCall
  0.00%  1.0200us         4     255ns     138ns     371ns  cudaSetupArgument
  0.00%     426ns         2     213ns     133ns     293ns  cuDeviceGet
