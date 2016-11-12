==29188== NVPROF is profiling process 29188, command: ./pyrdown.o
==29188== Profiling application: ./pyrdown.o
==29188== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.63%  1.0585ms        19  55.710us     320ns  1.0440ms  [CUDA memcpy DtoH]
 28.94%  531.62us         1  531.62us  531.62us  531.62us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, convolutionFunctor)
  6.43%  118.11us        27  4.3740us     704ns  86.784us  [CUDA memcpy HtoD]
  4.76%  87.489us         1  87.489us  87.489us  87.489us  void thrust::for_each_kernel<float, pyrdownTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, pyrdownTransformFunctor)
  2.09%  38.400us         4  9.6000us  1.7600us  18.080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.15%  2.7200us         1  2.7200us  2.7200us  2.7200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29188== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.42%  838.18ms        13  64.475ms  6.2180us  835.80ms  cudaMalloc
  1.64%  14.110ms        90  156.77us     113ns  5.7057ms  cuDeviceGetAttribute
  0.34%  2.9061ms         9  322.91us  6.8240us  2.1212ms  cudaMemcpy
  0.30%  2.5969ms         1  2.5969ms  2.5969ms  2.5969ms  cuDeviceTotalMem
  0.07%  644.68us        37  17.423us  2.9710us  220.06us  cudaMemcpyAsync
  0.07%  587.10us         2  293.55us  292.25us  294.86us  cudaGetDeviceProperties
  0.05%  449.94us         5  89.987us  9.9450us  170.31us  cudaFree
  0.05%  445.41us         1  445.41us  445.41us  445.41us  cuDeviceGetName
  0.03%  216.64us         7  30.948us  12.498us  43.052us  cudaLaunch
  0.01%  98.902us         1  98.902us  98.902us  98.902us  cudaDeviceSynchronize
  0.01%  66.011us        20  3.3000us  2.2630us  8.1360us  cudaFuncGetAttributes
  0.00%  13.256us        15     883ns     354ns  3.0980us  cudaGetDevice
  0.00%  11.546us         5  2.3090us  1.1120us  3.3820us  cudaEventCreateWithFlags
  0.00%  11.169us         5  2.2330us  1.0180us  3.2850us  cudaEventRecord
  0.00%  10.841us        12     903ns     173ns  7.0190us  cudaSetupArgument
  0.00%  10.042us         7  1.4340us     560ns  2.4430us  cudaConfigureCall
  0.00%  7.8400us         5  1.5680us     905ns  2.2120us  cudaEventDestroy
  0.00%  5.7990us        11     527ns     313ns  1.6850us  cudaDeviceGetAttribute
  0.00%  2.1330us         2  1.0660us     328ns  1.8050us  cuDeviceGetCount
  0.00%     906ns         2     453ns     261ns     645ns  cudaGetLastError
  0.00%     489ns         2     244ns     165ns     324ns  cuDeviceGet
