==5594== NVPROF is profiling process 5594, command: ./sift.o
==5594== Profiling application: ./sift.o
==5594== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.34%  197.59us         1  197.59us  197.59us  197.59us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 32.05%  112.41us        11  10.218us  1.1840us  72.987us  [CUDA memcpy HtoD]
  6.24%  21.888us         8  2.7360us  1.2480us  4.7680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.36%  18.814us         1  18.814us  18.814us  18.814us  [CUDA memcpy DtoH]

==5594== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.15%  180.69ms        16  11.293ms  4.5910us  179.58ms  cudaMalloc
  0.18%  328.48us         8  41.059us  4.8210us  128.35us  cudaFree
  0.18%  325.19us         9  36.132us  4.3740us  277.81us  cudaMemcpy
  0.17%  311.12us        90  3.4560us     102ns  122.73us  cuDeviceGetAttribute
  0.11%  194.40us         1  194.40us  194.40us  194.40us  cuDeviceTotalMem
  0.09%  160.79us         3  53.595us  15.917us  98.436us  cudaMemcpyAsync
  0.05%  88.352us         9  9.8160us  5.3710us  22.592us  cudaLaunch
  0.03%  58.687us        36  1.6300us  1.3990us  3.8720us  cudaFuncGetAttributes
  0.02%  34.259us         1  34.259us  34.259us  34.259us  cuDeviceGetName
  0.01%  9.6580us        27     357ns     211ns  1.6420us  cudaGetDevice
  0.00%  8.6750us         9     963ns     603ns  1.7410us  cudaEventCreateWithFlags
  0.00%  7.4150us         9     823ns     552ns  1.3770us  cudaEventRecord
  0.00%  6.5920us         9     732ns     220ns  3.8140us  cudaSetupArgument
  0.00%  5.6580us         9     628ns     495ns  1.0030us  cudaEventDestroy
  0.00%  3.2640us         9     362ns     198ns     894ns  cudaConfigureCall
  0.00%  2.9530us        11     268ns     203ns     667ns  cudaDeviceGetAttribute
  0.00%  1.7820us         2     891ns     441ns  1.3410us  cuDeviceGetCount
  0.00%     400ns         2     200ns     184ns     216ns  cuDeviceGet
