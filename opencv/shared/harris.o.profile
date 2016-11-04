==4861== NVPROF is profiling process 4861, command: ./harris.o
==4861== Profiling application: ./harris.o
==4861== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.71%  311.64us         1  311.64us  311.64us  311.64us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, HarrisIntensityFunctor)
 21.47%  112.04us        24  4.6680us     576ns  87.141us  [CUDA memcpy HtoD]
 17.07%  89.062us        19  4.6870us     320ns  73.989us  [CUDA memcpy DtoH]
  1.75%  9.1520us         3  3.0500us  1.0880us  4.4160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4861== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.30%  815.30ms         8  101.91ms  3.6480us  814.49ms  cudaMalloc
  0.84%  6.9509ms         1  6.9509ms  6.9509ms  6.9509ms  cudaGetDeviceProperties
  0.30%  2.5232ms         1  2.5232ms  2.5232ms  2.5232ms  cuDeviceTotalMem
  0.26%  2.1548ms        90  23.941us     128ns  975.41us  cuDeviceGetAttribute
  0.13%  1.0628ms         3  354.28us  16.230us  1.0113ms  cudaFree
  0.07%  611.83us         6  101.97us  4.0310us  553.92us  cudaMemcpy
  0.06%  530.09us        37  14.326us  2.0760us  178.22us  cudaMemcpyAsync
  0.02%  140.49us         1  140.49us  140.49us  140.49us  cuDeviceGetName
  0.01%  84.326us         4  21.081us  11.118us  29.332us  cudaLaunch
  0.00%  23.281us        12  1.9400us  1.4050us  4.2110us  cudaFuncGetAttributes
  0.00%  5.9630us         3  1.9870us  1.1410us  3.1740us  cudaEventCreateWithFlags
  0.00%  5.2100us         7     744ns     118ns  3.1690us  cudaSetupArgument
  0.00%  4.4970us         9     499ns     203ns  1.4190us  cudaGetDevice
  0.00%  4.3880us         3  1.4620us     863ns  2.0070us  cudaEventRecord
  0.00%  3.9840us         4     996ns     340ns  1.5970us  cudaConfigureCall
  0.00%  3.4930us         3  1.1640us     761ns  1.4780us  cudaEventDestroy
  0.00%  3.4190us        11     310ns     202ns     878ns  cudaDeviceGetAttribute
  0.00%  2.3710us         2  1.1850us     255ns  2.1160us  cuDeviceGetCount
  0.00%     549ns         2     274ns     168ns     381ns  cuDeviceGet
  0.00%     371ns         1     371ns     371ns     371ns  cudaGetLastError
