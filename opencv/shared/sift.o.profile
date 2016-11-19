==13956== NVPROF is profiling process 13956, command: ./sift.o
==13956== Profiling application: ./sift.o
==13956== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 67.72%  1.7981ms        12  149.84us     576ns  1.6742ms  [CUDA memcpy HtoD]
 23.34%  619.85us         1  619.85us  619.85us  619.85us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
  7.46%  197.98us         1  197.98us  197.98us  197.98us  [CUDA memcpy DtoH]
  1.09%  28.927us         4  7.2310us  1.4080us  18.975us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.39%  10.431us         3  3.4770us  1.6000us  5.5350us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==13956== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.24%  422.04ms        16  26.378ms  7.6880us  401.82ms  cudaMalloc
  2.82%  12.516ms         1  12.516ms  12.516ms  12.516ms  cudaGetDeviceProperties
  0.74%  3.2996ms         3  1.0999ms  637.38us  1.9541ms  cudaMemcpyAsync
  0.38%  1.6619ms        10  166.19us  7.7920us  1.2064ms  cudaMemcpy
  0.23%  1.0159ms        28  36.280us  2.4570us  454.21us  cudaFuncGetAttributes
  0.19%  862.85us         1  862.85us  862.85us  862.85us  cudaDeviceSynchronize
  0.15%  654.69us         7  93.527us  7.8920us  258.18us  cudaFree
  0.08%  365.32us         8  45.665us  8.8160us  59.956us  cudaLaunch
  0.07%  305.98us        91  3.3620us     144ns  112.19us  cuDeviceGetAttribute
  0.05%  211.35us         1  211.35us  211.35us  211.35us  cuDeviceTotalMem
  0.01%  59.610us         1  59.610us  59.610us  59.610us  cuDeviceGetName
  0.01%  36.442us        21  1.7350us     422ns  7.1790us  cudaGetDevice
  0.01%  25.332us         7  3.6180us  2.3060us  8.0960us  cudaEventRecord
  0.01%  24.358us         7  3.4790us  1.0670us  4.7900us  cudaEventCreateWithFlags
  0.00%  15.808us         7  2.2580us  1.2410us  3.4170us  cudaEventDestroy
  0.00%  10.472us         8  1.3090us     325ns  2.0680us  cudaConfigureCall
  0.00%  8.8650us        11     805ns     114ns  2.6110us  cudaSetupArgument
  0.00%  8.0330us         3  2.6770us     465ns  4.4970us  cuDeviceGetCount
  0.00%  6.5650us        11     596ns     374ns  1.7410us  cudaDeviceGetAttribute
  0.00%  4.5260us         3  1.5080us     469ns  3.0900us  cuDeviceGet
