==5391== NVPROF is profiling process 5391, command: ./erode.o
==5391== Profiling application: ./erode.o
==5391== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.41%  238.63us         1  238.63us  238.63us  238.63us  [CUDA memcpy DtoH]
 35.19%  180.97us         1  180.97us  180.97us  180.97us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, erodeFunctor)
 15.97%  82.135us         6  13.689us     544ns  78.999us  [CUDA memcpy HtoD]
  1.79%  9.1820us         2  4.5910us  4.4150us  4.7670us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.64%  3.2960us         1  3.2960us  3.2960us  3.2960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5391== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.79%  868.33ms         8  108.54ms  6.8800us  862.55ms  cudaMalloc
  1.25%  11.119ms         1  11.119ms  11.119ms  11.119ms  cudaGetDeviceProperties
  0.60%  5.3354ms         3  1.7785ms  79.898us  4.2610ms  cudaFree
  0.23%  2.0379ms         6  339.66us  22.980us  1.8751ms  cudaMemcpy
  0.05%  411.68us         1  411.68us  411.68us  411.68us  cudaMemcpyAsync
  0.02%  217.74us        90  2.4190us     130ns  84.014us  cuDeviceGetAttribute
  0.02%  194.47us         4  48.618us  25.348us  80.702us  cudaLaunch
  0.02%  177.51us         1  177.51us  177.51us  177.51us  cuDeviceTotalMem
  0.00%  40.220us        12  3.3510us  1.5220us  10.892us  cudaFuncGetAttributes
  0.00%  24.655us         1  24.655us  24.655us  24.655us  cuDeviceGetName
  0.00%  8.6370us         3  2.8790us  2.2110us  4.1640us  cudaEventCreateWithFlags
  0.00%  8.1020us         9     900ns     243ns  3.1520us  cudaGetDevice
  0.00%  6.4150us         3  2.1380us  1.1700us  3.8820us  cudaEventRecord
  0.00%  4.8010us         7     685ns     159ns  2.4300us  cudaSetupArgument
  0.00%  4.5100us         3  1.5030us  1.0570us  2.0410us  cudaEventDestroy
  0.00%  4.3810us         4  1.0950us     661ns  1.5430us  cudaConfigureCall
  0.00%  3.5420us         2  1.7710us     430ns  3.1120us  cuDeviceGetCount
  0.00%  3.1610us        11     287ns     209ns     712ns  cudaDeviceGetAttribute
  0.00%     670ns         2     335ns     200ns     470ns  cuDeviceGet
  0.00%     375ns         1     375ns     375ns     375ns  cudaGetLastError
