==6735== NVPROF is profiling process 6735, command: ./sift.o
==6735== Profiling application: ./sift.o
==6735== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.50%  621.66us         1  621.66us  621.66us  621.66us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
 41.82%  536.06us        12  44.671us     576ns  399.26us  [CUDA memcpy HtoD]
  6.42%  82.303us         1  82.303us  82.303us  82.303us  [CUDA memcpy DtoH]
  2.45%  31.392us         4  7.8480us  1.7600us  20.128us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.81%  10.431us         3  3.4770us  1.9840us  5.6320us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6735== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.44%  889.25ms        16  55.578ms  5.1910us  881.89ms  cudaMalloc
  3.97%  37.773ms         1  37.773ms  37.773ms  37.773ms  cudaGetDeviceProperties
  1.24%  11.754ms        90  130.60us     105ns  6.7144ms  cuDeviceGetAttribute
  0.91%  8.6867ms         7  1.2410ms  5.7300us  2.3680ms  cudaFree
  0.15%  1.3944ms         1  1.3944ms  1.3944ms  1.3944ms  cuDeviceGetName
  0.07%  711.39us         1  711.39us  711.39us  711.39us  cuDeviceTotalMem
  0.07%  624.35us         1  624.35us  624.35us  624.35us  cudaDeviceSynchronize
  0.06%  612.69us        10  61.269us  7.2190us  416.80us  cudaMemcpy
  0.06%  602.89us         3  200.96us  30.297us  440.08us  cudaMemcpyAsync
  0.02%  146.26us         8  18.282us  10.207us  28.226us  cudaLaunch
  0.01%  62.832us        28  2.2440us  1.4500us  6.0220us  cudaFuncGetAttributes
  0.00%  12.549us        21     597ns     209ns  2.1310us  cudaGetDevice
  0.00%  10.754us         7  1.5360us  1.2430us  1.9570us  cudaEventCreateWithFlags
  0.00%  7.9700us         7  1.1380us     840ns  1.5120us  cudaEventRecord
  0.00%  6.7290us        11     611ns     139ns  3.6580us  cudaSetupArgument
  0.00%  6.4510us         7     921ns     661ns  1.1510us  cudaEventDestroy
  0.00%  4.7210us         8     590ns     295ns     936ns  cudaConfigureCall
  0.00%  3.2620us        11     296ns     213ns     848ns  cudaDeviceGetAttribute
  0.00%  2.0250us         2  1.0120us     489ns  1.5360us  cuDeviceGetCount
  0.00%     504ns         2     252ns     164ns     340ns  cuDeviceGet
