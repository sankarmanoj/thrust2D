==9473== NVPROF is profiling process 9473, command: ./sobel_filter.o
==9473== Profiling application: ./sobel_filter.o
==9473== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.40%  105.06us        26  4.0400us     576ns  80.800us  [CUDA memcpy HtoD]
 30.64%  88.416us         1  88.416us  88.416us  88.416us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 28.57%  82.464us         1  82.464us  82.464us  82.464us  [CUDA memcpy DtoH]
  3.49%  10.080us         4  2.5200us     960ns  4.1920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.90%  2.5920us         1  2.5920us  2.5920us  2.5920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9473== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.92%  1.26312s        12  105.26ms  4.7460us  1.25767s  cudaMalloc
  1.84%  23.993ms        90  266.59us     122ns  10.509ms  cuDeviceGetAttribute
  0.71%  9.2350ms         1  9.2350ms  9.2350ms  9.2350ms  cudaGetDeviceProperties
  0.24%  3.1769ms         1  3.1769ms  3.1769ms  3.1769ms  cuDeviceGetName
  0.14%  1.7871ms         5  357.41us  4.3690us  1.0130ms  cudaFree
  0.10%  1.2553ms         1  1.2553ms  1.2553ms  1.2553ms  cuDeviceTotalMem
  0.03%  403.77us         8  50.471us  3.9580us  265.95us  cudaMemcpy
  0.01%  167.19us        19  8.7990us  1.8880us  130.35us  cudaMemcpyAsync
  0.01%  104.30us         6  17.383us  7.1030us  28.008us  cudaLaunch
  0.00%  42.388us        20  2.1190us  1.4640us  8.6550us  cudaFuncGetAttributes
  0.00%  8.1290us        15     541ns     223ns  1.9600us  cudaGetDevice
  0.00%  6.4100us         5  1.2820us     835ns  1.7980us  cudaEventCreateWithFlags
  0.00%  6.1360us         9     681ns     118ns  4.1580us  cudaSetupArgument
  0.00%  4.8730us         5     974ns     645ns  1.4100us  cudaEventRecord
  0.00%  4.4440us         5     888ns     536ns  1.2960us  cudaEventDestroy
  0.00%  3.4660us         6     577ns     200ns  1.0260us  cudaConfigureCall
  0.00%  3.4550us        11     314ns     219ns     986ns  cudaDeviceGetAttribute
  0.00%  1.8470us         2     923ns     157ns  1.6900us  cuDeviceGetCount
  0.00%  1.0180us         1  1.0180us  1.0180us  1.0180us  cudaGetLastError
  0.00%     412ns         2     206ns     128ns     284ns  cuDeviceGet
