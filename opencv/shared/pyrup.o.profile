==16879== NVPROF is profiling process 16879, command: ./pyrup.o
==16879== Profiling application: ./pyrup.o
==16879== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 74.79%  1.4215ms        19  74.815us     288ns  1.4130ms  [CUDA memcpy DtoH]
 14.59%  277.32us         1  277.32us  277.32us  277.32us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
  9.22%  175.31us        24  7.3040us     512ns  156.31us  [CUDA memcpy HtoD]
  1.26%  23.902us         3  7.9670us  1.4400us  18.686us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.14%  2.6880us         1  2.6880us  2.6880us  2.6880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16879== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 94.77%  900.32ms         9  100.04ms  7.9380us  896.48ms  cudaMalloc
  3.51%  33.387ms         4  8.3466ms  12.188us  33.154ms  cudaFree
  0.81%  7.6726ms        91  84.314us     132ns  5.4251ms  cuDeviceGetAttribute
  0.26%  2.4543ms         1  2.4543ms  2.4543ms  2.4543ms  cuDeviceGetName
  0.22%  2.0648ms         6  344.13us  9.5180us  1.9584ms  cudaMemcpy
  0.14%  1.3620ms         1  1.3620ms  1.3620ms  1.3620ms  cudaGetDeviceProperties
  0.13%  1.2352ms         1  1.2352ms  1.2352ms  1.2352ms  cuDeviceTotalMem
  0.13%  1.2045ms        37  32.553us  1.9240us  1.0063ms  cudaMemcpyAsync
  0.02%  172.13us         5  34.426us  12.660us  49.402us  cudaLaunch
  0.01%  70.288us        16  4.3930us  1.3830us  19.224us  cudaFuncGetAttributes
  0.00%  13.206us        12  1.1000us     223ns  3.3010us  cudaGetDevice
  0.00%  10.961us         4  2.7400us  1.3070us  3.7890us  cudaEventCreateWithFlags
  0.00%  7.9030us         4  1.9750us  1.0980us  2.4850us  cudaEventRecord
  0.00%  6.0000us         7     857ns     223ns  2.7580us  cudaSetupArgument
  0.00%  5.6740us         4  1.4180us  1.0780us  1.7250us  cudaEventDestroy
  0.00%  4.7690us         5     953ns     372ns  1.3720us  cudaConfigureCall
  0.00%  4.2610us         3  1.4200us     143ns  3.4980us  cuDeviceGetCount
  0.00%  3.7470us        11     340ns     208ns  1.1260us  cudaDeviceGetAttribute
  0.00%  2.2070us         3     735ns     211ns  1.1670us  cuDeviceGet
