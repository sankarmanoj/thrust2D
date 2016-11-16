==12932== NVPROF is profiling process 12932, command: ./erode.o
==12932== Profiling application: ./erode.o
==12932== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.34%  130.59us         6  21.764us     928ns  124.83us  [CUDA memcpy HtoD]
 30.75%  83.069us         1  83.069us  83.069us  83.069us  [CUDA memcpy DtoH]
 16.60%  44.830us         1  44.830us  44.830us  44.830us  void thrust::transform_kernel<float, erodeFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, erodeFunctor)
  3.32%  8.9590us         2  4.4790us  4.2240us  4.7350us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.99%  2.6870us         1  2.6870us  2.6870us  2.6870us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==12932== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.88%  559.45ms         8  69.931ms  7.7970us  555.55ms  cudaMalloc
  1.01%  5.8213ms         3  1.9404ms  27.539us  4.9136ms  cudaFree
  1.00%  5.7729ms         1  5.7729ms  5.7729ms  5.7729ms  cudaGetDeviceProperties
  0.76%  4.3965ms        90  48.849us     102ns  2.1822ms  cuDeviceGetAttribute
  0.11%  631.50us         1  631.50us  631.50us  631.50us  cuDeviceTotalMem
  0.08%  477.40us         6  79.566us  8.3580us  260.93us  cudaMemcpy
  0.07%  431.89us         1  431.89us  431.89us  431.89us  cuDeviceGetName
  0.06%  320.45us         1  320.45us  320.45us  320.45us  cudaMemcpyAsync
  0.02%  114.64us         4  28.659us  23.372us  32.019us  cudaLaunch
  0.01%  37.111us        12  3.0920us  1.4550us  9.8060us  cudaFuncGetAttributes
  0.00%  7.7220us         9     858ns     214ns  2.4800us  cudaGetDevice
  0.00%  6.9510us         3  2.3170us  2.0360us  2.8130us  cudaEventCreateWithFlags
  0.00%  6.2440us         7     892ns     116ns  4.3170us  cudaSetupArgument
  0.00%  5.3270us         3  1.7750us  1.3920us  1.9730us  cudaEventRecord
  0.00%  4.8460us         4  1.2110us     895ns  1.5960us  cudaConfigureCall
  0.00%  3.5870us         3  1.1950us  1.0650us  1.4540us  cudaEventDestroy
  0.00%  3.5450us        11     322ns     213ns  1.0230us  cudaDeviceGetAttribute
  0.00%  2.2490us         2  1.1240us     659ns  1.5900us  cuDeviceGetCount
  0.00%     460ns         2     230ns     204ns     256ns  cuDeviceGet
