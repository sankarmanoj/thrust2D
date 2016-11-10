==8319== NVPROF is profiling process 8319, command: ./sift.o
==8319== Profiling application: ./sift.o
==8319== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 69.10%  692.05us         1  692.05us  692.05us  692.05us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 17.99%  180.17us         9  20.018us     544ns  175.37us  [CUDA memcpy HtoD]
 10.61%  106.25us         1  106.25us  106.25us  106.25us  [CUDA memcpy DtoH]
  1.37%  13.689us         5  2.7370us     959ns  4.1260us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.93%  9.3400us         3  3.1130us     992ns  7.3240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8319== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.31%  842.83ms        16  52.677ms  5.0900us  827.11ms  cudaMalloc
  1.53%  13.283ms        90  147.58us     104ns  7.7518ms  cuDeviceGetAttribute
  0.63%  5.4470ms         8  680.88us  5.8940us  3.7948ms  cudaFree
  0.19%  1.6035ms         9  178.17us  5.2490us  1.0931ms  cudaMemcpy
  0.14%  1.2024ms         1  1.2024ms  1.2024ms  1.2024ms  cuDeviceGetName
  0.09%  787.65us         3  262.55us     126ns  775.20us  cudaMemcpyAsync
  0.05%  407.29us         1  407.29us  407.29us  407.29us  cuDeviceTotalMem
  0.04%  347.46us         9  38.607us  7.3050us  72.924us  cudaLaunch
  0.01%  106.87us        36  2.9680us  1.3510us  13.273us  cudaFuncGetAttributes
  0.00%  29.920us        27  1.1080us     201ns  8.7370us  cudaGetDevice
  0.00%  18.204us         9  2.0220us     866ns  4.7440us  cudaEventCreateWithFlags
  0.00%  16.725us         9  1.8580us     177ns  9.7420us  cudaSetupArgument
  0.00%  12.974us         9  1.4410us     649ns  2.1530us  cudaEventRecord
  0.00%  10.145us         9  1.1270us     552ns  1.8840us  cudaEventDestroy
  0.00%  9.3270us         9  1.0360us     195ns  2.6890us  cudaConfigureCall
  0.00%  5.3910us        11     490ns     207ns  2.6250us  cudaDeviceGetAttribute
  0.00%  4.2610us         2  2.1300us  1.1110us  3.1500us  cuDeviceGetCount
  0.00%  1.5480us         2     774ns     664ns     884ns  cuDeviceGet
