==29236== NVPROF is profiling process 29236, command: ./dilate.o
==29236== Profiling application: ./dilate.o
==29236== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.27%  146.02us         1  146.02us  146.02us  146.02us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, dilateFunctor)
 26.43%  83.425us         6  13.904us  1.1840us  77.409us  [CUDA memcpy HtoD]
 23.82%  75.168us         1  75.168us  75.168us  75.168us  [CUDA memcpy DtoH]
  2.71%  8.5440us         2  4.2720us  3.7440us  4.8000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.77%  2.4320us         1  2.4320us  2.4320us  2.4320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29236== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.98%  585.11ms         8  73.138ms  7.1040us  583.96ms  cudaMalloc
  0.73%  4.3394ms        90  48.215us     140ns  3.5531ms  cuDeviceGetAttribute
  0.08%  480.95us         6  80.158us  5.1270us  355.33us  cudaMemcpy
  0.07%  390.60us         1  390.60us  390.60us  390.60us  cudaGetDeviceProperties
  0.04%  218.28us         1  218.28us  218.28us  218.28us  cuDeviceTotalMem
  0.04%  212.35us         3  70.782us  32.101us  115.37us  cudaFree
  0.02%  127.91us         1  127.91us  127.91us  127.91us  cudaMemcpyAsync
  0.02%  111.73us         4  27.931us  10.356us  41.017us  cudaLaunch
  0.01%  62.794us         1  62.794us  62.794us  62.794us  cuDeviceGetName
  0.01%  37.383us        12  3.1150us  2.4960us  5.7070us  cudaFuncGetAttributes
  0.00%  7.1240us         7  1.0170us     203ns  5.0930us  cudaSetupArgument
  0.00%  6.6220us         9     735ns     377ns  1.8910us  cudaGetDevice
  0.00%  6.0570us         3  2.0190us  1.1390us  2.4710us  cudaEventCreateWithFlags
  0.00%  4.9250us        11     447ns     353ns     955ns  cudaDeviceGetAttribute
  0.00%  4.7440us         3  1.5810us     924ns  1.9510us  cudaEventRecord
  0.00%  3.6550us         3  1.2180us     803ns  1.5890us  cudaEventDestroy
  0.00%  3.2690us         4     817ns     326ns  1.0660us  cudaConfigureCall
  0.00%  2.3140us         2  1.1570us     604ns  1.7100us  cuDeviceGetCount
  0.00%     627ns         2     313ns     259ns     368ns  cuDeviceGet
  0.00%     492ns         1     492ns     492ns     492ns  cudaGetLastError
