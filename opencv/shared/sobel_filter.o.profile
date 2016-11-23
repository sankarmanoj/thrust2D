==12320== NVPROF is profiling process 12320, command: ./sobel_filter.o
==12320== Profiling application: ./sobel_filter.o
==12320== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 90.49%  68.005ms         1  68.005ms  68.005ms  68.005ms  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  6.21%  4.6659ms         4  1.1665ms  156.92us  2.1245ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.81%  2.1088ms         1  2.1088ms  2.1088ms  2.1088ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.26%  194.27us         1  194.27us  194.27us  194.27us  [CUDA memcpy DtoH]
  0.23%  175.68us        26  6.7560us     703ns  157.88us  [CUDA memcpy HtoD]

==12320== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.40%  4.76989s        12  397.49ms  4.5300us  4.76916s  cudaMalloc
  1.41%  68.498ms         8  8.5622ms  2.9730us  68.458ms  cudaMemcpy
  0.14%  6.8398ms         5  1.3680ms  161.14us  2.1293ms  cudaDeviceSynchronize
  0.01%  693.52us         6  115.59us  7.5660us  644.07us  cudaLaunch
  0.01%  408.53us         2  204.27us  194.51us  214.02us  cudaGetDeviceProperties
  0.01%  297.96us        91  3.2740us     142ns  113.34us  cuDeviceGetAttribute
  0.00%  199.80us         5  39.959us  4.8100us  125.43us  cudaFree
  0.00%  176.71us         1  176.71us  176.71us  176.71us  cuDeviceTotalMem
  0.00%  163.60us        19  8.6100us  1.8150us  127.33us  cudaMemcpyAsync
  0.00%  33.687us        20  1.6840us  1.3360us  4.8460us  cudaFuncGetAttributes
  0.00%  33.421us         1  33.421us  33.421us  33.421us  cuDeviceGetName
  0.00%  6.1080us        15     407ns     197ns  1.6520us  cudaGetDevice
  0.00%  5.1810us         5  1.0360us     678ns  1.5840us  cudaEventCreateWithFlags
  0.00%  4.5730us         5     914ns     632ns  1.4880us  cudaEventRecord
  0.00%  3.6050us        11     327ns     204ns     875ns  cudaDeviceGetAttribute
  0.00%  3.5800us         5     716ns     546ns  1.0530us  cudaEventDestroy
  0.00%  2.8510us         3     950ns     273ns  1.8780us  cuDeviceGetCount
  0.00%  2.3370us         6     389ns     246ns     797ns  cudaConfigureCall
  0.00%  2.3110us         9     256ns     112ns     748ns  cudaSetupArgument
  0.00%  1.5630us         3     521ns     323ns     761ns  cuDeviceGet
  0.00%     786ns         1     786ns     786ns     786ns  cudaGetLastError
