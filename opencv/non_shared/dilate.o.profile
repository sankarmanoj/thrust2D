==23494== NVPROF is profiling process 23494, command: ./dilate.o
==23494== Profiling application: ./dilate.o
==23494== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.23%  91.430us         1  91.430us  91.430us  91.430us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 18.23%  27.673us         5  5.5340us     576ns  23.449us  [CUDA memcpy HtoD]
 15.11%  22.938us         1  22.938us  22.938us  22.938us  [CUDA memcpy DtoH]
  6.43%  9.7580us         4  2.4390us  2.3350us  2.7510us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==23494== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.45%  251.48ms         8  31.435ms  4.5210us  251.07ms  cudaMalloc
  0.16%  401.21us        90  4.4570us     135ns  154.95us  cuDeviceGetAttribute
  0.14%  354.60us         5  70.920us  11.141us  210.04us  cudaMemcpy
  0.09%  226.00us         4  56.499us  4.7420us  165.22us  cudaFree
  0.09%  215.43us         1  215.43us  215.43us  215.43us  cuDeviceTotalMem
  0.02%  50.087us         5  10.017us  6.0970us  17.904us  cudaLaunch
  0.02%  44.754us         1  44.754us  44.754us  44.754us  cudaMemcpyAsync
  0.02%  38.169us         1  38.169us  38.169us  38.169us  cuDeviceGetName
  0.01%  33.742us        20  1.6870us  1.4640us  3.4820us  cudaFuncGetAttributes
  0.00%  5.6190us        15     374ns     225ns  1.4490us  cudaGetDevice
  0.00%  5.4980us         5  1.0990us     223ns  4.1110us  cudaSetupArgument
  0.00%  5.4150us         5  1.0830us     824ns  1.6290us  cudaEventCreateWithFlags
  0.00%  4.5660us         5     913ns     569ns  1.4760us  cudaEventRecord
  0.00%  3.6060us         5     721ns     531ns  1.0410us  cudaEventDestroy
  0.00%  3.1530us        11     286ns     225ns     727ns  cudaDeviceGetAttribute
  0.00%  2.1260us         2  1.0630us     533ns  1.5930us  cuDeviceGetCount
  0.00%  1.9870us         5     397ns     239ns     990ns  cudaConfigureCall
  0.00%     633ns         2     316ns     254ns     379ns  cuDeviceGet
