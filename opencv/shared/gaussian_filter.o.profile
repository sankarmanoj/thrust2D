==6303== NVPROF is profiling process 6303, command: ./gaussian_filter.o
==6303== Profiling application: ./gaussian_filter.o
==6303== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.54%  88.665us         3  29.555us  1.2150us  85.978us  [CUDA memcpy HtoD]
 38.60%  82.394us         1  82.394us  82.394us  82.394us  [CUDA memcpy DtoH]
  8.42%  17.983us         2  8.9910us  8.8950us  9.0880us  [CUDA memcpy DtoA]
  4.35%  9.2790us         1  9.2790us  9.2790us  9.2790us  thrust::convolutionRowsKernel(float*, int, int)
  4.29%  9.1510us         1  9.1510us  9.1510us  9.1510us  thrust::convolutionColumnsKernel(float*, int, int)
  2.80%  5.9830us         1  5.9830us  5.9830us  5.9830us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6303== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.29%  354.04ms         3  118.01ms  1.1217ms  348.81ms  cudaMalloc
  1.02%  3.6877ms         1  3.6877ms  3.6877ms  3.6877ms  cudaMallocArray
  0.32%  1.1351ms         1  1.1351ms  1.1351ms  1.1351ms  cudaFree
  0.09%  319.85us        90  3.5530us     123ns  119.03us  cuDeviceGetAttribute
  0.07%  266.81us         1  266.81us  266.81us  266.81us  cudaGetDeviceProperties
  0.06%  225.00us         2  112.50us  24.839us  200.16us  cudaMemcpy
  0.06%  199.90us         1  199.90us  199.90us  199.90us  cuDeviceTotalMem
  0.02%  73.139us         1  73.139us  73.139us  73.139us  cudaMemcpyAsync
  0.02%  71.878us         3  23.959us  16.549us  32.869us  cudaLaunch
  0.02%  55.110us         2  27.555us  9.3760us  45.734us  cudaMemcpyToArray
  0.01%  36.030us         1  36.030us  36.030us  36.030us  cuDeviceGetName
  0.01%  31.783us         1  31.783us  31.783us  31.783us  cudaMemcpyToSymbol
  0.00%  11.567us         4  2.8910us  1.7400us  5.8840us  cudaFuncGetAttributes
  0.00%  5.1320us         2  2.5660us  1.4330us  3.6990us  cudaBindTextureToArray
  0.00%  4.0820us        11     371ns     244ns     925ns  cudaDeviceGetAttribute
  0.00%  3.3080us         2  1.6540us     488ns  2.8200us  cuDeviceGetCount
  0.00%  2.8730us         3     957ns     321ns  2.1860us  cudaGetDevice
  0.00%  2.0830us         2  1.0410us     895ns  1.1880us  cudaUnbindTexture
  0.00%  2.0380us         3     679ns     209ns  1.0920us  cudaConfigureCall
  0.00%  1.9940us         1  1.9940us  1.9940us  1.9940us  cudaEventCreateWithFlags
  0.00%  1.6120us         2     806ns     493ns  1.1190us  cudaGetChannelDesc
  0.00%  1.5780us         7     225ns     118ns     514ns  cudaSetupArgument
  0.00%  1.4560us         1  1.4560us  1.4560us  1.4560us  cudaEventRecord
  0.00%  1.0780us         1  1.0780us  1.0780us  1.0780us  cudaEventDestroy
  0.00%     686ns         2     343ns     170ns     516ns  cuDeviceGet
  0.00%     157ns         1     157ns     157ns     157ns  cudaCreateChannelDesc
