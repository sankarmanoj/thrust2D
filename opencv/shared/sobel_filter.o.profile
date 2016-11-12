==29300== NVPROF is profiling process 29300, command: ./sobel_filter.o
==29300== Profiling application: ./sobel_filter.o
==29300== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 53.82%  321.89us         2  160.95us  158.21us  163.68us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, convolutionFunctor)
 17.79%  106.37us        30  3.5450us     576ns  72.576us  [CUDA memcpy HtoD]
 12.35%  73.888us         1  73.888us  73.888us  73.888us  [CUDA memcpy DtoH]
  6.35%  37.952us         1  37.952us  37.952us  37.952us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.78%  34.592us         2  17.296us  17.120us  17.472us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.49%  20.864us         6  3.4770us     992ns  5.3440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.42%  2.4960us         1  2.4960us  2.4960us  2.4960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29300== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.27%  312.37ms        18  17.354ms  4.4230us  311.26ms  cudaMalloc
  0.20%  630.36us        12  52.529us  4.8060us  342.17us  cudaMemcpy
  0.17%  535.47us         2  267.73us  259.97us  275.50us  cudaGetDeviceProperties
  0.10%  305.75us        90  3.3970us     103ns  119.93us  cuDeviceGetAttribute
  0.09%  277.61us         7  39.658us  4.1090us  108.17us  cudaFree
  0.06%  195.35us         1  195.35us  195.35us  195.35us  cuDeviceTotalMem
  0.04%  113.92us        19  5.9950us  2.1740us  72.148us  cudaMemcpyAsync
  0.03%  95.434us        12  7.9520us  5.2390us  14.004us  cudaLaunch
  0.02%  67.731us        40  1.6930us  1.4010us  7.9270us  cudaFuncGetAttributes
  0.01%  36.788us         1  36.788us  36.788us  36.788us  cuDeviceGetName
  0.00%  10.578us        30     352ns     214ns  1.4420us  cudaGetDevice
  0.00%  8.6670us        10     866ns     614ns  1.4650us  cudaEventCreateWithFlags
  0.00%  7.7020us        18     427ns     116ns  4.2720us  cudaSetupArgument
  0.00%  7.2610us        10     726ns     519ns  1.1890us  cudaEventRecord
  0.00%  6.3300us        10     633ns     483ns  1.0100us  cudaEventDestroy
  0.00%  3.3300us        12     277ns     142ns     870ns  cudaConfigureCall
  0.00%  2.9270us        11     266ns     206ns     609ns  cudaDeviceGetAttribute
  0.00%  2.5410us         2  1.2700us     972ns  1.5690us  cuDeviceGetCount
  0.00%     972ns         3     324ns     199ns     402ns  cudaGetLastError
  0.00%     379ns         2     189ns     186ns     193ns  cuDeviceGet
