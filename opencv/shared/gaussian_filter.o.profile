==21343== NVPROF is profiling process 21343, command: ./gaussian_filter.o
==21343== Profiling application: ./gaussian_filter.o
==21343== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.28%  83.328us         3  27.776us  1.2160us  80.896us  [CUDA memcpy HtoD]
 39.83%  82.401us         1  82.401us  82.401us  82.401us  [CUDA memcpy DtoH]
  8.71%  18.016us         2  9.0080us  8.9600us  9.0560us  [CUDA memcpy DtoA]
  4.52%  9.3440us         1  9.3440us  9.3440us  9.3440us  thrust::convolutionRowsKernel(float*, int, int)
  4.47%  9.2480us         1  9.2480us  9.2480us  9.2480us  thrust::convolutionColumnsKernel(float*, int, int)
  2.20%  4.5440us         1  4.5440us  4.5440us  4.5440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==21343== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.24%  162.58ms         3  54.192ms  368.11us  161.82ms  cudaMalloc
  0.42%  703.24us        90  7.8130us     428ns  262.20us  cuDeviceGetAttribute
  0.39%  647.53us         1  647.53us  647.53us  647.53us  cuDeviceTotalMem
  0.35%  574.61us         1  574.61us  574.61us  574.61us  cudaGetDeviceProperties
  0.23%  380.96us         1  380.96us  380.96us  380.96us  cudaMallocArray
  0.13%  216.72us         2  108.36us  11.867us  204.86us  cudaMemcpy
  0.08%  131.28us         1  131.28us  131.28us  131.28us  cudaFree
  0.04%  64.645us         1  64.645us  64.645us  64.645us  cuDeviceGetName
  0.04%  61.164us         1  61.164us  61.164us  61.164us  cudaMemcpyAsync
  0.03%  42.772us         3  14.257us  8.6080us  20.447us  cudaLaunch
  0.03%  42.148us         2  21.074us  8.5100us  33.638us  cudaMemcpyToArray
  0.01%  8.3190us         1  8.3190us  8.3190us  8.3190us  cudaMemcpyToSymbol
  0.00%  7.9900us         4  1.9970us  1.4020us  3.7020us  cudaFuncGetAttributes
  0.00%  4.7010us         2  2.3500us  1.4670us  3.2340us  cudaBindTextureToArray
  0.00%  4.5300us         2  2.2650us  1.0960us  3.4340us  cuDeviceGetCount
  0.00%  3.1550us        11     286ns     205ns     825ns  cudaDeviceGetAttribute
  0.00%  1.7270us         3     575ns     217ns  1.2450us  cudaGetDevice
  0.00%  1.5860us         1  1.5860us  1.5860us  1.5860us  cudaEventRecord
  0.00%  1.5080us         2     754ns     627ns     881ns  cudaUnbindTexture
  0.00%  1.4970us         3     499ns     258ns     888ns  cudaConfigureCall
  0.00%  1.4200us         2     710ns     593ns     827ns  cuDeviceGet
  0.00%  1.4130us         1  1.4130us  1.4130us  1.4130us  cudaEventCreateWithFlags
  0.00%  1.3640us         2     682ns     484ns     880ns  cudaGetChannelDesc
  0.00%  1.1720us         7     167ns     113ns     331ns  cudaSetupArgument
  0.00%     949ns         1     949ns     949ns     949ns  cudaEventDestroy
  0.00%     131ns         1     131ns     131ns     131ns  cudaCreateChannelDesc
