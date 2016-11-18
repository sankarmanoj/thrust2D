==10363== NVPROF is profiling process 10363, command: ./dilate.o
==10363== Profiling application: ./dilate.o
==10363== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.87%  87.135us         6  14.522us  1.2160us  81.055us  [CUDA memcpy HtoD]
 35.81%  82.400us         1  82.400us  82.400us  82.400us  [CUDA memcpy DtoH]
 21.13%  48.608us         1  48.608us  48.608us  48.608us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  3.45%  7.9360us         2  3.9680us  3.6480us  4.2880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.74%  4.0000us         1  4.0000us  4.0000us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10363== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.19%  175.34ms         8  21.918ms  5.3250us  174.55ms  cudaMalloc
  0.17%  308.79us        90  3.4300us     101ns  120.21us  cuDeviceGetAttribute
  0.15%  269.68us         6  44.946us  4.0360us  237.02us  cudaMemcpy
  0.13%  227.89us         1  227.89us  227.89us  227.89us  cudaGetDeviceProperties
  0.12%  217.14us         3  72.380us  8.5990us  136.74us  cudaFree
  0.12%  216.64us         1  216.64us  216.64us  216.64us  cuDeviceTotalMem
  0.03%  60.527us         1  60.527us  60.527us  60.527us  cudaMemcpyAsync
  0.03%  50.141us         4  12.535us  8.6400us  19.892us  cudaLaunch
  0.02%  30.139us         1  30.139us  30.139us  30.139us  cuDeviceGetName
  0.01%  21.064us        12  1.7550us  1.4580us  3.4430us  cudaFuncGetAttributes
  0.00%  4.7550us         7     679ns     120ns  3.6040us  cudaSetupArgument
  0.00%  3.8240us         9     424ns     207ns  1.4180us  cudaGetDevice
  0.00%  3.6850us         3  1.2280us     977ns  1.6750us  cudaEventCreateWithFlags
  0.00%  3.1300us         3  1.0430us     765ns  1.5120us  cudaEventRecord
  0.00%  2.9810us        11     271ns     209ns     723ns  cudaDeviceGetAttribute
  0.00%  2.2710us         3     757ns     658ns     932ns  cudaEventDestroy
  0.00%  1.6650us         4     416ns     239ns     817ns  cudaConfigureCall
  0.00%  1.6030us         2     801ns     381ns  1.2220us  cuDeviceGetCount
  0.00%     384ns         2     192ns     156ns     228ns  cuDeviceGet
