==12631== NVPROF is profiling process 12631, command: ./dilate.o
==12631== Profiling application: ./dilate.o
==12631== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.23%  146.75us         1  146.75us  146.75us  146.75us  [CUDA memcpy DtoH]
 40.23%  130.52us         6  21.754us     544ns  127.45us  [CUDA memcpy HtoD]
 10.76%  34.911us         1  34.911us  34.911us  34.911us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  2.74%  8.8950us         2  4.4470us  4.3510us  4.5440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.05%  3.3920us         1  3.3920us  3.3920us  3.3920us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12631== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.38%  300.68ms         8  37.585ms  4.6240us  300.20ms  cudaMalloc
  0.65%  1.9769ms         1  1.9769ms  1.9769ms  1.9769ms  cuDeviceGetName
  0.24%  740.08us         6  123.35us  6.2600us  663.52us  cudaMemcpy
  0.23%  700.89us        90  7.7870us     132ns  260.92us  cuDeviceGetAttribute
  0.20%  616.80us         1  616.80us  616.80us  616.80us  cudaGetDeviceProperties
  0.13%  391.63us         3  130.54us  12.011us  191.00us  cudaFree
  0.07%  214.01us         1  214.01us  214.01us  214.01us  cuDeviceTotalMem
  0.06%  173.60us         1  173.60us  173.60us  173.60us  cudaMemcpyAsync
  0.02%  68.974us         4  17.243us  13.156us  26.666us  cudaLaunch
  0.01%  27.449us        12  2.2870us  1.3960us  8.8610us  cudaFuncGetAttributes
  0.00%  4.8900us         9     543ns     224ns  1.6750us  cudaGetDevice
  0.00%  4.6470us         7     663ns     114ns  3.4140us  cudaSetupArgument
  0.00%  4.2280us        11     384ns     224ns  1.3990us  cudaDeviceGetAttribute
  0.00%  4.0050us         3  1.3350us  1.1820us  1.5850us  cudaEventCreateWithFlags
  0.00%  3.7080us         3  1.2360us     930ns  1.8420us  cudaEventRecord
  0.00%  3.6230us         2  1.8110us  1.1270us  2.4960us  cuDeviceGetCount
  0.00%  3.1250us         3  1.0410us     748ns  1.4770us  cudaEventDestroy
  0.00%  2.2170us         4     554ns     413ns     810ns  cudaConfigureCall
  0.00%     907ns         2     453ns     393ns     514ns  cuDeviceGet
