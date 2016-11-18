==6710== NVPROF is profiling process 6710, command: ./dilate.o
==6710== Profiling application: ./dilate.o
==6710== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.58%  104.13us         6  17.354us     736ns  98.560us  [CUDA memcpy HtoD]
 32.15%  82.495us         1  82.495us  82.495us  82.495us  [CUDA memcpy DtoH]
 23.25%  59.648us         1  59.648us  59.648us  59.648us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  2.92%  7.4880us         2  3.7440us  3.7440us  3.7440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.10%  2.8160us         1  2.8160us  2.8160us  2.8160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6710== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.10%  1.02276s         8  127.85ms  5.1920us  1.01653s  cudaMalloc
  1.39%  14.603ms         1  14.603ms  14.603ms  14.603ms  cudaGetDeviceProperties
  1.00%  10.577ms        90  117.52us     101ns  5.0996ms  cuDeviceGetAttribute
  0.28%  2.8979ms         3  965.98us  19.417us  1.8796ms  cudaFree
  0.11%  1.1646ms         1  1.1646ms  1.1646ms  1.1646ms  cuDeviceTotalMem
  0.07%  768.39us         1  768.39us  768.39us  768.39us  cuDeviceGetName
  0.03%  314.63us         6  52.439us  5.7420us  225.30us  cudaMemcpy
  0.01%  111.54us         1  111.54us  111.54us  111.54us  cudaMemcpyAsync
  0.01%  91.648us         4  22.912us  13.100us  31.323us  cudaLaunch
  0.00%  29.883us        12  2.4900us  1.4410us  5.5900us  cudaFuncGetAttributes
  0.00%  7.9620us         3  2.6540us  1.1410us  4.9490us  cudaEventCreateWithFlags
  0.00%  6.7330us         9     748ns     213ns  2.4050us  cudaGetDevice
  0.00%  6.5370us         7     933ns     122ns  4.9520us  cudaSetupArgument
  0.00%  5.1910us        11     471ns     337ns  1.2190us  cudaDeviceGetAttribute
  0.00%  4.1440us         3  1.3810us     924ns  1.8260us  cudaEventRecord
  0.00%  3.7770us         3  1.2590us     790ns  1.6560us  cudaEventDestroy
  0.00%  3.0920us         4     773ns     402ns  1.1250us  cudaConfigureCall
  0.00%  1.5760us         2     788ns     131ns  1.4450us  cuDeviceGetCount
  0.00%     367ns         2     183ns     114ns     253ns  cuDeviceGet
