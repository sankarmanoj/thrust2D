==10636== NVPROF is profiling process 10636, command: ./blend.o
==10636== Profiling application: ./blend.o
==10636== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 41.29%  162.69us         8  20.336us     576ns  80.289us  [CUDA memcpy HtoD]
 35.65%  140.48us         1  140.48us  140.48us  140.48us  void thrust::transform_kernel<float, blendFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, int, int, int, int, int, blendFunctor)
 19.95%  78.626us         1  78.626us  78.626us  78.626us  [CUDA memcpy DtoH]
  3.10%  12.224us         3  4.0740us  3.4560us  4.5440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10636== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.28%  565.54ms         9  62.838ms  3.9450us  562.49ms  cudaMalloc
  0.63%  3.6321ms        90  40.356us     117ns  2.2738ms  cuDeviceGetAttribute
  0.59%  3.3749ms         1  3.3749ms  3.3749ms  3.3749ms  cudaGetDeviceProperties
  0.13%  767.57us         1  767.57us  767.57us  767.57us  cuDeviceTotalMem
  0.13%  721.33us         3  240.44us  17.560us  497.48us  cudaFree
  0.12%  710.02us         2  355.01us  96.146us  613.87us  cudaMemcpyAsync
  0.08%  467.00us         7  66.714us  8.7780us  350.34us  cudaMemcpy
  0.02%  105.52us         4  26.379us  15.533us  46.946us  cudaLaunch
  0.01%  46.841us         1  46.841us  46.841us  46.841us  cuDeviceGetName
  0.01%  37.728us        12  3.1440us  1.9050us  9.0000us  cudaFuncGetAttributes
  0.00%  6.9290us        12     577ns     114ns  4.7920us  cudaSetupArgument
  0.00%  6.7170us         9     746ns     252ns  2.4750us  cudaGetDevice
  0.00%  5.9410us         3  1.9800us  1.7700us  2.3660us  cudaEventCreateWithFlags
  0.00%  5.5420us         3  1.8470us  1.4870us  2.0450us  cudaEventRecord
  0.00%  4.5240us         3  1.5080us  1.3480us  1.7640us  cudaEventDestroy
  0.00%  4.2160us        11     383ns     247ns  1.2090us  cudaDeviceGetAttribute
  0.00%  3.1120us         2  1.5560us     971ns  2.1410us  cuDeviceGetCount
  0.00%  3.0840us         4     771ns     527ns  1.0210us  cudaConfigureCall
  0.00%     642ns         2     321ns     269ns     373ns  cuDeviceGet
  0.00%     381ns         1     381ns     381ns     381ns  cudaGetLastError
