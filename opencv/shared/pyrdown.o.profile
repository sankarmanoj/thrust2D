==4848== NVPROF is profiling process 4848, command: ./pyrdown.o
==4848== Profiling application: ./pyrdown.o
==4848== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 68.02%  2.3672ms         1  2.3672ms  2.3672ms  2.3672ms  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 16.62%  578.47us        51  11.342us     320ns  535.20us  [CUDA memcpy DtoH]
  8.57%  298.39us         1  298.39us  298.39us  298.39us  void thrust::for_each_kernel<float, pyrdownTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, pyrdownTransformFunctor)
  4.33%  150.79us        57  2.6450us     544ns  91.750us  [CUDA memcpy HtoD]
  1.21%  42.274us         1  42.274us  42.274us  42.274us  [CUDA memcpy DtoD]
  1.17%  40.580us         4  10.145us  1.2800us  18.306us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.07%  2.4330us         1  2.4330us  2.4330us  2.4330us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4848== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.86%  905.16ms        11  82.287ms  7.9300us  899.46ms  cudaMalloc
  1.17%  10.935ms        90  121.51us     117ns  5.5723ms  cuDeviceGetAttribute
  0.75%  7.0011ms         2  3.5006ms  302.41us  6.6987ms  cudaDeviceSynchronize
  0.46%  4.2528ms         2  2.1264ms  315.97us  3.9368ms  cudaGetDeviceProperties
  0.29%  2.6694ms         1  2.6694ms  2.6694ms  2.6694ms  cuDeviceGetName
  0.15%  1.4368ms       101  14.225us  2.1010us  474.51us  cudaMemcpyAsync
  0.13%  1.1781ms         8  147.26us  14.019us  1.0187ms  cudaMemcpy
  0.10%  936.61us         4  234.15us  6.4790us  559.80us  cudaFree
  0.07%  621.25us         1  621.25us  621.25us  621.25us  cuDeviceTotalMem
  0.02%  191.30us         7  27.327us  12.763us  41.072us  cudaLaunch
  0.01%  60.612us        21  2.8860us  1.4250us  6.9170us  cudaFuncGetAttributes
  0.00%  14.393us        16     899ns     206ns  2.5830us  cudaGetDevice
  0.00%  10.698us         5  2.1390us  1.6010us  2.5810us  cudaEventCreateWithFlags
  0.00%  8.7250us         5  1.7450us  1.1930us  2.1940us  cudaEventRecord
  0.00%  8.3150us        13     639ns     148ns  4.0300us  cudaSetupArgument
  0.00%  6.2700us         5  1.2540us  1.0460us  1.6290us  cudaEventDestroy
  0.00%  5.8670us         7     838ns     534ns  1.1860us  cudaConfigureCall
  0.00%  5.1490us        15     343ns     205ns  1.4890us  cudaDeviceGetAttribute
  0.00%  2.1050us         2  1.0520us     510ns  1.5950us  cuDeviceGetCount
  0.00%  1.4980us         1  1.4980us  1.4980us  1.4980us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.3370us         2     668ns     448ns     889ns  cudaGetLastError
  0.00%     567ns         2     283ns     211ns     356ns  cuDeviceGet
