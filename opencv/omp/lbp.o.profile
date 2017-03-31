==10196== NVPROF is profiling process 10196, command: ./lbp.o
==10196== Profiling application: ./lbp.o
==10196== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.55%  58.146us         1  58.146us  58.146us  58.146us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 32.32%  52.866us         1  52.866us  52.866us  52.866us  [CUDA memcpy DtoH]
 32.13%  52.546us         5  10.509us     544ns  50.018us  [CUDA memcpy HtoD]

==10196== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.65%  264.21ms         4  66.052ms  14.769us  264.13ms  cudaMallocPitch
  0.53%  1.4127ms        90  15.697us     132ns  1.1814ms  cuDeviceGetAttribute
  0.50%  1.3342ms         4  333.55us  11.609us  1.2806ms  cudaMalloc
  0.13%  349.10us         2  174.55us  129.26us  219.85us  cudaMemcpy2D
  0.07%  185.33us         4  46.332us  17.997us  106.02us  cudaMemcpy
  0.06%  161.25us         1  161.25us  161.25us  161.25us  cuDeviceTotalMem
  0.02%  62.984us         1  62.984us  62.984us  62.984us  cudaLaunch
  0.02%  42.973us         1  42.973us  42.973us  42.973us  cuDeviceGetName
  0.01%  28.013us         4  7.0030us  2.1420us  20.910us  cudaFuncGetAttributes
  0.00%  5.8560us         1  5.8560us  5.8560us  5.8560us  cudaSetupArgument
  0.00%  4.9430us        11     449ns     213ns  1.4490us  cudaDeviceGetAttribute
  0.00%  4.5960us         2  2.2980us     819ns  3.7770us  cuDeviceGetCount
  0.00%  3.5730us         3  1.1910us     298ns  2.9110us  cudaGetDevice
  0.00%  3.0350us         1  3.0350us  3.0350us  3.0350us  cudaEventCreateWithFlags
  0.00%  2.7990us         1  2.7990us  2.7990us  2.7990us  cudaEventRecord
  0.00%  1.9450us         1  1.9450us  1.9450us  1.9450us  cudaConfigureCall
  0.00%  1.6590us         2     829ns     701ns     958ns  cuDeviceGet
  0.00%  1.3800us         1  1.3800us  1.3800us  1.3800us  cudaGetLastError
  0.00%  1.1980us         1  1.1980us  1.1980us  1.1980us  cudaEventDestroy
