==8636== NVPROF is profiling process 8636, command: ./dilate.o
==8636== Profiling application: ./dilate.o
==8636== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 32.67%  93.471us         5  18.694us  1.2160us  88.607us  [CUDA memcpy HtoD]
 32.55%  93.118us         1  93.118us  93.118us  93.118us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 28.81%  82.431us         1  82.431us  82.431us  82.431us  [CUDA memcpy DtoH]
  4.51%  12.896us         3  4.2980us  4.1920us  4.4800us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.45%  4.1600us         1  4.1600us  4.1600us  4.1600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8636== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.33%  420.77ms         8  52.597ms  9.0040us  407.32ms  cudaMalloc
  2.60%  11.720ms         1  11.720ms  11.720ms  11.720ms  cuDeviceGetName
  2.49%  11.209ms        90  124.55us     119ns  5.6022ms  cuDeviceGetAttribute
  1.06%  4.7579ms         4  1.1895ms  23.414us  3.7178ms  cudaFree
  0.23%  1.0174ms         1  1.0174ms  1.0174ms  1.0174ms  cuDeviceTotalMem
  0.14%  637.37us         1  637.37us  637.37us  637.37us  cudaMemcpyAsync
  0.09%  401.39us         5  80.277us  11.260us  305.30us  cudaMemcpy
  0.04%  186.92us         5  37.384us  32.868us  47.356us  cudaLaunch
  0.02%  70.400us        20  3.5200us  1.9050us  7.2930us  cudaFuncGetAttributes
  0.00%  17.380us         5  3.4760us  2.2500us  7.6170us  cudaEventCreateWithFlags
  0.00%  16.377us        15  1.0910us     331ns  3.2910us  cudaGetDevice
  0.00%  10.883us         5  2.1760us     524ns  5.1670us  cudaSetupArgument
  0.00%  10.126us         5  2.0250us  1.8260us  2.2890us  cudaEventRecord
  0.00%  7.0040us         5  1.4000us  1.2890us  1.4550us  cudaEventDestroy
  0.00%  4.8590us         5     971ns     791ns  1.1130us  cudaConfigureCall
  0.00%  4.4170us        11     401ns     261ns  1.1170us  cudaDeviceGetAttribute
  0.00%  2.9410us         2  1.4700us     767ns  2.1740us  cuDeviceGetCount
  0.00%     745ns         2     372ns     236ns     509ns  cuDeviceGet
