==3390== NVPROF is profiling process 3390, command: ./erode.o
==3390== Profiling application: ./erode.o
==3390== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.78%  87.782us         5  17.556us  1.1840us  82.950us  [CUDA memcpy HtoD]
 31.10%  83.269us         1  83.269us  83.269us  83.269us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.06%  80.485us         1  80.485us  80.485us  80.485us  [CUDA memcpy DtoH]
  4.60%  12.321us         3  4.1070us  3.4560us  5.3130us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.46%  3.9040us         1  3.9040us  3.9040us  3.9040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3390== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.49%  353.02ms         8  44.127ms  7.1180us  351.64ms  cudaMalloc
  0.10%  370.77us        90  4.1190us     131ns  143.67us  cuDeviceGetAttribute
  0.10%  370.22us         4  92.555us  17.494us  181.30us  cudaFree
  0.10%  358.91us         5  71.781us  7.5460us  307.04us  cudaMemcpy
  0.07%  243.34us         1  243.34us  243.34us  243.34us  cudaMemcpyAsync
  0.06%  208.71us         1  208.71us  208.71us  208.71us  cuDeviceTotalMem
  0.04%  124.96us         5  24.991us  9.9260us  45.887us  cudaLaunch
  0.02%  58.280us        20  2.9140us  2.0740us  6.5530us  cudaFuncGetAttributes
  0.01%  33.048us         1  33.048us  33.048us  33.048us  cuDeviceGetName
  0.00%  11.893us        15     792ns     332ns  2.5790us  cudaGetDevice
  0.00%  9.8320us         5  1.9660us  1.1950us  2.6370us  cudaEventCreateWithFlags
  0.00%  7.9520us         5  1.5900us     872ns  2.1140us  cudaEventRecord
  0.00%  6.9450us         5  1.3890us     293ns  4.0080us  cudaSetupArgument
  0.00%  5.9700us         5  1.1940us     817ns  1.6230us  cudaEventDestroy
  0.00%  5.3620us        11     487ns     288ns  1.2550us  cudaDeviceGetAttribute
  0.00%  4.2620us         5     852ns     346ns  1.4290us  cudaConfigureCall
  0.00%  1.7780us         2     889ns     263ns  1.5150us  cuDeviceGetCount
  0.00%     442ns         2     221ns     202ns     240ns  cuDeviceGet
