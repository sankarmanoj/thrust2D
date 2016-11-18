==3858== NVPROF is profiling process 3858, command: ./affine.o
==3858== Profiling application: ./affine.o
==3858== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.67%  112.16us        10  11.216us  1.1840us  101.25us  [CUDA memcpy HtoD]
 29.66%  74.467us         1  74.467us  74.467us  74.467us  [CUDA memcpy DtoH]
 21.92%  55.043us         1  55.043us  55.043us  55.043us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.75%  9.4080us         3  3.1360us  1.0880us  4.4160us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3858== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.52%  808.14ms         6  134.69ms  6.8450us  806.65ms  cudaMalloc
  1.25%  10.281ms        90  114.23us     117ns  4.5789ms  cuDeviceGetAttribute
  0.06%  514.03us         1  514.03us  514.03us  514.03us  cuDeviceTotalMem
  0.05%  437.91us         3  145.97us  10.499us  379.71us  cudaFree
  0.03%  265.55us         4  66.387us  7.5610us  215.69us  cudaMemcpy
  0.03%  255.01us         7  36.429us  2.8630us  235.14us  cudaMemcpyAsync
  0.01%  114.36us         1  114.36us  114.36us  114.36us  cuDeviceGetName
  0.01%  95.346us         4  23.836us  13.340us  30.425us  cudaLaunch
  0.01%  56.191us         1  56.191us  56.191us  56.191us  cudaDeviceSynchronize
  0.00%  40.864us        16  2.5540us  1.9600us  5.2930us  cudaFuncGetAttributes
  0.00%  7.4340us        12     619ns     298ns  2.0590us  cudaGetDevice
  0.00%  6.5070us         4  1.6260us     977ns  2.1300us  cudaEventCreateWithFlags
  0.00%  6.0100us         4  1.5020us     281ns  4.5530us  cudaSetupArgument
  0.00%  5.8620us         4  1.4650us     897ns  1.7470us  cudaEventRecord
  0.00%  4.7840us         4  1.1960us     848ns  1.6270us  cudaEventDestroy
  0.00%  4.6410us        11     421ns     281ns  1.2940us  cudaDeviceGetAttribute
  0.00%  2.9120us         4     728ns     252ns  1.2010us  cudaConfigureCall
  0.00%  2.2580us         2  1.1290us     433ns  1.8250us  cuDeviceGetCount
  0.00%     712ns         2     356ns     250ns     462ns  cuDeviceGet
