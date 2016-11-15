==7202== NVPROF is profiling process 7202, command: ./affine.o
==7202== Profiling application: ./affine.o
==7202== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 38.80%  153.76us        11  13.978us     544ns  147.87us  [CUDA memcpy HtoD]
 35.05%  138.88us         1  138.88us  138.88us  138.88us  [CUDA memcpy DtoH]
 23.80%  94.304us         1  94.304us  94.304us  94.304us  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, AffineTransformFunctor)
  2.36%  9.3440us         3  3.1140us  1.0880us  4.6400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==7202== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.05%  798.87ms         7  114.12ms  10.000us  794.96ms  cudaMalloc
  0.92%  7.4607ms         1  7.4607ms  7.4607ms  7.4607ms  cudaGetDeviceProperties
  0.37%  2.9917ms        90  33.241us     129ns  1.2713ms  cuDeviceGetAttribute
  0.31%  2.5089ms         3  836.30us  17.341us  2.4034ms  cudaFree
  0.13%  1.0457ms         5  209.13us  21.163us  925.13us  cudaMemcpy
  0.08%  642.67us         4  160.67us  28.759us  511.30us  cudaLaunch
  0.05%  412.76us         1  412.76us  412.76us  412.76us  cuDeviceTotalMem
  0.05%  412.08us         7  58.868us  3.0630us  389.49us  cudaMemcpyAsync
  0.03%  207.27us         1  207.27us  207.27us  207.27us  cuDeviceGetName
  0.01%  93.670us         1  93.670us  93.670us  93.670us  cudaDeviceSynchronize
  0.01%  43.724us        12  3.6430us  1.3810us  10.855us  cudaFuncGetAttributes
  0.00%  13.261us         9  1.4730us     202ns  7.1060us  cudaGetDevice
  0.00%  11.603us         3  3.8670us  2.7140us  5.1530us  cudaEventCreateWithFlags
  0.00%  7.9790us         3  2.6590us  2.0360us  3.2010us  cudaEventRecord
  0.00%  5.8850us         6     980ns     122ns  3.7070us  cudaSetupArgument
  0.00%  5.7430us         3  1.9140us  1.6330us  2.1840us  cudaEventDestroy
  0.00%  5.0710us        11     461ns     206ns  2.2360us  cudaDeviceGetAttribute
  0.00%  4.2470us         4  1.0610us     759ns  1.2750us  cudaConfigureCall
  0.00%  2.3140us         2  1.1570us     459ns  1.8550us  cuDeviceGetCount
  0.00%     708ns         2     354ns     200ns     508ns  cuDeviceGet
  0.00%     425ns         1     425ns     425ns     425ns  cudaGetLastError
