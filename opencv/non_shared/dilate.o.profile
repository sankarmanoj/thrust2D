==8348== NVPROF is profiling process 8348, command: ./dilate.o
==8348== Profiling application: ./dilate.o
==8348== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.52%  98.321us         5  19.664us     576ns  95.794us  [CUDA memcpy HtoD]
 30.53%  84.503us         1  84.503us  84.503us  84.503us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 28.53%  78.970us         1  78.970us  78.970us  78.970us  [CUDA memcpy DtoH]
  4.49%  12.443us         3  4.1470us  3.6790us  4.8620us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.94%  2.5900us         1  2.5900us  2.5900us  2.5900us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8348== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.59%  853.03ms         8  106.63ms  7.1960us  852.31ms  cudaMalloc
  1.19%  10.320ms        90  114.67us      99ns  5.4012ms  cuDeviceGetAttribute
  0.07%  602.65us         1  602.65us  602.65us  602.65us  cuDeviceTotalMem
  0.05%  452.24us         5  90.447us  7.3670us  404.02us  cudaMemcpy
  0.03%  238.93us         1  238.93us  238.93us  238.93us  cuDeviceGetName
  0.03%  238.44us         4  59.609us  9.3970us  112.87us  cudaFree
  0.01%  110.27us         1  110.27us  110.27us  110.27us  cudaMemcpyAsync
  0.01%  99.289us         5  19.857us  9.9100us  40.497us  cudaLaunch
  0.01%  66.521us        20  3.3260us  2.3250us  7.2780us  cudaFuncGetAttributes
  0.00%  10.571us        15     704ns     389ns  2.9590us  cudaGetDevice
  0.00%  8.9020us         5  1.7800us  1.0200us  3.0860us  cudaEventRecord
  0.00%  8.2380us         5  1.6470us  1.2620us  2.8980us  cudaEventCreateWithFlags
  0.00%  6.2950us        11     572ns     323ns  1.5610us  cudaDeviceGetAttribute
  0.00%  5.9930us         5  1.1980us     310ns  3.8210us  cudaSetupArgument
  0.00%  5.7080us         5  1.1410us     874ns  1.7030us  cudaEventDestroy
  0.00%  3.3950us         5     679ns     333ns  1.7990us  cudaConfigureCall
  0.00%  2.3270us         2  1.1630us     528ns  1.7990us  cuDeviceGetCount
  0.00%     543ns         2     271ns     169ns     374ns  cuDeviceGet
