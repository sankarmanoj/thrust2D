==13925== NVPROF is profiling process 13925, command: ./dilate.o
==13925== Profiling application: ./dilate.o
==13925== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 51.84%  216.06us         1  216.06us  216.06us  216.06us  [CUDA memcpy DtoH]
 37.85%  157.72us         6  26.287us     576ns  149.75us  [CUDA memcpy HtoD]
  5.87%  24.447us         1  24.447us  24.447us  24.447us  void thrust::transform_texture_kernel<float, dilateFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, dilateFunctor)
  2.00%  8.3200us         1  8.3200us  8.3200us  8.3200us  [CUDA memcpy DtoD]
  1.80%  7.4870us         2  3.7430us  3.6150us  3.8720us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.65%  2.7190us         1  2.7190us  2.7190us  2.7190us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==13925== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.77%  680.58ms         8  85.072ms  7.5440us  677.82ms  cudaMalloc
  1.26%  8.7727ms         3  2.9242ms  54.612us  8.4368ms  cudaFree
  0.51%  3.5482ms         1  3.5482ms  3.5482ms  3.5482ms  cudaGetDeviceProperties
  0.12%  824.32us         6  137.39us  7.2800us  633.58us  cudaMemcpy
  0.08%  547.81us         1  547.81us  547.81us  547.81us  cudaMemcpy2D
  0.07%  481.26us         1  481.26us  481.26us  481.26us  cudaMallocPitch
  0.06%  435.90us         1  435.90us  435.90us  435.90us  cudaMemcpyAsync
  0.04%  269.62us         4  67.406us  16.354us  138.55us  cudaLaunch
  0.03%  224.72us        91  2.4690us     129ns  77.549us  cuDeviceGetAttribute
  0.03%  184.09us         1  184.09us  184.09us  184.09us  cuDeviceTotalMem
  0.01%  63.968us        12  5.3300us  2.1380us  26.864us  cudaFuncGetAttributes
  0.00%  34.536us         1  34.536us  34.536us  34.536us  cuDeviceGetName
  0.00%  28.359us         1  28.359us  28.359us  28.359us  cudaCreateTextureObject
  0.00%  21.460us         9  2.3840us     351ns  13.489us  cudaGetDevice
  0.00%  15.379us         3  5.1260us  1.5400us  11.452us  cudaEventCreateWithFlags
  0.00%  14.356us         3  4.7850us  1.2720us  8.9750us  cudaEventRecord
  0.00%  11.083us         7  1.5830us     229ns  7.4100us  cudaSetupArgument
  0.00%  10.023us         4  2.5050us     392ns  5.1100us  cudaConfigureCall
  0.00%  8.6270us         3  2.8750us     919ns  5.6140us  cudaEventDestroy
  0.00%  7.9090us         3  2.6360us     616ns  6.2350us  cuDeviceGetCount
  0.00%  6.4780us        11     588ns     342ns  1.9810us  cudaDeviceGetAttribute
  0.00%  4.2320us         3  1.4100us     205ns  3.4060us  cuDeviceGet
  0.00%     479ns         1     479ns     479ns     479ns  cudaCreateChannelDesc
