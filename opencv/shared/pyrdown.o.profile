==24775== NVPROF is profiling process 24775, command: ./pyrdown.o
==24775== Profiling application: ./pyrdown.o
==24775== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 72.39%  1.3033ms        19  68.596us     319ns  1.2945ms  [CUDA memcpy DtoH]
 16.48%  296.78us         1  296.78us  296.78us  296.78us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
  7.17%  129.12us        26  4.9660us     543ns  113.62us  [CUDA memcpy HtoD]
  2.51%  45.215us         4  11.303us  1.5670us  19.794us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.23%  22.224us         1  22.224us  22.224us  22.224us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.20%  3.6450us         1  3.6450us  3.6450us  3.6450us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==24775== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.44%  229.17ms        12  19.097ms  4.1240us  228.50ms  cudaMalloc
  0.97%  2.2495ms         8  281.19us  3.1140us  2.1529ms  cudaMemcpy
  0.13%  303.14us        37  8.1930us  2.1190us  123.96us  cudaMemcpyAsync
  0.09%  217.57us        90  2.4170us      96ns  85.434us  cuDeviceGetAttribute
  0.09%  211.70us         5  42.340us  6.5040us  96.672us  cudaFree
  0.07%  167.05us         1  167.05us  167.05us  167.05us  cuDeviceTotalMem
  0.06%  149.32us         1  149.32us  149.32us  149.32us  cudaGetDeviceProperties
  0.05%  110.45us         7  15.778us  8.2880us  34.580us  cudaLaunch
  0.04%  93.262us         1  93.262us  93.262us  93.262us  cudaDeviceSynchronize
  0.02%  55.121us        24  2.2960us  1.3560us  9.0940us  cudaFuncGetAttributes
  0.01%  23.951us         1  23.951us  23.951us  23.951us  cuDeviceGetName
  0.00%  8.7840us        18     488ns     203ns  1.9670us  cudaGetDevice
  0.00%  7.8450us         6  1.3070us     936ns  2.1580us  cudaEventCreateWithFlags
  0.00%  6.8210us         6  1.1360us     760ns  1.9640us  cudaEventRecord
  0.00%  5.8020us        10     580ns     105ns  3.7750us  cudaSetupArgument
  0.00%  5.0330us         6     838ns     637ns  1.3190us  cudaEventDestroy
  0.00%  4.2610us        11     387ns     202ns  1.4700us  cudaDeviceGetAttribute
  0.00%  2.9480us         7     421ns     230ns     914ns  cudaConfigureCall
  0.00%  1.8510us         2     925ns     573ns  1.2780us  cuDeviceGetCount
  0.00%     387ns         2     193ns     186ns     201ns  cuDeviceGet
