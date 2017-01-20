==18389== NVPROF is profiling process 18389, command: ./dilate.o
==18389== Profiling application: ./dilate.o
==18389== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.09%  15.133ms         1  15.133ms  15.133ms  15.133ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.63%  96.576us         6  16.096us     896ns  46.432us  [CUDA memcpy HtoD]
  0.28%  42.176us         1  42.176us  42.176us  42.176us  [CUDA memcpy DtoH]

==18389== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.65%  4.87983s         4  1.21996s  6.3740us  4.87980s  cudaMallocPitch
  0.31%  15.125ms         1  15.125ms  15.125ms  15.125ms  cudaDeviceSynchronize
  0.01%  644.54us       166  3.8820us     181ns  143.05us  cuDeviceGetAttribute
  0.01%  577.29us         3  192.43us  114.13us  316.22us  cudaMemcpy2D
  0.01%  422.68us         1  422.68us  422.68us  422.68us  cudaLaunch
  0.00%  193.88us         4  48.469us  8.6570us  164.28us  cudaMalloc
  0.00%  87.274us         2  43.637us  38.266us  49.008us  cuDeviceTotalMem
  0.00%  70.200us         2  35.100us  29.893us  40.307us  cuDeviceGetName
  0.00%  59.895us         4  14.973us  8.4640us  31.319us  cudaMemcpy
  0.00%  17.867us         4  4.4660us  2.3930us  10.363us  cudaFuncGetAttributes
  0.00%  7.8780us         1  7.8780us  7.8780us  7.8780us  cudaSetupArgument
  0.00%  6.3500us        11     577ns     351ns  2.3100us  cudaDeviceGetAttribute
  0.00%  4.3370us         3  1.4450us     361ns  3.4630us  cudaGetDevice
  0.00%  3.4500us         1  3.4500us  3.4500us  3.4500us  cudaEventCreateWithFlags
  0.00%  3.0340us         1  3.0340us  3.0340us  3.0340us  cudaEventRecord
  0.00%  2.9730us         2  1.4860us     583ns  2.3900us  cuDeviceGetCount
  0.00%  2.3570us         1  2.3570us  2.3570us  2.3570us  cudaEventDestroy
  0.00%  2.0700us         1  2.0700us  2.0700us  2.0700us  cudaConfigureCall
  0.00%  1.5640us         4     391ns     229ns     543ns  cuDeviceGet
