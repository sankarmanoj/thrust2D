==9217== NVPROF is profiling process 9217, command: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==9217== Profiling application: ./hotspot_shared.out 1024 2 2 temp_1024 power_1024 result_shared.out
==9217== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.54%  884.83us         1  884.83us  884.83us  884.83us  void thrust::for_each_kernel<float, HotspotFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, HotspotFunctor)
 38.64%  843.31us         5  168.66us  1.1840us  434.93us  [CUDA memcpy HtoD]
 18.91%  412.66us         1  412.66us  412.66us  412.66us  [CUDA memcpy DtoH]
  1.92%  41.808us         2  20.904us  20.152us  21.656us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9217== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.03%  192.97ms         5  38.594ms  7.2250us  192.21ms  cudaMalloc
  0.73%  1.4384ms         4  359.59us  6.7100us  1.3999ms  cudaMemcpy
  0.45%  885.68us         2  442.84us  438.92us  446.75us  cudaMemcpyAsync
  0.24%  482.17us        90  5.3570us     205ns  198.16us  cuDeviceGetAttribute
  0.23%  460.51us         1  460.51us  460.51us  460.51us  cuDeviceTotalMem
  0.12%  242.52us         1  242.52us  242.52us  242.52us  cudaGetDeviceProperties
  0.11%  225.17us         2  112.58us  78.440us  146.73us  cudaFree
  0.02%  45.656us         1  45.656us  45.656us  45.656us  cuDeviceGetName
  0.02%  43.825us         3  14.608us  10.286us  18.880us  cudaLaunch
  0.01%  20.496us         8  2.5620us  1.8020us  5.0730us  cudaFuncGetAttributes
  0.00%  4.2130us         6     702ns     298ns  1.3750us  cudaGetDevice
  0.00%  4.0820us        11     371ns     264ns     840ns  cudaDeviceGetAttribute
  0.00%  4.0180us         2  2.0090us  1.6550us  2.3630us  cudaEventCreateWithFlags
  0.00%  3.3370us         2  1.6680us  1.3110us  2.0260us  cudaEventRecord
  0.00%  2.5630us         2  1.2810us     352ns  2.2110us  cuDeviceGetCount
  0.00%  2.1700us         2  1.0850us  1.0280us  1.1420us  cudaEventDestroy
  0.00%  2.1690us         3     723ns     429ns  1.1400us  cudaConfigureCall
  0.00%  1.1610us         5     232ns     117ns     386ns  cudaSetupArgument
  0.00%     809ns         2     404ns     285ns     524ns  cuDeviceGet
  0.00%     227ns         1     227ns     227ns     227ns  cudaGetLastError
