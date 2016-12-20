==9768== NVPROF is profiling process 9768, command: ./gaussian_filter.o 1631
==9768== Profiling application: ./gaussian_filter.o 1631
==9768== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.53%  2.2701ms         1  2.2701ms  2.2701ms  2.2701ms  [CUDA memcpy DtoH]
 31.01%  1.5131ms         3  504.37us  1.1840us  1.5108ms  [CUDA memcpy HtoD]
 10.06%  490.72us         2  245.36us  244.58us  246.14us  [CUDA memcpy DtoA]
  5.68%  277.22us         1  277.22us  277.22us  277.22us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  5.35%  261.12us         1  261.12us  261.12us  261.12us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  1.37%  66.784us         1  66.784us  66.784us  66.784us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9768== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.96%  808.91ms         3  269.64ms  976.73us  805.15ms  cudaMalloc
  1.09%  9.0544ms         1  9.0544ms  9.0544ms  9.0544ms  cudaFree
  0.58%  4.8057ms         1  4.8057ms  4.8057ms  4.8057ms  cudaMallocArray
  0.50%  4.2018ms         2  2.1009ms  123.78us  4.0781ms  cudaMemcpy
  0.36%  3.0055ms        90  33.393us     132ns  2.4602ms  cuDeviceGetAttribute
  0.23%  1.9391ms         1  1.9391ms  1.9391ms  1.9391ms  cudaMemcpyAsync
  0.17%  1.4333ms         1  1.4333ms  1.4333ms  1.4333ms  cudaGetDeviceProperties
  0.03%  233.86us         3  77.953us  20.146us  172.06us  cudaLaunch
  0.02%  200.37us         2  100.19us  44.160us  156.21us  cudaMemcpyToArray
  0.02%  163.92us         1  163.92us  163.92us  163.92us  cuDeviceTotalMem
  0.01%  95.160us         1  95.160us  95.160us  95.160us  cudaMemcpyToSymbol
  0.01%  49.911us         2  24.955us  12.405us  37.506us  cudaCreateTextureObject
  0.00%  41.484us         1  41.484us  41.484us  41.484us  cuDeviceGetName
  0.00%  30.421us         4  7.6050us  2.5650us  22.248us  cudaFuncGetAttributes
  0.00%  12.095us        11  1.0990us     294ns  5.2610us  cudaDeviceGetAttribute
  0.00%  10.788us         3  3.5960us     542ns  8.7350us  cudaGetDevice
  0.00%  10.707us         1  10.707us  10.707us  10.707us  cudaEventCreateWithFlags
  0.00%  10.007us         3  3.3350us     522ns  5.7340us  cudaConfigureCall
  0.00%  7.0830us         1  7.0830us  7.0830us  7.0830us  cudaEventRecord
  0.00%  5.3260us         9     591ns     161ns  2.8640us  cudaSetupArgument
  0.00%  5.1270us         1  5.1270us  5.1270us  5.1270us  cudaEventDestroy
  0.00%  5.0720us         2  2.5360us  1.4180us  3.6540us  cuDeviceGetCount
  0.00%  1.0340us         2     517ns     359ns     675ns  cuDeviceGet
  0.00%     464ns         1     464ns     464ns     464ns  cudaCreateChannelDesc
