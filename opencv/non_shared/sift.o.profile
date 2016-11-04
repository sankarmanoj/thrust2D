==3486== NVPROF is profiling process 3486, command: ./sift.o
==3486== Profiling application: ./sift.o
==3486== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.24%  679.76us         1  679.76us  679.76us  679.76us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 36.56%  458.24us        11  41.657us     576ns  347.93us  [CUDA memcpy HtoD]
  5.90%  73.956us         1  73.956us  73.956us  73.956us  [CUDA memcpy DtoH]
  2.58%  32.290us         5  6.4580us  1.3440us  18.113us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.72%  8.9930us         3  2.9970us  1.3450us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3486== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.40%  445.44ms        16  27.840ms  7.6920us  435.83ms  cudaMalloc
  1.03%  4.6765ms         8  584.57us  6.7300us  2.1466ms  cudaFree
  0.22%  976.36us         9  108.48us  7.3770us  873.86us  cudaMemcpy
  0.12%  548.60us         3  182.87us  36.165us  401.21us  cudaMemcpyAsync
  0.09%  399.88us        90  4.4430us     117ns  157.37us  cuDeviceGetAttribute
  0.05%  215.40us         1  215.40us  215.40us  215.40us  cuDeviceTotalMem
  0.04%  171.54us         9  19.059us  9.9700us  29.918us  cudaLaunch
  0.02%  102.13us        36  2.8360us  1.4420us  5.2460us  cudaFuncGetAttributes
  0.01%  49.787us         1  49.787us  49.787us  49.787us  cuDeviceGetName
  0.00%  20.032us        27     741ns     209ns  2.6730us  cudaGetDevice
  0.00%  15.852us         9  1.7610us  1.2370us  2.4110us  cudaEventCreateWithFlags
  0.00%  12.197us         9  1.3550us     986ns  1.8500us  cudaEventRecord
  0.00%  9.6290us         9  1.0690us     885ns  1.3190us  cudaEventDestroy
  0.00%  7.7620us         9     862ns     299ns  3.9350us  cudaSetupArgument
  0.00%  5.7110us         9     634ns     346ns     948ns  cudaConfigureCall
  0.00%  4.6930us        11     426ns     244ns  1.1250us  cudaDeviceGetAttribute
  0.00%  4.0600us         2  2.0300us  1.9990us  2.0610us  cuDeviceGetCount
  0.00%  1.1570us         2     578ns     537ns     620ns  cuDeviceGet
