==28729== NVPROF is profiling process 28729, command: ./gaussian_filter.o
==28729== Profiling application: ./gaussian_filter.o
==28729== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.98%  41.536us         3  13.845us     864ns  39.776us  [CUDA memcpy HtoD]
 35.96%  39.328us         1  39.328us  39.328us  39.328us  [CUDA memcpy DtoH]
  8.16%  8.9280us         1  8.9280us  8.9280us  8.9280us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.55%  8.2560us         1  8.2560us  8.2560us  8.2560us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  6.50%  7.1040us         2  3.5520us  2.8800us  4.2240us  [CUDA memcpy DtoA]
  3.86%  4.2240us         1  4.2240us  4.2240us  4.2240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==28729== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.95%  139.79ms         3  46.598ms  309.69us  139.17ms  cudaMalloc
  0.23%  320.37us         1  320.37us  320.37us  320.37us  cudaMallocArray
  0.15%  217.11us        91  2.3850us      94ns  84.301us  cuDeviceGetAttribute
  0.15%  208.13us         1  208.13us  208.13us  208.13us  cudaFree
  0.14%  200.65us         2  100.32us  12.155us  188.49us  cudaMemcpy
  0.13%  185.37us         1  185.37us  185.37us  185.37us  cudaGetDeviceProperties
  0.11%  162.16us         1  162.16us  162.16us  162.16us  cuDeviceTotalMem
  0.03%  48.337us         2  24.168us  9.4730us  38.864us  cudaMemcpyToArray
  0.03%  41.883us         3  13.961us  5.8640us  28.020us  cudaLaunch
  0.03%  36.069us         1  36.069us  36.069us  36.069us  cudaMemcpyAsync
  0.02%  21.450us         1  21.450us  21.450us  21.450us  cuDeviceGetName
  0.01%  10.207us         2  5.1030us  2.3260us  7.8810us  cudaCreateTextureObject
  0.01%  9.0800us         1  9.0800us  9.0800us  9.0800us  cudaMemcpyToSymbol
  0.01%  8.0910us         4  2.0220us  1.3600us  4.0070us  cudaFuncGetAttributes
  0.00%  3.3040us        11     300ns     199ns     738ns  cudaDeviceGetAttribute
  0.00%  2.0570us         3     685ns     197ns  1.6300us  cudaGetDevice
  0.00%  1.8220us         1  1.8220us  1.8220us  1.8220us  cudaEventCreateWithFlags
  0.00%  1.6400us         1  1.6400us  1.6400us  1.6400us  cudaEventRecord
  0.00%  1.5640us         9     173ns     104ns     515ns  cudaSetupArgument
  0.00%  1.3850us         3     461ns     123ns  1.0850us  cuDeviceGetCount
  0.00%  1.2940us         3     431ns     239ns     668ns  cudaConfigureCall
  0.00%  1.2040us         1  1.2040us  1.2040us  1.2040us  cudaEventDestroy
  0.00%     617ns         3     205ns     107ns     295ns  cuDeviceGet
  0.00%     134ns         1     134ns     134ns     134ns  cudaCreateChannelDesc
