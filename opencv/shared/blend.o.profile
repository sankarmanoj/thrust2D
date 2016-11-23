==12092== NVPROF is profiling process 12092, command: ./blend.o
==12092== Profiling application: ./blend.o
==12092== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 71.16%  6.3737ms         1  6.3737ms  6.3737ms  6.3737ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<blendFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 22.59%  2.0234ms         1  2.0234ms  2.0234ms  2.0234ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.66%  327.56us         3  109.19us  1.2800us  168.74us  [CUDA memcpy HtoD]
  2.59%  231.88us         1  231.88us  231.88us  231.88us  [CUDA memcpy DtoH]

==12092== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.93%  3.99710s         2  1.99855s  12.193ms  3.98490s  cudaMalloc
  0.42%  16.945ms         1  16.945ms  16.945ms  16.945ms  cudaFree
  0.29%  11.855ms         2  5.9273ms  25.623us  11.829ms  cudaMallocPitch
  0.21%  8.4372ms         2  4.2186ms  2.0529ms  6.3843ms  cudaDeviceSynchronize
  0.09%  3.7471ms         2  1.8736ms  1.1099ms  2.6372ms  cudaLaunch
  0.02%  878.77us         2  439.38us  34.735us  844.03us  cudaMemcpy
  0.02%  684.20us         2  342.10us  333.13us  351.07us  cudaMemcpy2D
  0.01%  237.13us        91  2.6050us     138ns  88.975us  cuDeviceGetAttribute
  0.00%  194.95us         1  194.95us  194.95us  194.95us  cudaGetDeviceProperties
  0.00%  179.17us         1  179.17us  179.17us  179.17us  cuDeviceTotalMem
  0.00%  54.389us         2  27.194us  22.238us  32.151us  cudaCreateTextureObject
  0.00%  36.027us         8  4.5030us  2.6940us  11.038us  cudaFuncGetAttributes
  0.00%  27.260us         1  27.260us  27.260us  27.260us  cuDeviceGetName
  0.00%  21.760us         2  10.880us  9.4770us  12.283us  cudaEventCreateWithFlags
  0.00%  10.163us         6  1.6930us     406ns  4.4090us  cudaGetDevice
  0.00%  9.0120us         2  4.5060us  3.8430us  5.1690us  cudaEventRecord
  0.00%  6.4170us        11     583ns     300ns  1.9650us  cudaDeviceGetAttribute
  0.00%  5.8150us         2  2.9070us  2.5040us  3.3110us  cudaEventDestroy
  0.00%  5.3960us         2  2.6980us     845ns  4.5510us  cudaSetupArgument
  0.00%  5.3300us         2  2.6650us  1.9040us  3.4260us  cudaConfigureCall
  0.00%  2.2900us         3     763ns     167ns  1.8120us  cuDeviceGetCount
  0.00%  1.2240us         3     408ns     203ns     682ns  cuDeviceGet
  0.00%     519ns         2     259ns     243ns     276ns  cudaCreateChannelDesc
