==3563== NVPROF is profiling process 3563, command: ./erode.o
==3563== Profiling application: ./erode.o
==3563== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.44%  92.959us         1  92.959us  92.959us  92.959us  [CUDA memcpy DtoH]
 38.00%  87.359us         6  14.559us     576ns  81.915us  [CUDA memcpy HtoD]
 10.74%  24.680us         1  24.680us  24.680us  24.680us  void thrust::transform_texture_kernel<float, erodeFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  5.38%  12.356us         1  12.356us  12.356us  12.356us  [CUDA memcpy DtoD]
  3.95%  9.0910us         2  4.5450us  4.4820us  4.6090us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.49%  3.4250us         1  3.4250us  3.4250us  3.4250us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3563== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.19%  770.46ms         8  96.308ms  9.5500us  761.80ms  cudaMalloc
  1.51%  11.940ms         2  5.9700ms  219.50us  11.720ms  cudaGetDeviceProperties
  0.68%  5.4184ms         3  1.8061ms  22.592us  3.7477ms  cudaFree
  0.42%  3.2967ms         1  3.2967ms  3.2967ms  3.2967ms  cudaMallocPitch
  0.07%  539.73us         6  89.955us  4.2010us  307.24us  cudaMemcpy
  0.05%  421.61us        90  4.6840us     114ns  170.79us  cuDeviceGetAttribute
  0.02%  187.32us         1  187.32us  187.32us  187.32us  cuDeviceTotalMem
  0.02%  123.57us         1  123.57us  123.57us  123.57us  cudaMemcpyAsync
  0.02%  123.46us         4  30.865us  15.857us  41.815us  cudaLaunch
  0.01%  78.040us         1  78.040us  78.040us  78.040us  cudaMemcpy2D
  0.01%  39.726us        12  3.3100us  2.1340us  8.1580us  cudaFuncGetAttributes
  0.00%  36.356us         1  36.356us  36.356us  36.356us  cuDeviceGetName
  0.00%  17.279us         1  17.279us  17.279us  17.279us  cudaCreateTextureObject
  0.00%  10.205us         3  3.4010us  2.5220us  5.0930us  cudaEventCreateWithFlags
  0.00%  9.8830us         9  1.0980us     286ns  3.5480us  cudaGetDevice
  0.00%  5.7860us         3  1.9280us  1.8200us  2.0530us  cudaEventRecord
  0.00%  5.0070us         4  1.2510us  1.1600us  1.3770us  cudaConfigureCall
  0.00%  4.4170us        11     401ns     248ns  1.0800us  cudaDeviceGetAttribute
  0.00%  4.3740us         2  2.1870us     405ns  3.9690us  cuDeviceGetCount
  0.00%  4.3350us         3  1.4450us  1.4010us  1.5010us  cudaEventDestroy
  0.00%  3.2950us         7     470ns     143ns     927ns  cudaSetupArgument
  0.00%     424ns         2     212ns     158ns     266ns  cuDeviceGet
  0.00%     368ns         1     368ns     368ns     368ns  cudaCreateChannelDesc
