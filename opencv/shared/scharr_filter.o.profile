==9586== NVPROF is profiling process 9586, command: ./scharr_filter.o
==9586== Profiling application: ./scharr_filter.o
==9586== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.50%  108.26us        26  4.1630us     576ns  81.888us  [CUDA memcpy HtoD]
 31.66%  93.888us         1  93.888us  93.888us  93.888us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 27.78%  82.400us         1  82.400us  82.400us  82.400us  [CUDA memcpy DtoH]
  3.20%  9.5040us         4  2.3760us     960ns  4.2240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.85%  2.5280us         1  2.5280us  2.5280us  2.5280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9586== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.13%  1.12696s        12  93.913ms  5.2800us  1.12456s  cudaMalloc
  2.34%  27.427ms        90  304.75us     100ns  12.359ms  cuDeviceGetAttribute
  0.87%  10.198ms         1  10.198ms  10.198ms  10.198ms  cudaGetDeviceProperties
  0.32%  3.7996ms         1  3.7996ms  3.7996ms  3.7996ms  cuDeviceTotalMem
  0.18%  2.1235ms         1  2.1235ms  2.1235ms  2.1235ms  cuDeviceGetName
  0.06%  760.00us         8  95.000us  4.0310us  673.27us  cudaMemcpy
  0.06%  697.73us         5  139.55us  4.4110us  397.18us  cudaFree
  0.01%  132.84us        19  6.9910us  2.9900us  72.024us  cudaMemcpyAsync
  0.01%  118.19us         6  19.698us  9.8000us  44.248us  cudaLaunch
  0.00%  53.442us        20  2.6720us  1.4560us  7.2480us  cudaFuncGetAttributes
  0.00%  10.211us        15     680ns     218ns  3.5170us  cudaGetDevice
  0.00%  8.2830us         9     920ns     156ns  5.8150us  cudaSetupArgument
  0.00%  7.1780us         5  1.4350us  1.0720us  2.4440us  cudaEventCreateWithFlags
  0.00%  5.9230us         5  1.1840us     918ns  2.0290us  cudaEventRecord
  0.00%  5.6670us         5  1.1330us     794ns  2.2620us  cudaEventDestroy
  0.00%  5.6200us        11     510ns     280ns  1.3880us  cudaDeviceGetAttribute
  0.00%  3.6930us         6     615ns     247ns  1.6020us  cudaConfigureCall
  0.00%  2.6100us         2  1.3050us     391ns  2.2190us  cuDeviceGetCount
  0.00%  1.1040us         1  1.1040us  1.1040us  1.1040us  cudaGetLastError
  0.00%     691ns         2     345ns     193ns     498ns  cuDeviceGet
