==25576== NVPROF is profiling process 25576, command: ./erode.o
==25576== Profiling application: ./erode.o
==25576== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.22%  102.84us         1  102.84us  102.84us  102.84us  [CUDA memcpy DtoH]
 33.83%  86.506us         6  14.417us     545ns  83.496us  [CUDA memcpy HtoD]
 21.33%  54.543us         1  54.543us  54.543us  54.543us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
  3.28%  8.3910us         2  4.1950us  4.1310us  4.2600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.34%  3.4270us         1  3.4270us  3.4270us  3.4270us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25576== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.68%  465.95ms         8  58.244ms  4.7480us  465.57ms  cudaMalloc
  0.10%  476.56us         6  79.426us  3.3440us  440.99us  cudaMemcpy
  0.06%  271.44us        90  3.0150us     130ns  95.507us  cuDeviceGetAttribute
  0.04%  188.40us         1  188.40us  188.40us  188.40us  cudaGetDeviceProperties
  0.04%  183.15us         1  183.15us  183.15us  183.15us  cuDeviceTotalMem
  0.03%  143.43us         3  47.810us  7.5310us  97.805us  cudaFree
  0.02%  70.443us         1  70.443us  70.443us  70.443us  cudaMemcpyAsync
  0.01%  65.136us         4  16.284us  9.7420us  23.003us  cudaLaunch
  0.01%  59.392us         1  59.392us  59.392us  59.392us  cuDeviceGetName
  0.00%  23.163us        12  1.9300us  1.3670us  6.2760us  cudaFuncGetAttributes
  0.00%  8.9890us         2  4.4940us  4.2270us  4.7620us  cuDeviceGetCount
  0.00%  4.0270us         9     447ns     204ns  1.4270us  cudaGetDevice
  0.00%  3.8540us         7     550ns     181ns  2.4490us  cudaSetupArgument
  0.00%  3.5370us         3  1.1790us     962ns  1.5480us  cudaEventCreateWithFlags
  0.00%  3.4640us        11     314ns     205ns     884ns  cudaDeviceGetAttribute
  0.00%  3.1990us         3  1.0660us     774ns  1.5850us  cudaEventRecord
  0.00%  2.5950us         3     865ns     748ns  1.0880us  cudaEventDestroy
  0.00%  1.8100us         4     452ns     307ns     695ns  cudaConfigureCall
  0.00%  1.4870us         2     743ns     435ns  1.0520us  cuDeviceGet
