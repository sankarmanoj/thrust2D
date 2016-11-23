==12277== NVPROF is profiling process 12277, command: ./harris.o
==12277== Profiling application: ./harris.o
==12277== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 85.25%  26.548ms         1  26.548ms  26.548ms  26.548ms  void thrust::transform_texture_kernel<unsigned char, HarrisIntensityFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HarrisIntensityFunctor)
 14.31%  4.4555ms         3  1.4852ms  267.93us  2.0977ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.25%  76.798us        19  4.0420us     319ns  65.855us  [CUDA memcpy DtoH]
  0.18%  57.151us        24  2.3810us     704ns  40.191us  [CUDA memcpy HtoD]
  0.02%  5.5680us         1  5.5680us  5.5680us  5.5680us  [CUDA memcpy DtoD]

==12277== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.26%  4.64511s         8  580.64ms  4.7850us  4.64473s  cudaMalloc
  0.57%  26.759ms         6  4.4598ms  3.1170us  26.725ms  cudaMemcpy
  0.10%  4.4742ms         3  1.4914ms  280.79us  2.0991ms  cudaDeviceSynchronize
  0.02%  909.30us         2  454.65us  173.30us  736.00us  cudaGetDeviceProperties
  0.01%  687.12us        91  7.5500us     132ns  371.39us  cuDeviceGetAttribute
  0.01%  640.68us         4  160.17us  11.154us  592.32us  cudaLaunch
  0.01%  338.62us         1  338.62us  338.62us  338.62us  cudaMallocPitch
  0.01%  311.11us         1  311.11us  311.11us  311.11us  cuDeviceGetName
  0.01%  239.30us        37  6.4670us  1.9980us  34.367us  cudaMemcpyAsync
  0.00%  208.49us         3  69.497us  16.025us  132.33us  cudaFree
  0.00%  190.81us         1  190.81us  190.81us  190.81us  cuDeviceTotalMem
  0.00%  35.359us        12  2.9460us  1.4050us  11.842us  cudaFuncGetAttributes
  0.00%  16.553us         1  16.553us  16.553us  16.553us  cudaMemcpy2D
  0.00%  9.0060us         1  9.0060us  9.0060us  9.0060us  cudaCreateTextureObject
  0.00%  6.6250us         3  2.2080us     848ns  4.4570us  cuDeviceGetCount
  0.00%  5.0180us         9     557ns     213ns  1.8350us  cudaGetDevice
  0.00%  4.4090us         3  1.4690us     178ns  3.0830us  cuDeviceGet
  0.00%  4.1920us         3  1.3970us     949ns  2.0060us  cudaEventCreateWithFlags
  0.00%  3.5460us        11     322ns     209ns     753ns  cudaDeviceGetAttribute
  0.00%  3.3160us         3  1.1050us     768ns  1.6510us  cudaEventRecord
  0.00%  2.6140us         3     871ns     735ns     996ns  cudaEventDestroy
  0.00%  1.9540us         4     488ns     262ns     772ns  cudaConfigureCall
  0.00%  1.6400us         7     234ns     111ns     513ns  cudaSetupArgument
  0.00%     179ns         1     179ns     179ns     179ns  cudaCreateChannelDesc
