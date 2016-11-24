==5483== NVPROF is profiling process 5483, command: ./blend.o
==5483== Profiling application: ./blend.o
==5483== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 43.66%  45.821us         5  9.1640us  1.2160us  21.598us  [CUDA memcpy HtoD]
 26.83%  28.158us         1  28.158us  28.158us  28.158us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 21.83%  22.910us         1  22.910us  22.910us  22.910us  [CUDA memcpy DtoH]
  7.68%  8.0640us         3  2.6880us  2.2080us  3.5200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5483== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.24%  479.08ms         6  79.847ms  7.0690us  476.87ms  cudaMalloc
  0.51%  2.4821ms         3  827.36us  8.0660us  2.4433ms  cudaFree
  0.09%  415.47us        90  4.6160us     131ns  161.19us  cuDeviceGetAttribute
  0.04%  214.94us         1  214.94us  214.94us  214.94us  cuDeviceTotalMem
  0.03%  165.72us         4  41.430us  8.5030us  111.30us  cudaMemcpy
  0.03%  120.87us         2  60.436us  57.798us  63.075us  cudaMemcpyAsync
  0.02%  105.48us         4  26.370us  12.464us  34.100us  cudaLaunch
  0.01%  48.059us        16  3.0030us  2.2490us  5.7840us  cudaFuncGetAttributes
  0.01%  42.124us         1  42.124us  42.124us  42.124us  cuDeviceGetName
  0.00%  9.7620us         4  2.4400us  1.5200us  2.8460us  cudaEventCreateWithFlags
  0.00%  9.5240us        12     793ns     318ns  2.6260us  cudaGetDevice
  0.00%  7.4160us         4  1.8540us     383ns  5.1150us  cudaSetupArgument
  0.00%  7.1400us         4  1.7850us  1.1330us  2.0400us  cudaEventRecord
  0.00%  5.6650us         4  1.4160us     934ns  1.6750us  cudaEventDestroy
  0.00%  4.7770us        11     434ns     276ns  1.1080us  cudaDeviceGetAttribute
  0.00%  3.5940us         4     898ns     463ns  1.2690us  cudaConfigureCall
  0.00%  3.1190us         2  1.5590us  1.5030us  1.6160us  cuDeviceGetCount
  0.00%     765ns         2     382ns     330ns     435ns  cuDeviceGet
