==21176== NVPROF is profiling process 21176, command: ./gaussian_filter.o
==21176== Profiling application: ./gaussian_filter.o
==21176== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 42.62%  91.777us         3  30.592us  1.2160us  89.345us  [CUDA memcpy HtoD]
 38.27%  82.400us         1  82.400us  82.400us  82.400us  [CUDA memcpy DtoH]
  8.44%  18.176us         2  9.0880us  9.0240us  9.1520us  [CUDA memcpy DtoA]
  4.28%  9.2160us         1  9.2160us  9.2160us  9.2160us  thrust::convolutionRowsKernel(float*, int, int)
  4.28%  9.2160us         1  9.2160us  9.2160us  9.2160us  thrust::convolutionColumnsKernel(float*, int, int)
  2.11%  4.5440us         1  4.5440us  4.5440us  4.5440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==21176== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.75%  157.83ms         3  52.608ms  354.36us  157.10ms  cudaMalloc
  0.62%  993.02us         1  993.02us  993.02us  993.02us  cuDeviceTotalMem
  0.57%  921.23us        90  10.235us     744ns  340.02us  cuDeviceGetAttribute
  0.46%  748.87us         1  748.87us  748.87us  748.87us  cudaGetDeviceProperties
  0.23%  378.18us         1  378.18us  378.18us  378.18us  cudaMallocArray
  0.13%  202.69us         2  101.35us  9.8840us  192.81us  cudaMemcpy
  0.07%  116.25us         1  116.25us  116.25us  116.25us  cudaFree
  0.05%  85.898us         1  85.898us  85.898us  85.898us  cuDeviceGetName
  0.05%  75.107us         1  75.107us  75.107us  75.107us  cudaMemcpyAsync
  0.02%  38.572us         2  19.286us  8.4250us  30.147us  cudaMemcpyToArray
  0.02%  35.458us         3  11.819us  8.3190us  13.979us  cudaLaunch
  0.01%  8.1410us         1  8.1410us  8.1410us  8.1410us  cudaMemcpyToSymbol
  0.00%  7.0900us         4  1.7720us  1.3570us  2.9970us  cudaFuncGetAttributes
  0.00%  5.8230us         2  2.9110us  1.5320us  4.2910us  cuDeviceGetCount
  0.00%  4.8920us         2  2.4460us  1.5490us  3.3430us  cudaBindTextureToArray
  0.00%  3.0940us        11     281ns     196ns     887ns  cudaDeviceGetAttribute
  0.00%  2.2000us         2  1.1000us     852ns  1.3480us  cuDeviceGet
  0.00%  1.7280us         3     576ns     207ns  1.2420us  cudaGetDevice
  0.00%  1.6450us         2     822ns     630ns  1.0150us  cudaUnbindTexture
  0.00%  1.5290us         3     509ns     205ns     801ns  cudaConfigureCall
  0.00%  1.4600us         1  1.4600us  1.4600us  1.4600us  cudaEventRecord
  0.00%  1.2400us         1  1.2400us  1.2400us  1.2400us  cudaEventCreateWithFlags
  0.00%  1.1720us         2     586ns     502ns     670ns  cudaGetChannelDesc
  0.00%  1.1380us         7     162ns     107ns     313ns  cudaSetupArgument
  0.00%     897ns         1     897ns     897ns     897ns  cudaEventDestroy
  0.00%     164ns         1     164ns     164ns     164ns  cudaCreateChannelDesc
