==18363== NVPROF is profiling process 18363, command: ./erode.o
==18363== Profiling application: ./erode.o
==18363== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.16%  13.746ms         1  13.746ms  13.746ms  13.746ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.48%  66.976us         1  66.976us  66.976us  66.976us  [CUDA memcpy DtoH]
  0.36%  50.048us         5  10.009us     896ns  45.920us  [CUDA memcpy HtoD]

==18363== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.02%  4.98488s         4  1.24622s  7.3640us  4.98471s  cudaMallocPitch
  0.65%  32.883ms       166  198.09us     160ns  14.173ms  cuDeviceGetAttribute
  0.27%  13.738ms         1  13.738ms  13.738ms  13.738ms  cudaDeviceSynchronize
  0.02%  815.51us         2  407.75us  371.35us  444.15us  cuDeviceTotalMem
  0.01%  627.12us         2  313.56us  260.07us  367.05us  cuDeviceGetName
  0.01%  439.00us         2  219.50us  112.83us  326.17us  cudaMemcpy2D
  0.01%  418.62us         1  418.62us  418.62us  418.62us  cudaLaunch
  0.00%  207.96us         4  51.991us  10.079us  167.42us  cudaMalloc
  0.00%  64.421us         4  16.105us  8.0760us  32.079us  cudaMemcpy
  0.00%  16.932us         4  4.2330us  2.4230us  9.2800us  cudaFuncGetAttributes
  0.00%  7.4860us         1  7.4860us  7.4860us  7.4860us  cudaSetupArgument
  0.00%  6.5490us        11     595ns     352ns  2.1500us  cudaDeviceGetAttribute
  0.00%  4.2510us         2  2.1250us  1.1130us  3.1380us  cuDeviceGetCount
  0.00%  4.0190us         3  1.3390us     372ns  3.1460us  cudaGetDevice
  0.00%  3.1200us         1  3.1200us  3.1200us  3.1200us  cudaEventCreateWithFlags
  0.00%  2.9270us         1  2.9270us  2.9270us  2.9270us  cudaEventRecord
  0.00%  2.4340us         4     608ns     350ns  1.2460us  cuDeviceGet
  0.00%  1.9680us         1  1.9680us  1.9680us  1.9680us  cudaEventDestroy
  0.00%  1.6700us         1  1.6700us  1.6700us  1.6700us  cudaConfigureCall
