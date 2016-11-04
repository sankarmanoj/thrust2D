==3530== NVPROF is profiling process 3530, command: ./pyrup.o
==3530== Profiling application: ./pyrup.o
==3530== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 72.26%  598.79us         1  598.79us  598.79us  598.79us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 17.16%  142.22us        56  2.5390us     576ns  76.325us  [CUDA memcpy HtoD]
  7.49%  62.052us        51  1.2160us     320ns  18.785us  [CUDA memcpy DtoH]
  1.25%  10.336us         4  2.5840us  1.3440us  3.9040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.93%  7.6800us         1  7.6800us  7.6800us  7.6800us  [CUDA memcpy DtoD]
  0.61%  5.0560us         1  5.0560us  5.0560us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.30%  2.4970us         1  2.4970us  2.4970us  2.4970us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3530== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.32%  462.14ms        10  46.214ms  4.8540us  461.21ms  cudaMalloc
  0.19%  870.48us       101  8.6180us  2.1270us  146.85us  cudaMemcpyAsync
  0.13%  604.57us         1  604.57us  604.57us  604.57us  cudaDeviceSynchronize
  0.09%  433.25us        90  4.8130us     115ns  180.98us  cuDeviceGetAttribute
  0.07%  347.63us         1  347.63us  347.63us  347.63us  cudaGetDeviceProperties
  0.06%  262.36us         7  37.479us  6.4390us  169.00us  cudaMemcpy
  0.05%  220.45us         1  220.45us  220.45us  220.45us  cuDeviceTotalMem
  0.03%  158.18us         4  39.545us  5.7750us  117.32us  cudaFree
  0.02%  107.35us         7  15.335us  6.7750us  34.333us  cudaLaunch
  0.01%  59.980us        25  2.3990us  1.4240us  5.0270us  cudaFuncGetAttributes
  0.01%  41.769us         1  41.769us  41.769us  41.769us  cuDeviceGetName
  0.00%  11.866us        19     624ns     232ns  1.9100us  cudaGetDevice
  0.00%  7.8640us         6  1.3100us     767ns  2.1760us  cudaEventCreateWithFlags
  0.00%  7.2460us         6  1.2070us     674ns  1.8370us  cudaEventRecord
  0.00%  6.8500us        15     456ns     326ns  1.1140us  cudaDeviceGetAttribute
  0.00%  6.6970us        11     608ns     160ns  4.0520us  cudaSetupArgument
  0.00%  5.4970us         6     916ns     586ns  1.1990us  cudaEventDestroy
  0.00%  3.3860us         7     483ns     177ns     939ns  cudaConfigureCall
  0.00%  2.6790us         2  1.3390us     693ns  1.9860us  cuDeviceGetCount
  0.00%  1.1510us         1  1.1510us  1.1510us  1.1510us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     599ns         2     299ns     256ns     343ns  cuDeviceGet
  0.00%     410ns         1     410ns     410ns     410ns  cudaGetLastError
