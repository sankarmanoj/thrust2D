==10015== NVPROF is profiling process 10015, command: ./gaussian_filter.o
==10015== Profiling application: ./gaussian_filter.o
==10015== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.74%  268.38us         1  268.38us  268.38us  268.38us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 22.25%  109.09us        25  4.3630us     576ns  81.184us  [CUDA memcpy HtoD]
 19.86%  97.376us        19  5.1250us     320ns  82.432us  [CUDA memcpy DtoH]
  2.36%  11.584us         3  3.8610us  1.5360us  5.9520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.79%  3.8720us         1  3.8720us  3.8720us  3.8720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10015== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.31%  117.67ms        10  11.767ms  4.4540us  116.81ms  cudaMalloc
  0.45%  539.32us         7  77.045us  5.1050us  457.53us  cudaMemcpy
  0.27%  320.49us        37  8.6610us  1.9410us  56.502us  cudaMemcpyAsync
  0.27%  320.31us        90  3.5590us     102ns  134.49us  cuDeviceGetAttribute
  0.22%  265.82us         4  66.455us  10.854us  150.73us  cudaFree
  0.19%  230.66us         1  230.66us  230.66us  230.66us  cudaGetDeviceProperties
  0.17%  201.40us         1  201.40us  201.40us  201.40us  cuDeviceTotalMem
  0.04%  51.824us         5  10.364us  6.7740us  16.514us  cudaLaunch
  0.03%  31.396us        16  1.9620us  1.4540us  7.0560us  cudaFuncGetAttributes
  0.02%  29.737us         1  29.737us  29.737us  29.737us  cuDeviceGetName
  0.01%  6.2510us         4  1.5620us     848ns  3.4460us  cudaEventCreateWithFlags
  0.00%  4.9120us        12     409ns     213ns  1.1520us  cudaGetDevice
  0.00%  4.8060us         8     600ns     118ns  3.5030us  cudaSetupArgument
  0.00%  3.8620us         4     965ns     733ns  1.5200us  cudaEventRecord
  0.00%  3.0190us        11     274ns     218ns     686ns  cudaDeviceGetAttribute
  0.00%  2.9210us         4     730ns     579ns     962ns  cudaEventDestroy
  0.00%  2.0480us         5     409ns     252ns     873ns  cudaConfigureCall
  0.00%  1.6290us         2     814ns     350ns  1.2790us  cuDeviceGetCount
  0.00%     367ns         2     183ns     154ns     213ns  cuDeviceGet
