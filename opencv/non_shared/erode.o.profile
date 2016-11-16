==8610== NVPROF is profiling process 8610, command: ./erode.o
==8610== Profiling application: ./erode.o
==8610== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 31.87%  86.047us         1  86.047us  86.047us  86.047us  [CUDA memcpy DtoH]
 31.30%  84.511us         5  16.902us  1.2160us  79.647us  [CUDA memcpy HtoD]
 31.27%  84.446us         1  84.446us  84.446us  84.446us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.60%  12.416us         3  4.1380us  3.7120us  4.8960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.96%  2.5920us         1  2.5920us  2.5920us  2.5920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8610== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.61%  494.14ms         8  61.768ms  8.2530us  481.35ms  cudaMalloc
  1.00%  4.9875ms        90  55.416us     136ns  3.2411ms  cuDeviceGetAttribute
  0.13%  657.10us         5  131.42us  8.9820us  339.59us  cudaMemcpy
  0.08%  377.66us         4  94.415us  16.491us  173.73us  cudaFree
  0.05%  266.86us         1  266.86us  266.86us  266.86us  cuDeviceTotalMem
  0.05%  249.56us         1  249.56us  249.56us  249.56us  cudaMemcpyAsync
  0.03%  173.07us         5  34.613us  12.459us  45.881us  cudaLaunch
  0.02%  91.303us         1  91.303us  91.303us  91.303us  cuDeviceGetName
  0.01%  68.314us        20  3.4150us  1.8780us  9.5460us  cudaFuncGetAttributes
  0.00%  16.736us        15  1.1150us     284ns  3.4260us  cudaGetDevice
  0.00%  12.358us         5  2.4710us  1.4090us  2.9690us  cudaEventCreateWithFlags
  0.00%  9.1740us         5  1.8340us  1.2260us  2.1150us  cudaEventRecord
  0.00%  9.0150us         5  1.8030us     365ns  5.3370us  cudaSetupArgument
  0.00%  7.7120us         5  1.5420us  1.0580us  2.0240us  cudaEventDestroy
  0.00%  6.3360us         5  1.2670us     381ns  1.8890us  cudaConfigureCall
  0.00%  4.7700us        11     433ns     254ns  1.3980us  cudaDeviceGetAttribute
  0.00%  2.8310us         2  1.4150us     608ns  2.2230us  cuDeviceGetCount
  0.00%     628ns         2     314ns     210ns     418ns  cuDeviceGet
