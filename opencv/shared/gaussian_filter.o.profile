==12799== NVPROF is profiling process 12799, command: ./gaussian_filter.o
==12799== Profiling application: ./gaussian_filter.o
==12799== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.82%  113.57us        19  5.9770us     320ns  98.653us  [CUDA memcpy DtoH]
 35.80%  113.50us        25  4.5390us  1.1840us  84.573us  [CUDA memcpy HtoD]
 23.79%  75.421us         1  75.421us  75.421us  75.421us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  3.37%  10.688us         3  3.5620us  1.5040us  5.0880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.21%  3.8400us         1  3.8400us  3.8400us  3.8400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12799== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.56%  571.55ms        10  57.155ms  5.8980us  570.35ms  cudaMalloc
  0.09%  501.99us        37  13.567us  3.0130us  179.48us  cudaMemcpyAsync
  0.08%  450.12us         7  64.303us  4.7840us  382.26us  cudaMemcpy
  0.08%  447.83us        90  4.9750us     129ns  174.86us  cuDeviceGetAttribute
  0.05%  310.32us         1  310.32us  310.32us  310.32us  cudaGetDeviceProperties
  0.05%  301.60us         4  75.399us  9.7290us  182.41us  cudaFree
  0.04%  210.87us         1  210.87us  210.87us  210.87us  cuDeviceTotalMem
  0.02%  101.21us         5  20.242us  10.531us  28.045us  cudaLaunch
  0.02%  96.298us         1  96.298us  96.298us  96.298us  cuDeviceGetName
  0.01%  41.953us        16  2.6220us  1.9010us  5.6360us  cudaFuncGetAttributes
  0.00%  8.1210us         8  1.0150us     171ns  5.9000us  cudaSetupArgument
  0.00%  7.4500us        12     620ns     244ns  1.9180us  cudaGetDevice
  0.00%  7.3400us         4  1.8350us  1.0910us  2.4620us  cudaEventCreateWithFlags
  0.00%  7.0620us         2  3.5310us  3.4810us  3.5810us  cuDeviceGetCount
  0.00%  5.7460us         4  1.4360us     909ns  1.9160us  cudaEventRecord
  0.00%  4.9530us        11     450ns     297ns  1.1330us  cudaDeviceGetAttribute
  0.00%  4.1950us         4  1.0480us     762ns  1.3870us  cudaEventDestroy
  0.00%  3.8650us         5     773ns     311ns  1.2360us  cudaConfigureCall
  0.00%  1.0480us         2     524ns     428ns     620ns  cuDeviceGet
