==7165== NVPROF is profiling process 7165, command: ./erode.o
==7165== Profiling application: ./erode.o
==7165== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.66%  158.11us         6  26.352us     544ns  155.14us  [CUDA memcpy HtoD]
 35.64%  145.76us         1  145.76us  145.76us  145.76us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, erodeFunctor)
 23.16%  94.721us         1  94.721us  94.721us  94.721us  [CUDA memcpy DtoH]
  1.84%  7.5200us         2  3.7600us  3.5200us  4.0000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.70%  2.8480us         1  2.8480us  2.8480us  2.8480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7165== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.62%  778.03ms         8  97.254ms  6.8210us  777.23ms  cudaMalloc
  0.55%  4.3212ms        90  48.013us     132ns  2.3097ms  cuDeviceGetAttribute
  0.37%  2.8875ms         3  962.51us  57.126us  2.6183ms  cudaFree
  0.23%  1.8105ms         6  301.75us  22.180us  1.1080ms  cudaMemcpy
  0.11%  900.24us         1  900.24us  900.24us  900.24us  cudaMemcpyAsync
  0.04%  277.99us         1  277.99us  277.99us  277.99us  cuDeviceTotalMem
  0.03%  272.50us         1  272.50us  272.50us  272.50us  cudaGetDeviceProperties
  0.02%  179.54us         1  179.54us  179.54us  179.54us  cuDeviceGetName
  0.02%  147.73us         4  36.933us  23.226us  51.699us  cudaLaunch
  0.00%  38.046us        12  3.1700us  2.1400us  8.5560us  cudaFuncGetAttributes
  0.00%  8.0950us         7  1.1560us     169ns  5.4450us  cudaSetupArgument
  0.00%  7.6890us         9     854ns     311ns  2.5450us  cudaGetDevice
  0.00%  7.6840us         3  2.5610us  1.8200us  3.1260us  cudaEventCreateWithFlags
  0.00%  6.4000us         3  2.1330us  1.5590us  2.6670us  cudaEventRecord
  0.00%  6.1730us         4  1.5430us     725ns  2.6890us  cudaConfigureCall
  0.00%  5.7180us        11     519ns     283ns  1.7230us  cudaDeviceGetAttribute
  0.00%  5.7020us         3  1.9000us  1.1990us  2.5830us  cudaEventDestroy
  0.00%  5.6110us         2  2.8050us  1.8540us  3.7570us  cuDeviceGetCount
  0.00%  1.8960us         2     948ns     788ns  1.1080us  cuDeviceGet
  0.00%     539ns         1     539ns     539ns     539ns  cudaGetLastError
