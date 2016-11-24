==29462== NVPROF is profiling process 29462, command: ./pyrdown.o
==29462== Profiling application: ./pyrdown.o
==29462== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.79%  149.60us         4  37.400us     736ns  146.37us  [CUDA memcpy HtoD]
 20.38%  68.065us         2  34.032us  15.776us  52.289us  [CUDA memcpy DtoA]
 12.68%  42.337us         1  42.337us  42.337us  42.337us  [CUDA memcpy DtoH]
  6.06%  20.256us         1  20.256us  20.256us  20.256us  void thrust::convolutionRowsKernel<float>(float*, int, int, unsigned __int64)
  5.57%  18.592us         1  18.592us  18.592us  18.592us  void thrust::convolutionColumnsKernel<float>(float*, int, int, unsigned __int64)
  5.55%  18.528us         1  18.528us  18.528us  18.528us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.98%  16.640us         2  8.3200us  4.3200us  12.320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29462== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.07%  285.66ms         5  57.131ms  15.672us  276.74ms  cudaMalloc
  1.17%  3.4425ms         1  3.4425ms  3.4425ms  3.4425ms  cudaMallocArray
  0.77%  2.2687ms         2  1.1343ms  43.858us  2.2248ms  cudaFree
  0.22%  636.75us         3  212.25us  30.775us  407.78us  cudaMemcpy
  0.19%  562.51us         5  112.50us  6.1330us  492.74us  cudaLaunch
  0.17%  508.80us         1  508.80us  508.80us  508.80us  cudaMemcpyToSymbol
  0.16%  461.22us         3  153.74us  2.5390us  454.06us  cudaEventCreateWithFlags
  0.09%  254.96us        91  2.8010us     143ns  95.940us  cuDeviceGetAttribute
  0.06%  184.44us         1  184.44us  184.44us  184.44us  cuDeviceTotalMem
  0.05%  140.83us         1  140.83us  140.83us  140.83us  cudaMemcpyAsync
  0.02%  67.361us         2  33.680us  9.9020us  57.459us  cudaMemcpyToArray
  0.01%  27.716us        12  2.3090us  1.3650us  6.0110us  cudaFuncGetAttributes
  0.01%  26.011us         1  26.011us  26.011us  26.011us  cuDeviceGetName
  0.00%  8.7200us         9     968ns     206ns  3.1310us  cudaGetDevice
  0.00%  8.5780us         2  4.2890us  2.4120us  6.1660us  cudaCreateTextureObject
  0.00%  6.7570us         3  2.2520us  1.4340us  3.4580us  cudaEventRecord
  0.00%  6.0600us        11     550ns     112ns  3.0400us  cudaSetupArgument
  0.00%  4.4440us         3  1.4810us     982ns  1.7590us  cudaEventDestroy
  0.00%  3.7970us        11     345ns     212ns  1.0430us  cudaDeviceGetAttribute
  0.00%  2.7750us         5     555ns     149ns     931ns  cudaConfigureCall
  0.00%  2.2330us         3     744ns     244ns  1.6340us  cuDeviceGetCount
  0.00%  1.2120us         3     404ns     233ns     637ns  cuDeviceGet
  0.00%     149ns         1     149ns     149ns     149ns  cudaCreateChannelDesc
