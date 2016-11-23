==3330== NVPROF is profiling process 3330, command: ./blend.o
==3330== Profiling application: ./blend.o
==3330== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.30%  411.39us         5  82.277us     864ns  228.10us  [CUDA memcpy HtoD]
 40.29%  350.44us         1  350.44us  350.44us  350.44us  [CUDA memcpy DtoH]
  6.85%  59.569us         1  59.569us  59.569us  59.569us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.56%  48.366us         3  16.122us  13.604us  17.413us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3330== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.07%  873.50ms         6  145.58ms  8.5470us  872.23ms  cudaMalloc
  0.37%  3.2927ms        90  36.585us     136ns  1.1994ms  cuDeviceGetAttribute
  0.21%  1.8957ms         3  631.91us  58.487us  1.5005ms  cudaFree
  0.13%  1.1608ms         4  290.20us  16.704us  974.04us  cudaMemcpy
  0.09%  829.36us         2  414.68us  373.17us  456.18us  cudaMemcpyAsync
  0.04%  376.52us         1  376.52us  376.52us  376.52us  cuDeviceTotalMem
  0.03%  264.20us         4  66.051us  26.007us  113.81us  cudaLaunch
  0.03%  260.57us         1  260.57us  260.57us  260.57us  cuDeviceGetName
  0.01%  56.662us        16  3.5410us  1.9450us  12.602us  cudaFuncGetAttributes
  0.00%  22.766us         4  5.6910us  2.4440us  9.0690us  cudaEventCreateWithFlags
  0.00%  16.905us        12  1.4080us     289ns  5.0440us  cudaGetDevice
  0.00%  15.251us         4  3.8120us     343ns  9.6800us  cudaSetupArgument
  0.00%  13.626us         4  3.4060us  1.1190us  5.8900us  cudaEventRecord
  0.00%  8.9670us         4  2.2410us     876ns  3.7730us  cudaConfigureCall
  0.00%  8.6540us         4  2.1630us  1.2470us  3.3920us  cudaEventDestroy
  0.00%  8.0770us        11     734ns     287ns  3.2650us  cudaDeviceGetAttribute
  0.00%  4.3950us         2  2.1970us  1.4970us  2.8980us  cuDeviceGetCount
  0.00%  1.3210us         2     660ns     481ns     840ns  cuDeviceGet
