==8277== NVPROF is profiling process 8277, command: ./harris.o
==8277== Profiling application: ./harris.o
==8277== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.65%  127.84us         1  127.84us  127.84us  127.84us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.92%  107.88us        23  4.6900us     543ns  95.155us  [CUDA memcpy HtoD]
 28.57%  99.664us        19  5.2450us     319ns  90.677us  [CUDA memcpy DtoH]
  3.86%  13.465us         4  3.3660us  1.4710us  4.7340us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8277== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.46%  987.89ms         8  123.49ms  7.8680us  977.34ms  cudaMalloc
  0.37%  3.6976ms         4  924.40us  17.246us  2.7291ms  cudaFree
  0.06%  581.30us         5  116.26us  8.5000us  491.00us  cudaMemcpy
  0.04%  363.33us        37  9.8190us  3.2090us  120.89us  cudaMemcpyAsync
  0.02%  211.54us        90  2.3500us     132ns  68.666us  cuDeviceGetAttribute
  0.02%  195.55us         1  195.55us  195.55us  195.55us  cuDeviceTotalMem
  0.01%  132.99us         5  26.597us  14.474us  37.184us  cudaLaunch
  0.01%  56.358us        20  2.8170us  1.4110us  6.3120us  cudaFuncGetAttributes
  0.00%  47.965us         1  47.965us  47.965us  47.965us  cuDeviceGetName
  0.00%  11.945us         5  2.3890us  1.4690us  2.7490us  cudaEventCreateWithFlags
  0.00%  10.529us        15     701ns     215ns  2.4810us  cudaGetDevice
  0.00%  9.4860us         5  1.8970us  1.2010us  2.3750us  cudaEventRecord
  0.00%  7.6530us         2  3.8260us     795ns  6.8580us  cuDeviceGetCount
  0.00%  6.4650us         5  1.2930us     994ns  1.6750us  cudaEventDestroy
  0.00%  6.1700us         5  1.2340us     303ns  4.0470us  cudaSetupArgument
  0.00%  5.3540us         5  1.0700us     367ns  2.7290us  cudaConfigureCall
  0.00%  3.8870us        11     353ns     211ns  1.2210us  cudaDeviceGetAttribute
  0.00%     929ns         2     464ns     187ns     742ns  cuDeviceGet
