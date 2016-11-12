==30181== NVPROF is profiling process 30181, command: ./gaussian_filter.o
==30181== Profiling application: ./gaussian_filter.o
==30181== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.23%  223.59us         1  223.59us  223.59us  223.59us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 28.00%  138.43us        56  2.4720us     576ns  73.313us  [CUDA memcpy HtoD]
 23.68%  117.06us        51  2.2950us     320ns  73.953us  [CUDA memcpy DtoH]
  2.58%  12.768us         4  3.1920us  1.6000us  4.5760us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.51%  2.5280us         1  2.5280us  2.5280us  2.5280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30181== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.79%  245.11ms        10  24.511ms  5.0420us  240.91ms  cudaMalloc
  1.12%  2.8160ms         5  563.20us  9.3310us  2.3629ms  cudaFree
  0.38%  960.68us       101  9.5110us  2.1640us  131.08us  cudaMemcpyAsync
  0.23%  581.64us         6  96.940us  6.6000us  502.88us  cudaLaunch
  0.19%  464.90us         6  77.483us  5.1810us  399.35us  cudaMemcpy
  0.15%  372.25us        90  4.1360us     129ns  145.61us  cuDeviceGetAttribute
  0.08%  207.93us         1  207.93us  207.93us  207.93us  cuDeviceTotalMem
  0.02%  52.334us        24  2.1800us  1.4150us  6.7570us  cudaFuncGetAttributes
  0.01%  35.221us         1  35.221us  35.221us  35.221us  cuDeviceGetName
  0.00%  11.084us        18     615ns     214ns  2.2900us  cudaGetDevice
  0.00%  9.8860us         6  1.6470us     780ns  3.6370us  cudaEventCreateWithFlags
  0.00%  7.3500us         6  1.2250us     220ns  3.9690us  cudaSetupArgument
  0.00%  7.2410us         6  1.2060us     733ns  1.9150us  cudaEventRecord
  0.00%  5.6590us         6     943ns     546ns  1.5000us  cudaEventDestroy
  0.00%  4.0650us         6     677ns     227ns  1.1820us  cudaConfigureCall
  0.00%  3.1880us        11     289ns     207ns     870ns  cudaDeviceGetAttribute
  0.00%  1.7100us         2     855ns     306ns  1.4040us  cuDeviceGetCount
  0.00%     449ns         2     224ns     175ns     274ns  cuDeviceGet
