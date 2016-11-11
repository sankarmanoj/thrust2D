==5387== NVPROF is profiling process 5387, command: ./dilate.o
==5387== Profiling application: ./dilate.o
==5387== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 39.30%  183.82us         1  183.82us  183.82us  183.82us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, dilateFunctor)
 34.87%  163.12us         1  163.12us  163.12us  163.12us  [CUDA memcpy DtoH]
 23.57%  110.26us         6  18.376us     544ns  107.32us  [CUDA memcpy HtoD]
  1.58%  7.3910us         2  3.6950us  3.4870us  3.9040us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.68%  3.1680us         1  3.1680us  3.1680us  3.1680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5387== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.51%  939.27ms         8  117.41ms  4.6620us  926.47ms  cudaMalloc
  2.48%  24.393ms         1  24.393ms  24.393ms  24.393ms  cudaGetDeviceProperties
  0.91%  8.9515ms        90  99.461us     132ns  5.9176ms  cuDeviceGetAttribute
  0.74%  7.3084ms         3  2.4361ms  108.66us  5.9938ms  cudaFree
  0.18%  1.8014ms         6  300.23us  23.867us  1.0384ms  cudaMemcpy
  0.06%  572.23us         4  143.06us  7.9890us  496.48us  cudaLaunch
  0.04%  429.55us         1  429.55us  429.55us  429.55us  cuDeviceTotalMem
  0.04%  365.65us         1  365.65us  365.65us  365.65us  cuDeviceGetName
  0.02%  226.24us         1  226.24us  226.24us  226.24us  cudaMemcpyAsync
  0.00%  25.783us        12  2.1480us  1.4000us  5.6870us  cudaFuncGetAttributes
  0.00%  7.8800us         3  2.6260us     828ns  4.6890us  cudaEventCreateWithFlags
  0.00%  7.1910us         9     799ns     209ns  2.7860us  cudaGetDevice
  0.00%  6.0590us         7     865ns     181ns  4.2100us  cudaSetupArgument
  0.00%  4.8250us         3  1.6080us     712ns  2.1970us  cudaEventRecord
  0.00%  4.6570us         2  2.3280us  1.4660us  3.1910us  cuDeviceGetCount
  0.00%  4.4530us        11     404ns     222ns  1.1610us  cudaDeviceGetAttribute
  0.00%  3.5820us         4     895ns     240ns  1.3600us  cudaConfigureCall
  0.00%  3.5190us         3  1.1730us     717ns  1.4230us  cudaEventDestroy
  0.00%  1.0810us         2     540ns     445ns     636ns  cuDeviceGet
  0.00%     625ns         1     625ns     625ns     625ns  cudaGetLastError
