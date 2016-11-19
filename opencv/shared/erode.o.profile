==13885== NVPROF is profiling process 13885, command: ./erode.o
==13885== Profiling application: ./erode.o
==13885== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.39%  395.76us         1  395.76us  395.76us  395.76us  [CUDA memcpy DtoH]
 45.66%  381.30us         6  63.549us     704ns  377.52us  [CUDA memcpy HtoD]
  4.46%  37.279us         1  37.279us  37.279us  37.279us  void thrust::transform_texture_kernel<float, erodeFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  1.04%  8.7030us         1  8.7030us  8.7030us  8.7030us  [CUDA memcpy DtoD]
  0.97%  8.1280us         2  4.0640us  3.8400us  4.2880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.47%  3.9350us         1  3.9350us  3.9350us  3.9350us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==13885== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.79%  552.25ms         8  69.031ms  18.785us  549.80ms  cudaMalloc
  2.26%  13.032ms         1  13.032ms  13.032ms  13.032ms  cudaGetDeviceProperties
  1.14%  6.5834ms         3  2.1945ms  109.19us  4.7843ms  cudaFree
  0.24%  1.3664ms         1  1.3664ms  1.3664ms  1.3664ms  cudaMallocPitch
  0.20%  1.1607ms         6  193.45us  25.394us  950.34us  cudaMemcpy
  0.19%  1.0802ms         1  1.0802ms  1.0802ms  1.0802ms  cudaMemcpyAsync
  0.04%  235.55us         4  58.888us  30.108us  109.53us  cudaLaunch
  0.04%  230.35us        91  2.5310us     134ns  81.855us  cuDeviceGetAttribute
  0.03%  185.20us         1  185.20us  185.20us  185.20us  cuDeviceTotalMem
  0.03%  176.74us         1  176.74us  176.74us  176.74us  cudaMemcpy2D
  0.01%  50.045us        12  4.1700us  2.0830us  13.342us  cudaFuncGetAttributes
  0.01%  40.759us         1  40.759us  40.759us  40.759us  cudaCreateTextureObject
  0.01%  31.654us         1  31.654us  31.654us  31.654us  cuDeviceGetName
  0.00%  14.082us         7  2.0110us     164ns  10.474us  cudaSetupArgument
  0.00%  13.012us         3  4.3370us  2.6400us  6.8830us  cudaEventCreateWithFlags
  0.00%  12.992us         9  1.4430us     322ns  6.9590us  cudaGetDevice
  0.00%  10.108us         4  2.5270us     538ns  4.1200us  cudaConfigureCall
  0.00%  9.2760us         3  3.0920us  1.9030us  5.4580us  cudaEventRecord
  0.00%  7.7330us        11     703ns     281ns  3.0800us  cudaDeviceGetAttribute
  0.00%  7.6870us         3  2.5620us  1.4260us  4.4570us  cudaEventDestroy
  0.00%  4.8490us         3  1.6160us     259ns  3.4760us  cuDeviceGetCount
  0.00%  3.2310us         3  1.0770us     443ns  2.2660us  cuDeviceGet
  0.00%     671ns         1     671ns     671ns     671ns  cudaCreateChannelDesc
