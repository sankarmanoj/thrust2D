==18361== NVPROF is profiling process 18361, command: ./lbp.o
==18361== Profiling application: ./lbp.o
==18361== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.45%  21.301ms         1  21.301ms  21.301ms  21.301ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<lbpFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.32%  68.096us         1  68.096us  68.096us  68.096us  [CUDA memcpy DtoH]
  0.23%  50.080us         5  10.016us     896ns  45.600us  [CUDA memcpy HtoD]

==18361== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.18%  6.92329s         4  1.73082s  7.9500us  6.92311s  cudaMallocPitch
  0.40%  28.143ms       166  169.54us     167ns  14.855ms  cuDeviceGetAttribute
  0.31%  21.295ms         1  21.295ms  21.295ms  21.295ms  cudaDeviceSynchronize
  0.08%  5.8424ms         2  2.9212ms  315.63us  5.5267ms  cuDeviceGetName
  0.01%  731.15us         2  365.58us  247.97us  483.18us  cuDeviceTotalMem
  0.01%  450.11us         1  450.11us  450.11us  450.11us  cudaLaunch
  0.01%  406.01us         2  203.01us  112.10us  293.91us  cudaMemcpy2D
  0.00%  200.76us         4  50.189us  11.227us  162.08us  cudaMalloc
  0.00%  65.712us         4  16.428us  8.3800us  32.952us  cudaMemcpy
  0.00%  18.471us         4  4.6170us  2.4230us  10.866us  cudaFuncGetAttributes
  0.00%  8.1500us         1  8.1500us  8.1500us  8.1500us  cudaSetupArgument
  0.00%  7.0790us        11     643ns     351ns  2.5600us  cudaDeviceGetAttribute
  0.00%  4.3770us         3  1.4590us     404ns  3.4500us  cudaGetDevice
  0.00%  3.7860us         1  3.7860us  3.7860us  3.7860us  cudaEventCreateWithFlags
  0.00%  2.9090us         2  1.4540us     472ns  2.4370us  cuDeviceGetCount
  0.00%  2.6210us         1  2.6210us  2.6210us  2.6210us  cudaEventRecord
  0.00%  2.5700us         1  2.5700us  2.5700us  2.5700us  cudaEventDestroy
  0.00%  1.8180us         4     454ns     250ns     574ns  cuDeviceGet
  0.00%  1.4130us         1  1.4130us  1.4130us  1.4130us  cudaConfigureCall
  0.00%     874ns         1     874ns     874ns     874ns  cudaGetLastError
