==22940== NVPROF is profiling process 22940, command: ./lbp.o
==22940== Profiling application: ./lbp.o
==22940== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.98%  104.80us         1  104.80us  104.80us  104.80us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 21.03%  36.736us         5  7.3470us  1.1840us  31.904us  [CUDA memcpy HtoD]
 13.30%  23.232us         1  23.232us  23.232us  23.232us  [CUDA memcpy DtoH]
  5.70%  9.9530us         4  2.4880us  2.1440us  3.3930us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==22940== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.90%  564.86ms         8  70.607ms  4.6890us  561.99ms  cudaMalloc
  0.67%  3.8488ms        90  42.764us     118ns  2.6653ms  cuDeviceGetAttribute
  0.25%  1.4024ms         4  350.60us  6.3210us  1.3629ms  cudaFree
  0.07%  398.29us         1  398.29us  398.29us  398.29us  cuDeviceTotalMem
  0.04%  202.81us         5  40.562us  4.8110us  170.44us  cudaMemcpy
  0.03%  182.85us         1  182.85us  182.85us  182.85us  cuDeviceGetName
  0.02%  99.441us         5  19.888us  5.9490us  37.732us  cudaLaunch
  0.01%  57.608us         1  57.608us  57.608us  57.608us  cudaMemcpyAsync
  0.01%  38.861us        20  1.9430us  1.4110us  5.5780us  cudaFuncGetAttributes
  0.00%  8.9940us         5  1.7980us     720ns  2.7210us  cudaEventCreateWithFlags
  0.00%  8.1320us        15     542ns     209ns  1.9830us  cudaGetDevice
  0.00%  7.3100us         5  1.4620us     210ns  5.4310us  cudaSetupArgument
  0.00%  5.3440us         5  1.0680us     602ns  1.6250us  cudaEventRecord
  0.00%  4.3820us         5     876ns     509ns  1.2360us  cudaEventDestroy
  0.00%  3.8450us        11     349ns     218ns  1.3010us  cudaDeviceGetAttribute
  0.00%  3.7090us         5     741ns     180ns  1.6710us  cudaConfigureCall
  0.00%  2.4900us         2  1.2450us     897ns  1.5930us  cuDeviceGetCount
  0.00%  1.9230us         1  1.9230us  1.9230us  1.9230us  cudaGetLastError
  0.00%     568ns         2     284ns     230ns     338ns  cuDeviceGet
