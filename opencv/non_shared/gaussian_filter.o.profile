==3855== NVPROF is profiling process 3855, command: ./gaussian_filter.o
==3855== Profiling application: ./gaussian_filter.o
==3855== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 60.58%  2.5129ms         1  2.5129ms  2.5129ms  2.5129ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.40%  929.22us       728  1.2760us     576ns  73.220us  [CUDA memcpy HtoD]
 16.69%  692.16us       723     957ns     320ns  74.115us  [CUDA memcpy DtoH]
  0.28%  11.457us         4  2.8640us  1.5690us  3.7120us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.06%  2.4960us         1  2.4960us  2.4960us  2.4960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3855== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.55%  882.24ms        10  88.224ms  8.6690us  873.37ms  cudaMalloc
  2.88%  27.187ms         5  5.4374ms  27.803us  13.604ms  cudaFree
  2.06%  19.425ms      1445  13.443us  2.6840us  851.51us  cudaMemcpyAsync
  1.03%  9.7012ms        90  107.79us     104ns  4.9330ms  cuDeviceGetAttribute
  0.30%  2.8050ms         6  467.50us  8.3580us  2.6972ms  cudaMemcpy
  0.13%  1.2317ms         1  1.2317ms  1.2317ms  1.2317ms  cuDeviceTotalMem
  0.02%  189.20us         6  31.533us  12.631us  39.810us  cudaLaunch
  0.01%  94.348us         1  94.348us  94.348us  94.348us  cuDeviceGetName
  0.01%  74.028us        24  3.0840us  1.4280us  6.4220us  cudaFuncGetAttributes
  0.00%  19.510us        18  1.0830us     218ns  4.3370us  cudaGetDevice
  0.00%  13.960us         6  2.3260us  1.4170us  2.6180us  cudaEventCreateWithFlags
  0.00%  11.914us         6  1.9850us  1.2150us  2.3270us  cudaEventRecord
  0.00%  8.6360us         6  1.4390us     352ns  5.2950us  cudaSetupArgument
  0.00%  8.4590us         6  1.4090us     978ns  1.6620us  cudaEventDestroy
  0.00%  6.1150us         6  1.0190us     403ns  1.9130us  cudaConfigureCall
  0.00%  3.7410us        11     340ns     205ns  1.2160us  cudaDeviceGetAttribute
  0.00%  3.1530us         2  1.5760us  1.4810us  1.6720us  cuDeviceGetCount
  0.00%     759ns         2     379ns     376ns     383ns  cuDeviceGet
