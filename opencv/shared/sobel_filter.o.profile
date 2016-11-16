==12656== NVPROF is profiling process 12656, command: ./sobel_filter.o
==12656== Profiling application: ./sobel_filter.o
==12656== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.00%  375.54us         1  375.54us  375.54us  375.54us  [CUDA memcpy DtoH]
 27.57%  240.73us        30  8.0240us     544ns  224.38us  [CUDA memcpy HtoD]
 17.69%  154.49us         2  77.245us  76.222us  78.269us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  4.82%  42.110us         1  42.110us  42.110us  42.110us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.50%  39.262us         2  19.631us  19.135us  20.127us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.12%  18.528us         6  3.0880us     960ns  4.3520us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.30%  2.6240us         1  2.6240us  2.6240us  2.6240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12656== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.99%  432.82ms        18  24.046ms  4.6530us  427.95ms  cudaMalloc
  1.10%  4.9182ms         2  2.4591ms  760.89us  4.1573ms  cudaGetDeviceProperties
  0.65%  2.8900ms         7  412.85us  65.808us  1.2548ms  cudaFree
  0.62%  2.7797ms        90  30.885us     139ns  2.3432ms  cuDeviceGetAttribute
  0.38%  1.7152ms        12  142.93us  3.4870us  1.5365ms  cudaMemcpy
  0.07%  312.05us        19  16.423us  2.9640us  253.29us  cudaMemcpyAsync
  0.06%  261.96us        12  21.829us  8.3970us  57.795us  cudaLaunch
  0.04%  198.25us         1  198.25us  198.25us  198.25us  cuDeviceTotalMem
  0.03%  141.88us         1  141.88us  141.88us  141.88us  cuDeviceGetName
  0.02%  93.792us        40  2.3440us  1.3890us  6.4830us  cudaFuncGetAttributes
  0.01%  32.471us        30  1.0820us     201ns  10.584us  cudaGetDevice
  0.00%  17.340us        10  1.7340us  1.0960us  2.7360us  cudaEventCreateWithFlags
  0.00%  13.273us        10  1.3270us     506ns  2.2360us  cudaEventRecord
  0.00%  11.533us         2  5.7660us  3.5670us  7.9660us  cuDeviceGetCount
  0.00%  10.354us        10  1.0350us     482ns  1.5780us  cudaEventDestroy
  0.00%  9.0250us        18     501ns     112ns  3.4100us  cudaSetupArgument
  0.00%  8.6250us        12     718ns     184ns  2.7240us  cudaConfigureCall
  0.00%  6.0350us        11     548ns     285ns  2.3200us  cudaDeviceGetAttribute
  0.00%  5.2920us         1  5.2920us  5.2920us  5.2920us  cudaGetLastError
  0.00%  2.4590us         2  1.2290us     462ns  1.9970us  cuDeviceGet
