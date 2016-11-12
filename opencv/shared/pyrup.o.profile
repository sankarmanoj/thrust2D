==29166== NVPROF is profiling process 29166, command: ./pyrup.o
==29166== Profiling application: ./pyrup.o
==29166== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 46.37%  167.78us         1  167.78us  167.78us  167.78us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, convolutionFunctor)
 28.66%  103.68us        27  3.8400us     608ns  72.896us  [CUDA memcpy HtoD]
 11.74%  42.464us         1  42.464us  42.464us  42.464us  void thrust::for_each_kernel<float, pyrupTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, pyrupTransformFunctor)
  9.37%  33.888us        19  1.7830us     320ns  18.752us  [CUDA memcpy DtoH]
  3.15%  11.393us         4  2.8480us  1.3440us  5.0240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.72%  2.5920us         1  2.5920us  2.5920us  2.5920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29166== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.67%  806.02ms        13  62.002ms  7.1260us  799.66ms  cudaMalloc
  1.77%  14.788ms         2  7.3940ms  6.5274ms  8.2606ms  cudaGetDeviceProperties
  0.77%  6.3819ms         5  1.2764ms  9.5100us  6.0392ms  cudaFree
  0.50%  4.1493ms        90  46.102us     128ns  1.6187ms  cuDeviceGetAttribute
  0.15%  1.2442ms         1  1.2442ms  1.2442ms  1.2442ms  cuDeviceTotalMem
  0.06%  482.71us        37  13.046us  3.0550us  159.84us  cudaMemcpyAsync
  0.04%  322.93us         9  35.881us  6.1570us  144.03us  cudaMemcpy
  0.02%  171.36us         7  24.480us  9.5950us  33.080us  cudaLaunch
  0.02%  125.71us         1  125.71us  125.71us  125.71us  cuDeviceGetName
  0.01%  63.741us        20  3.1870us  2.4870us  6.1280us  cudaFuncGetAttributes
  0.00%  12.679us        15     845ns     404ns  2.3460us  cudaGetDevice
  0.00%  9.2730us         5  1.8540us  1.2750us  2.4350us  cudaEventCreateWithFlags
  0.00%  8.0020us         5  1.6000us  1.0730us  2.0260us  cudaEventRecord
  0.00%  7.5240us        12     627ns     163ns  3.9220us  cudaSetupArgument
  0.00%  6.3390us         7     905ns     340ns  1.7630us  cudaConfigureCall
  0.00%  5.6220us         5  1.1240us     870ns  1.3620us  cudaEventDestroy
  0.00%  5.5560us        11     505ns     364ns  1.3060us  cudaDeviceGetAttribute
  0.00%  2.3290us         2  1.1640us     311ns  2.0180us  cuDeviceGetCount
  0.00%     906ns         2     453ns     440ns     466ns  cudaGetLastError
  0.00%     680ns         2     340ns     205ns     475ns  cuDeviceGet
