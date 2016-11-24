==6482== NVPROF is profiling process 6482, command: ./harris.o
==6482== Profiling application: ./harris.o
==6482== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 45.35%  78.202us         1  78.202us  78.202us  78.202us  void thrust::transform_texture_kernel<unsigned char, HarrisIntensityFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, HarrisIntensityFunctor)
 28.13%  48.508us        24  2.0210us     576ns  21.310us  [CUDA memcpy HtoD]
 20.76%  35.806us        19  1.8840us     320ns  20.927us  [CUDA memcpy DtoH]
  3.73%  6.4310us         2  3.2150us  2.2720us  4.1590us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.30%  2.2400us         1  2.2400us  2.2400us  2.2400us  [CUDA memcpy DtoD]
  0.72%  1.2480us         1  1.2480us  1.2480us  1.2480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6482== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.21%  239.05ms         8  29.881ms  4.6520us  238.64ms  cudaMalloc
  0.18%  434.32us         2  217.16us  166.87us  267.45us  cudaGetDeviceProperties
  0.16%  375.71us         1  375.71us  375.71us  375.71us  cudaMallocPitch
  0.12%  288.69us        37  7.8020us  2.0340us  19.369us  cudaMemcpyAsync
  0.08%  192.52us        90  2.1390us     102ns  74.268us  cuDeviceGetAttribute
  0.07%  173.76us         1  173.76us  173.76us  173.76us  cuDeviceTotalMem
  0.07%  166.88us         6  27.812us  5.0360us  133.26us  cudaMemcpy
  0.06%  141.28us         3  47.093us  8.5410us  115.78us  cudaFree
  0.01%  35.958us         4  8.9890us  6.9280us  12.941us  cudaLaunch
  0.01%  24.282us        12  2.0230us  1.4060us  7.7380us  cudaFuncGetAttributes
  0.01%  20.928us         1  20.928us  20.928us  20.928us  cuDeviceGetName
  0.01%  13.490us         1  13.490us  13.490us  13.490us  cudaMemcpy2D
  0.00%  6.2260us         1  6.2260us  6.2260us  6.2260us  cudaCreateTextureObject
  0.00%  3.4210us         9     380ns     217ns  1.1950us  cudaGetDevice
  0.00%  3.1190us        11     283ns     222ns     647ns  cudaDeviceGetAttribute
  0.00%  2.9770us         3     992ns     691ns  1.3890us  cudaEventCreateWithFlags
  0.00%  2.6230us         3     874ns     623ns  1.2060us  cudaEventRecord
  0.00%  2.3380us         2  1.1690us     188ns  2.1500us  cuDeviceGetCount
  0.00%  2.1010us         3     700ns     551ns     891ns  cudaEventDestroy
  0.00%  1.7210us         4     430ns     197ns     836ns  cudaConfigureCall
  0.00%  1.3790us         7     197ns     119ns     284ns  cudaSetupArgument
  0.00%     339ns         2     169ns     124ns     215ns  cuDeviceGet
  0.00%     138ns         1     138ns     138ns     138ns  cudaCreateChannelDesc
