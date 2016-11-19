==3711== NVPROF is profiling process 3711, command: ./dilate.o
==3711== Profiling application: ./dilate.o
==3711== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.19%  86.505us         6  14.417us     576ns  81.065us  [CUDA memcpy HtoD]
 38.33%  82.505us         1  82.505us  82.505us  82.505us  [CUDA memcpy DtoH]
 11.43%  24.610us         1  24.610us  24.610us  24.610us  void thrust::transform_texture_kernel<float, dilateFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, dilateFunctor)
  4.10%  8.8330us         1  8.8330us  8.8330us  8.8330us  [CUDA memcpy DtoD]
  4.03%  8.6730us         2  4.3360us  4.0960us  4.5770us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.92%  4.1280us         1  4.1280us  4.1280us  4.1280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3711== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.47%  1.09152s         8  136.44ms  5.7910us  1.07516s  cudaMalloc
  1.56%  17.604ms         2  8.8019ms  6.6057ms  10.998ms  cudaGetDeviceProperties
  1.04%  11.790ms        90  131.00us     105ns  7.7468ms  cuDeviceGetAttribute
  0.30%  3.3541ms         1  3.3541ms  3.3541ms  3.3541ms  cudaMallocPitch
  0.26%  2.9619ms         3  987.29us  19.692us  2.2457ms  cudaFree
  0.25%  2.8603ms         1  2.8603ms  2.8603ms  2.8603ms  cuDeviceTotalMem
  0.07%  749.16us         6  124.86us  4.7520us  663.33us  cudaMemcpy
  0.03%  314.48us         1  314.48us  314.48us  314.48us  cuDeviceGetName
  0.01%  80.284us         4  20.071us  11.725us  29.484us  cudaLaunch
  0.01%  60.788us         1  60.788us  60.788us  60.788us  cudaMemcpyAsync
  0.00%  35.255us         1  35.255us  35.255us  35.255us  cudaMemcpy2D
  0.00%  28.536us        12  2.3780us  1.4040us  5.2200us  cudaFuncGetAttributes
  0.00%  9.2350us         1  9.2350us  9.2350us  9.2350us  cudaCreateTextureObject
  0.00%  6.9600us         9     773ns     221ns  2.4950us  cudaGetDevice
  0.00%  4.7670us         3  1.5890us  1.1390us  2.0560us  cudaEventCreateWithFlags
  0.00%  4.1950us        11     381ns     238ns  1.2580us  cudaDeviceGetAttribute
  0.00%  4.0770us         2  2.0380us     261ns  3.8160us  cuDeviceGetCount
  0.00%  3.7530us         3  1.2510us     925ns  1.4140us  cudaEventRecord
  0.00%  3.4600us         4     865ns     393ns  1.3100us  cudaConfigureCall
  0.00%  3.3890us         3  1.1290us     772ns  1.5050us  cudaEventDestroy
  0.00%  2.4260us         7     346ns     170ns     635ns  cudaSetupArgument
  0.00%     730ns         2     365ns     342ns     388ns  cuDeviceGet
  0.00%     230ns         1     230ns     230ns     230ns  cudaCreateChannelDesc
