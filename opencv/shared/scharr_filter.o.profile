==29304== NVPROF is profiling process 29304, command: ./scharr_filter.o
==29304== Profiling application: ./scharr_filter.o
==29304== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.20%  325.73us         2  162.87us  162.69us  163.04us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, convolutionFunctor)
 17.60%  105.76us        30  3.5250us     576ns  72.416us  [CUDA memcpy HtoD]
 12.30%  73.921us         1  73.921us  73.921us  73.921us  [CUDA memcpy DtoH]
  6.35%  38.144us         1  38.144us  38.144us  38.144us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.72%  34.368us         2  17.184us  16.960us  17.408us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.43%  20.608us         6  3.4340us     960ns  5.1520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.40%  2.4320us         1  2.4320us  2.4320us  2.4320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29304== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 92.38%  293.30ms        18  16.294ms  4.3250us  291.10ms  cudaMalloc
  5.97%  18.956ms         2  9.4779ms  9.4256ms  9.5302ms  cudaGetDeviceProperties
  0.61%  1.9486ms         1  1.9486ms  1.9486ms  1.9486ms  cuDeviceGetName
  0.33%  1.0558ms        90  11.730us     102ns  631.63us  cuDeviceGetAttribute
  0.24%  776.32us        12  64.693us  3.6590us  685.08us  cudaMemcpy
  0.21%  673.15us        12  56.095us  6.6220us  515.08us  cudaLaunch
  0.09%  282.77us         7  40.395us  4.0960us  105.27us  cudaFree
  0.07%  228.80us         1  228.80us  228.80us  228.80us  cuDeviceTotalMem
  0.04%  135.49us        19  7.1300us  1.9900us  97.110us  cudaMemcpyAsync
  0.02%  67.441us        40  1.6860us  1.4040us  3.6070us  cudaFuncGetAttributes
  0.00%  12.397us        30     413ns     212ns  1.1510us  cudaGetDevice
  0.00%  12.346us        10  1.2340us     660ns  3.1150us  cudaEventCreateWithFlags
  0.00%  9.7990us        10     979ns     604ns  1.9900us  cudaEventRecord
  0.00%  8.1330us        10     813ns     481ns  1.4810us  cudaEventDestroy
  0.00%  7.9480us        18     441ns     119ns  3.0530us  cudaSetupArgument
  0.00%  6.7140us        12     559ns     150ns  1.5000us  cudaConfigureCall
  0.00%  3.1630us        11     287ns     207ns     880ns  cudaDeviceGetAttribute
  0.00%  2.5480us         3     849ns     361ns  1.7870us  cudaGetLastError
  0.00%  1.7720us         2     886ns     225ns  1.5470us  cuDeviceGetCount
  0.00%     401ns         2     200ns      97ns     304ns  cuDeviceGet
