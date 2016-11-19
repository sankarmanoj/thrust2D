==4255== NVPROF is profiling process 4255, command: ./sobel_filter.o
==4255== Profiling application: ./sobel_filter.o
==4255== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.18%  111.03us        26  4.2700us  1.1840us  80.787us  [CUDA memcpy HtoD]
 30.62%  91.446us         1  91.446us  91.446us  91.446us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 27.60%  82.420us         1  82.420us  82.420us  82.420us  [CUDA memcpy DtoH]
  3.72%  11.107us         4  2.7760us     992ns  4.3530us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.88%  2.6240us         1  2.6240us  2.6240us  2.6240us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4255== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.49%  392.25ms        12  32.688ms  7.4010us  391.14ms  cudaMalloc
  0.15%  604.40us         2  302.20us  289.38us  315.02us  cudaGetDeviceProperties
  0.09%  343.40us         8  42.925us  6.5310us  278.82us  cudaMemcpy
  0.07%  270.13us         5  54.026us  6.9400us  151.98us  cudaFree
  0.05%  213.91us        90  2.3760us     103ns  78.901us  cuDeviceGetAttribute
  0.05%  179.84us         1  179.84us  179.84us  179.84us  cuDeviceTotalMem
  0.04%  164.84us        19  8.6750us  3.6890us  92.933us  cudaMemcpyAsync
  0.02%  82.789us         6  13.798us  11.085us  17.309us  cudaLaunch
  0.02%  61.294us        20  3.0640us  2.4270us  9.2360us  cudaFuncGetAttributes
  0.01%  28.697us         1  28.697us  28.697us  28.697us  cuDeviceGetName
  0.00%  9.8280us        15     655ns     404ns  1.8430us  cudaGetDevice
  0.00%  7.7460us         5  1.5490us  1.2990us  2.0550us  cudaEventCreateWithFlags
  0.00%  6.6950us         5  1.3390us  1.1580us  1.8440us  cudaEventRecord
  0.00%  5.3980us         5  1.0790us     880ns  1.3920us  cudaEventDestroy
  0.00%  4.7970us        11     436ns     320ns     947ns  cudaDeviceGetAttribute
  0.00%  3.2690us         2  1.6340us     413ns  2.8560us  cuDeviceGetCount
  0.00%  3.2620us         6     543ns     374ns  1.1600us  cudaConfigureCall
  0.00%  3.0350us         9     337ns     206ns     563ns  cudaSetupArgument
  0.00%     913ns         1     913ns     913ns     913ns  cudaGetLastError
  0.00%     444ns         2     222ns     169ns     275ns  cuDeviceGet
