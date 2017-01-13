==14916== NVPROF is profiling process 14916, command: ./gaussian_filter.o 1631
==14916== Profiling application: ./gaussian_filter.o 1631
==14916== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.55%  2.0647ms         1  2.0647ms  2.0647ms  2.0647ms  [CUDA memcpy DtoH]
 33.39%  1.5831ms         3  527.69us  1.4080us  1.5801ms  [CUDA memcpy HtoD]
 10.19%  482.98us         2  241.49us  234.82us  248.16us  [CUDA memcpy DtoA]
  5.96%  282.56us         1  282.56us  282.56us  282.56us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  5.56%  263.68us         1  263.68us  263.68us  263.68us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  1.34%  63.584us         1  63.584us  63.584us  63.584us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==14916== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.39%  289.12ms         3  96.373ms  500.89us  288.03ms  cudaMalloc
  1.24%  3.7083ms         2  1.8541ms  73.072us  3.6352ms  cudaMemcpy
  0.79%  2.3634ms         1  2.3634ms  2.3634ms  2.3634ms  cuDeviceTotalMem
  0.74%  2.2331ms         1  2.2331ms  2.2331ms  2.2331ms  cudaMemcpyAsync
  0.29%  862.01us         1  862.01us  862.01us  862.01us  cudaMallocArray
  0.17%  501.02us        90  5.5660us     135ns  226.72us  cuDeviceGetAttribute
  0.13%  388.54us         1  388.54us  388.54us  388.54us  cudaFree
  0.08%  238.54us         1  238.54us  238.54us  238.54us  cudaGetDeviceProperties
  0.06%  184.85us         2  92.425us  20.364us  164.49us  cudaMemcpyToArray
  0.05%  142.37us         3  47.455us  13.681us  92.475us  cudaLaunch
  0.03%  77.160us         1  77.160us  77.160us  77.160us  cudaMemcpyToSymbol
  0.01%  30.647us         1  30.647us  30.647us  30.647us  cuDeviceGetName
  0.01%  28.424us         2  14.212us  5.2950us  23.129us  cudaCreateTextureObject
  0.01%  19.957us         4  4.9890us  2.0610us  13.363us  cudaFuncGetAttributes
  0.00%  8.0830us        11     734ns     284ns  2.6740us  cudaDeviceGetAttribute
  0.00%  6.0500us         3  2.0160us     333ns  3.7970us  cudaConfigureCall
  0.00%  4.9180us         1  4.9180us  4.9180us  4.9180us  cudaEventCreateWithFlags
  0.00%  4.8570us         3  1.6190us     295ns  4.1620us  cudaGetDevice
  0.00%  4.2380us         1  4.2380us  4.2380us  4.2380us  cudaEventRecord
  0.00%  2.9030us         9     322ns     151ns     942ns  cudaSetupArgument
  0.00%  2.8810us         2  1.4400us     422ns  2.4590us  cuDeviceGetCount
  0.00%  2.6450us         1  2.6450us  2.6450us  2.6450us  cudaEventDestroy
  0.00%  1.1430us         1  1.1430us  1.1430us  1.1430us  cudaCreateChannelDesc
  0.00%     544ns         2     272ns     224ns     320ns  cuDeviceGet
