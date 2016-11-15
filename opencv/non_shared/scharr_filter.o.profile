==8345== NVPROF is profiling process 8345, command: ./scharr_filter.o
==8345== Profiling application: ./scharr_filter.o
==8345== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.77%  438.03us         2  219.02us  218.84us  219.19us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.65%  113.06us        28  4.0370us     543ns  97.809us  [CUDA memcpy HtoD]
 13.75%  106.09us         1  106.09us  106.09us  106.09us  [CUDA memcpy DtoH]
  5.00%  38.606us         1  38.606us  38.606us  38.606us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.49%  34.671us         2  17.335us  17.207us  17.464us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.61%  27.857us         8  3.4820us     960ns  4.7010us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.39%  10.746us         2  5.3730us  5.2770us  5.4690us  [CUDA memcpy DtoD]
  0.33%  2.5260us         1  2.5260us  2.5260us  2.5260us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8345== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.93%  888.38ms        18  49.355ms  3.9910us  887.75ms  cudaMalloc
  0.32%  2.8353ms        90  31.503us     104ns  1.7401ms  cuDeviceGetAttribute
  0.31%  2.7435ms         1  2.7435ms  2.7435ms  2.7435ms  cuDeviceGetName
  0.20%  1.8210ms         7  260.14us  10.938us  1.4623ms  cudaFree
  0.06%  550.98us        12  45.914us  4.9750us  465.05us  cudaMemcpy
  0.05%  448.72us         1  448.72us  448.72us  448.72us  cuDeviceTotalMem
  0.05%  444.05us         2  222.02us  221.97us  222.08us  cudaDeviceSynchronize
  0.04%  327.09us         2  163.55us  149.94us  177.15us  cudaGetDeviceProperties
  0.02%  163.78us        19  8.6190us  1.9220us  125.18us  cudaMemcpyAsync
  0.01%  119.34us        14  8.5240us  5.9040us  13.866us  cudaLaunch
  0.01%  78.093us        50  1.5610us  1.3680us  3.2690us  cudaFuncGetAttributes
  0.00%  18.798us        12  1.5660us     560ns  9.9210us  cudaEventRecord
  0.00%  12.675us        38     333ns     204ns  1.2640us  cudaGetDevice
  0.00%  11.860us        12     988ns     702ns  1.5510us  cudaEventCreateWithFlags
  0.00%  8.6790us        12     723ns     512ns  1.1960us  cudaEventDestroy
  0.00%  6.5420us        22     297ns     118ns  2.5060us  cudaSetupArgument
  0.00%  5.3100us        19     279ns     202ns     939ns  cudaDeviceGetAttribute
  0.00%  3.8330us        14     273ns     167ns     669ns  cudaConfigureCall
  0.00%  2.7870us         2  1.3930us     392ns  2.3950us  cuDeviceGetCount
  0.00%  1.6640us         2     832ns     682ns     982ns  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     869ns         3     289ns     263ns     325ns  cudaGetLastError
  0.00%     761ns         2     380ns     228ns     533ns  cuDeviceGet
