==12883== NVPROF is profiling process 12883, command: ./gaussian_filter.o
==12883== Profiling application: ./gaussian_filter.o
==12883== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 54.11%  264.12us         1  264.12us  264.12us  264.12us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 23.99%  117.08us        25  4.6830us     544ns  103.71us  [CUDA memcpy HtoD]
 19.41%  94.749us        19  4.9860us     320ns  86.014us  [CUDA memcpy DtoH]
  1.86%  9.0560us         3  3.0180us  1.2800us  4.2560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.63%  3.0720us         1  3.0720us  3.0720us  3.0720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12883== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.95%  161.98ms        10  16.198ms  4.0230us  161.60ms  cudaMalloc
  0.42%  685.71us         7  97.959us  2.9720us  648.89us  cudaMemcpy
  0.17%  279.52us        37  7.5540us  1.7940us  107.79us  cudaMemcpyAsync
  0.10%  167.46us         1  167.46us  167.46us  167.46us  cudaGetDeviceProperties
  0.10%  162.24us         4  40.560us  6.4540us  81.495us  cudaFree
  0.09%  152.63us         1  152.63us  152.63us  152.63us  cuDeviceTotalMem
  0.09%  149.32us        90  1.6590us      95ns  56.938us  cuDeviceGetAttribute
  0.03%  52.029us         5  10.405us  6.9790us  14.595us  cudaLaunch
  0.02%  35.076us        16  2.1920us  1.3670us  12.096us  cudaFuncGetAttributes
  0.01%  14.704us         1  14.704us  14.704us  14.704us  cuDeviceGetName
  0.00%  5.3520us        12     446ns     200ns  1.5730us  cudaGetDevice
  0.00%  4.8100us         4  1.2020us     901ns  1.7190us  cudaEventCreateWithFlags
  0.00%  3.5690us         4     892ns     599ns  1.4330us  cudaEventRecord
  0.00%  3.2210us         8     402ns     112ns  1.9300us  cudaSetupArgument
  0.00%  3.1990us        11     290ns     201ns     868ns  cudaDeviceGetAttribute
  0.00%  3.0200us         4     755ns     570ns  1.0750us  cudaEventDestroy
  0.00%  1.9000us         5     380ns     278ns     744ns  cudaConfigureCall
  0.00%  1.7080us         2     854ns     220ns  1.4880us  cuDeviceGetCount
  0.00%     426ns         2     213ns     132ns     294ns  cuDeviceGet
