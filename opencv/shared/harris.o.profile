==9518== NVPROF is profiling process 9518, command: ./harris.o
==9518== Profiling application: ./harris.o
==9518== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.21%  110.14us        24  4.5890us  1.1200us  82.368us  [CUDA memcpy HtoD]
 33.02%  97.760us        19  5.1450us     320ns  82.400us  [CUDA memcpy DtoH]
 26.63%  78.848us         1  78.848us  78.848us  78.848us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, HarrisIntensityFunctor)
  3.13%  9.2800us         3  3.0930us  1.5680us  4.5440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9518== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.33%  1.20828s         8  151.04ms  8.3010us  1.20634s  cudaMalloc
  1.08%  13.217ms        90  146.86us     106ns  7.0655ms  cuDeviceGetAttribute
  0.23%  2.8582ms         1  2.8582ms  2.8582ms  2.8582ms  cuDeviceTotalMem
  0.20%  2.4111ms         3  803.71us  26.253us  2.0440ms  cudaFree
  0.06%  691.99us         1  691.99us  691.99us  691.99us  cuDeviceGetName
  0.04%  450.12us        37  12.165us  3.2130us  103.50us  cudaMemcpyAsync
  0.03%  389.48us         6  64.913us  5.6630us  269.10us  cudaMemcpy
  0.03%  356.28us         1  356.28us  356.28us  356.28us  cudaGetDeviceProperties
  0.01%  90.283us         4  22.570us  14.699us  38.191us  cudaLaunch
  0.00%  38.799us        12  3.2330us  1.7380us  12.162us  cudaFuncGetAttributes
  0.00%  8.5400us         3  2.8460us  1.5000us  4.4850us  cudaEventCreateWithFlags
  0.00%  8.2970us         7  1.1850us     205ns  6.3120us  cudaSetupArgument
  0.00%  7.5120us         9     834ns     276ns  2.9910us  cudaGetDevice
  0.00%  7.1560us         4  1.7890us     420ns  5.4010us  cudaConfigureCall
  0.00%  4.7930us         3  1.5970us  1.1780us  2.0140us  cudaEventRecord
  0.00%  4.3240us        11     393ns     233ns  1.3320us  cudaDeviceGetAttribute
  0.00%  4.0870us         3  1.3620us  1.1690us  1.5670us  cudaEventDestroy
  0.00%  1.3160us         2     658ns     159ns  1.1570us  cuDeviceGetCount
  0.00%     353ns         2     176ns     111ns     242ns  cuDeviceGet
