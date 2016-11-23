==3466== NVPROF is profiling process 3466, command: ./pyrup.o
==3466== Profiling application: ./pyrup.o
==3466== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.40%  167.76us        25  6.7100us     704ns  149.42us  [CUDA memcpy HtoD]
 25.96%  100.35us         1  100.35us  100.35us  100.35us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 14.34%  55.440us         5  11.088us  1.9200us  22.023us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 12.39%  47.885us        19  2.5200us     320ns  37.291us  [CUDA memcpy DtoH]
  2.89%  11.171us         1  11.171us  11.171us  11.171us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.01%  3.9050us         1  3.9050us  3.9050us  3.9050us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3466== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.58%  459.71ms        12  38.309ms  5.1750us  458.61ms  cudaMalloc
  0.09%  398.40us        37  10.767us  2.2700us  185.67us  cudaMemcpyAsync
  0.08%  364.96us        90  4.0550us     134ns  135.59us  cuDeviceGetAttribute
  0.08%  353.26us         7  50.465us  5.6560us  276.58us  cudaMemcpy
  0.07%  339.89us         6  56.648us  8.0270us  177.19us  cudaFree
  0.04%  191.25us         1  191.25us  191.25us  191.25us  cuDeviceTotalMem
  0.03%  152.54us         8  19.067us  7.1210us  49.349us  cudaLaunch
  0.01%  59.687us        32  1.8650us  1.4060us  5.0520us  cudaFuncGetAttributes
  0.01%  37.909us         1  37.909us  37.909us  37.909us  cuDeviceGetName
  0.00%  13.970us         8  1.7460us     708ns  5.0660us  cudaEventCreateWithFlags
  0.00%  11.252us        24     468ns     222ns  1.5300us  cudaGetDevice
  0.00%  9.8340us         8  1.2290us     580ns  2.7830us  cudaEventRecord
  0.00%  8.3040us         8  1.0380us     463ns  2.4000us  cudaEventDestroy
  0.00%  7.5230us         8     940ns     203ns  3.5800us  cudaSetupArgument
  0.00%  4.1830us         8     522ns     219ns  1.2630us  cudaConfigureCall
  0.00%  3.6070us        11     327ns     208ns     981ns  cudaDeviceGetAttribute
  0.00%  1.7350us         2     867ns     646ns  1.0890us  cuDeviceGetCount
  0.00%     698ns         2     349ns     220ns     478ns  cuDeviceGet
