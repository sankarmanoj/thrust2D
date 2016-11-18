==8556== NVPROF is profiling process 8556, command: ./lbp.o
==8556== Profiling application: ./lbp.o
==8556== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.16%  131.84us         1  131.84us  131.84us  131.84us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 32.47%  109.31us         5  21.862us  1.1840us  104.48us  [CUDA memcpy HtoD]
 23.87%  80.350us         1  80.350us  80.350us  80.350us  [CUDA memcpy DtoH]
  3.36%  11.296us         3  3.7650us  2.8160us  4.2560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.15%  3.8720us         1  3.8720us  3.8720us  3.8720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8556== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.69%  651.79ms         8  81.474ms  7.8810us  650.20ms  cudaMalloc
  0.07%  450.95us         4  112.74us  21.644us  234.58us  cudaFree
  0.06%  412.19us         5  82.438us  7.7490us  343.88us  cudaMemcpy
  0.06%  393.66us        90  4.3730us     119ns  138.46us  cuDeviceGetAttribute
  0.03%  217.35us         1  217.35us  217.35us  217.35us  cudaMemcpyAsync
  0.03%  197.65us         1  197.65us  197.65us  197.65us  cuDeviceTotalMem
  0.03%  170.31us         5  34.061us  9.9010us  51.609us  cudaLaunch
  0.01%  65.285us        20  3.2640us  1.9610us  8.5990us  cudaFuncGetAttributes
  0.00%  31.860us         1  31.860us  31.860us  31.860us  cuDeviceGetName
  0.00%  13.144us        15     876ns     292ns  2.6170us  cudaGetDevice
  0.00%  11.755us         5  2.3510us  1.1740us  3.2390us  cudaEventCreateWithFlags
  0.00%  9.8050us         5  1.9610us  1.0050us  2.9770us  cudaEventRecord
  0.00%  9.1860us         5  1.8370us     265ns  6.0820us  cudaSetupArgument
  0.00%  6.8080us         5  1.3610us     973ns  1.9840us  cudaEventDestroy
  0.00%  6.0670us        11     551ns     391ns  1.4990us  cudaDeviceGetAttribute
  0.00%  5.4000us         5  1.0800us     415ns  1.4470us  cudaConfigureCall
  0.00%  2.5370us         2  1.2680us     264ns  2.2730us  cuDeviceGetCount
  0.00%  1.6480us         1  1.6480us  1.6480us  1.6480us  cudaGetLastError
  0.00%     498ns         2     249ns     194ns     304ns  cuDeviceGet
