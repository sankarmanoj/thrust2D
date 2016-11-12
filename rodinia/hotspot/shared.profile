==30604== NVPROF is profiling process 30604, command: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==30604== Profiling application: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==30604== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.15%  868.18us         5  173.64us  1.2160us  435.18us  [CUDA memcpy HtoD]
 31.06%  597.39us         1  597.39us  597.39us  597.39us  void thrust::for_each_kernel<float, HotspotFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, HotspotFunctor)
 21.80%  419.15us         1  419.15us  419.15us  419.15us  [CUDA memcpy DtoH]
  2.00%  38.368us         2  19.184us  18.400us  19.968us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30604== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.26%  186.00ms         5  37.199ms  6.2370us  185.29ms  cudaMalloc
  0.62%  1.1645ms         4  291.12us  7.1280us  1.1291ms  cudaMemcpy
  0.48%  907.80us         2  453.90us  443.90us  463.90us  cudaMemcpyAsync
  0.20%  375.34us        90  4.1700us     152ns  147.00us  cuDeviceGetAttribute
  0.14%  274.36us         1  274.36us  274.36us  274.36us  cuDeviceTotalMem
  0.13%  249.15us         1  249.15us  249.15us  249.15us  cudaGetDeviceProperties
  0.12%  222.00us         2  111.00us  75.917us  146.09us  cudaFree
  0.02%  36.099us         1  36.099us  36.099us  36.099us  cuDeviceGetName
  0.02%  31.549us         3  10.516us  8.9720us  13.062us  cudaLaunch
  0.01%  13.856us         8  1.7320us  1.3950us  3.0760us  cudaFuncGetAttributes
  0.00%  3.0370us        11     276ns     208ns     706ns  cudaDeviceGetAttribute
  0.00%  2.9180us         6     486ns     209ns  1.2390us  cudaGetDevice
  0.00%  2.3680us         2  1.1840us     985ns  1.3830us  cudaEventCreateWithFlags
  0.00%  2.1720us         2  1.0860us     799ns  1.3730us  cudaEventRecord
  0.00%  1.7350us         2     867ns     281ns  1.4540us  cuDeviceGetCount
  0.00%  1.6110us         2     805ns     706ns     905ns  cudaEventDestroy
  0.00%  1.2620us         3     420ns     303ns     637ns  cudaConfigureCall
  0.00%  1.1090us         5     221ns     128ns     338ns  cudaSetupArgument
  0.00%     547ns         2     273ns     190ns     357ns  cuDeviceGet
  0.00%     299ns         1     299ns     299ns     299ns  cudaGetLastError
