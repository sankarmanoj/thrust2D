==30044== NVPROF is profiling process 30044, command: ./harris.o
==30044== Profiling application: ./harris.o
==30044== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.48%  127.78us         1  127.78us  127.78us  127.78us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 29.65%  98.466us        23  4.2810us     576ns  73.857us  [CUDA memcpy HtoD]
 27.19%  90.273us        19  4.7510us     320ns  75.777us  [CUDA memcpy DtoH]
  4.68%  15.552us         4  3.8880us  1.2480us  5.6960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30044== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.48%  727.85ms         8  90.981ms  8.1730us  720.71ms  cudaMalloc
  0.22%  1.5813ms         4  395.31us  25.883us  1.0387ms  cudaFree
  0.12%  906.27us        37  24.493us  2.3170us  471.74us  cudaMemcpyAsync
  0.06%  408.99us        90  4.5440us     120ns  162.88us  cuDeviceGetAttribute
  0.05%  370.22us         5  74.043us  8.0350us  303.17us  cudaMemcpy
  0.03%  230.06us         1  230.06us  230.06us  230.06us  cuDeviceTotalMem
  0.02%  137.72us         5  27.543us  21.400us  33.014us  cudaLaunch
  0.01%  52.266us        20  2.6130us  1.4100us  5.9500us  cudaFuncGetAttributes
  0.01%  41.829us         1  41.829us  41.829us  41.829us  cuDeviceGetName
  0.00%  12.127us         5  2.4250us  1.9340us  3.0620us  cudaEventCreateWithFlags
  0.00%  11.862us        15     790ns     222ns  2.4100us  cudaGetDevice
  0.00%  8.9210us         5  1.7840us  1.4740us  2.1080us  cudaEventRecord
  0.00%  7.6600us         5  1.5320us     627ns  4.6740us  cudaSetupArgument
  0.00%  5.7140us         5  1.1420us     980ns  1.3100us  cudaEventDestroy
  0.00%  4.5050us         5     901ns     791ns  1.0400us  cudaConfigureCall
  0.00%  3.7050us        11     336ns     206ns  1.2700us  cudaDeviceGetAttribute
  0.00%  2.5000us         2  1.2500us     407ns  2.0930us  cuDeviceGetCount
  0.00%     497ns         2     248ns     197ns     300ns  cuDeviceGet
