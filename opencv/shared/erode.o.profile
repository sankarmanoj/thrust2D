==9419== NVPROF is profiling process 9419, command: ./erode.o
==9419== Profiling application: ./erode.o
==9419== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.95%  86.560us         6  14.426us     576ns  81.664us  [CUDA memcpy HtoD]
 35.10%  82.208us         1  82.208us  82.208us  82.208us  [CUDA memcpy DtoH]
 22.58%  52.896us         1  52.896us  52.896us  52.896us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
  3.63%  8.5120us         2  4.2560us  4.2240us  4.2880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.73%  4.0640us         1  4.0640us  4.0640us  4.0640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9419== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.10%  1.38039s         8  172.55ms  5.8980us  1.37147s  cudaMalloc
  0.87%  12.266ms        90  136.29us     123ns  7.1574ms  cuDeviceGetAttribute
  0.61%  8.6176ms         1  8.6176ms  8.6176ms  8.6176ms  cudaGetDeviceProperties
  0.31%  4.4236ms         3  1.4745ms  20.288us  2.3579ms  cudaFree
  0.04%  619.50us         1  619.50us  619.50us  619.50us  cuDeviceTotalMem
  0.03%  359.67us         6  59.944us  4.8690us  273.20us  cudaMemcpy
  0.02%  232.36us         1  232.36us  232.36us  232.36us  cuDeviceGetName
  0.01%  112.95us         1  112.95us  112.95us  112.95us  cudaMemcpyAsync
  0.01%  92.681us         4  23.170us  16.989us  31.500us  cudaLaunch
  0.00%  27.238us        12  2.2690us  1.4420us  5.0660us  cudaFuncGetAttributes
  0.00%  6.1020us         9     678ns     208ns  1.6980us  cudaGetDevice
  0.00%  5.7840us         7     826ns     168ns  3.8140us  cudaSetupArgument
  0.00%  5.2670us         3  1.7550us  1.5810us  1.9660us  cudaEventCreateWithFlags
  0.00%  4.2050us         3  1.4010us  1.2400us  1.6690us  cudaEventRecord
  0.00%  3.6550us         3  1.2180us  1.0060us  1.5230us  cudaEventDestroy
  0.00%  3.4130us         4     853ns     751ns  1.0410us  cudaConfigureCall
  0.00%  3.1570us        11     287ns     208ns     728ns  cudaDeviceGetAttribute
  0.00%  2.2260us         2  1.1130us     517ns  1.7090us  cuDeviceGetCount
  0.00%     488ns         2     244ns     202ns     286ns  cuDeviceGet
