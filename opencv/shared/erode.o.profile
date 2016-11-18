==6754== NVPROF is profiling process 6754, command: ./erode.o
==6754== Profiling application: ./erode.o
==6754== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.85%  88.768us         6  14.794us  1.0560us  82.752us  [CUDA memcpy HtoD]
 34.21%  82.399us         1  82.399us  82.399us  82.399us  [CUDA memcpy DtoH]
 24.20%  58.304us         1  58.304us  58.304us  58.304us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
  3.56%  8.5760us         2  4.2880us  4.1600us  4.4160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.18%  2.8480us         1  2.8480us  2.8480us  2.8480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6754== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.62%  906.51ms         8  113.31ms  5.2130us  905.70ms  cudaMalloc
  1.05%  9.7645ms         1  9.7645ms  9.7645ms  9.7645ms  cudaGetDeviceProperties
  0.81%  7.5287ms        90  83.652us     105ns  4.2103ms  cuDeviceGetAttribute
  0.32%  2.9480ms         3  982.66us  22.616us  1.7071ms  cudaFree
  0.06%  597.95us         6  99.658us  11.070us  474.66us  cudaMemcpy
  0.06%  513.48us         1  513.48us  513.48us  513.48us  cuDeviceGetName
  0.05%  505.98us         1  505.98us  505.98us  505.98us  cuDeviceTotalMem
  0.01%  112.82us         1  112.82us  112.82us  112.82us  cudaMemcpyAsync
  0.01%  68.477us         4  17.119us  9.0470us  24.882us  cudaLaunch
  0.00%  21.381us        12  1.7810us  1.4430us  3.6410us  cudaFuncGetAttributes
  0.00%  4.7020us         7     671ns     207ns  3.0240us  cudaSetupArgument
  0.00%  3.9690us         9     441ns     216ns  1.2790us  cudaGetDevice
  0.00%  3.4340us         3  1.1440us     919ns  1.5890us  cudaEventCreateWithFlags
  0.00%  3.2250us        11     293ns     211ns     835ns  cudaDeviceGetAttribute
  0.00%  3.0820us         3  1.0270us     798ns  1.4800us  cudaEventRecord
  0.00%  2.8170us         2  1.4080us  1.2770us  1.5400us  cuDeviceGetCount
  0.00%  2.2470us         4     561ns     259ns     889ns  cudaConfigureCall
  0.00%  2.1620us         3     720ns     594ns     908ns  cudaEventDestroy
  0.00%     590ns         2     295ns     266ns     324ns  cuDeviceGet
