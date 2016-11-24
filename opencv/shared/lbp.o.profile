==29217== NVPROF is profiling process 29217, command: ./lbp.o
==29217== Profiling application: ./lbp.o
==29217== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 50.95%  116.29us         1  116.29us  116.29us  116.29us  [CUDA memcpy DtoH]
 22.80%  52.032us         1  52.032us  52.032us  52.032us  void thrust::transform_texture_kernel<unsigned char, lbpFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
 20.96%  47.840us         6  7.9730us     832ns  41.984us  [CUDA memcpy HtoD]
  4.08%  9.3120us         3  3.1040us  2.2080us  4.8640us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.22%  2.7840us         1  2.7840us  2.7840us  2.7840us  [CUDA memcpy DtoD]

==29217== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.10%  293.67ms         8  36.708ms  6.4780us  293.18ms  cudaMalloc
  0.20%  607.34us         1  607.34us  607.34us  607.34us  cudaMallocPitch
  0.15%  453.48us         2  226.74us  201.47us  252.01us  cudaGetDeviceProperties
  0.13%  394.54us         6  65.756us  6.1680us  311.19us  cudaMemcpy
  0.11%  311.39us        91  3.4210us     141ns  115.26us  cuDeviceGetAttribute
  0.09%  277.32us         3  92.438us  8.7010us  194.63us  cudaFree
  0.07%  209.14us         1  209.14us  209.14us  209.14us  cuDeviceTotalMem
  0.04%  128.12us         4  32.029us  10.269us  60.658us  cudaLaunch
  0.03%  84.989us         1  84.989us  84.989us  84.989us  cudaMemcpy2D
  0.02%  52.693us         1  52.693us  52.693us  52.693us  cuDeviceGetName
  0.02%  51.535us         1  51.535us  51.535us  51.535us  cudaMemcpyAsync
  0.01%  37.290us        12  3.1070us  2.2050us  7.8850us  cudaFuncGetAttributes
  0.01%  24.687us         1  24.687us  24.687us  24.687us  cudaCreateTextureObject
  0.00%  7.6660us         3  2.5550us  1.3260us  3.4650us  cudaEventCreateWithFlags
  0.00%  6.9510us        11     631ns     419ns  1.8120us  cudaDeviceGetAttribute
  0.00%  6.1840us         9     687ns     353ns  2.8050us  cudaGetDevice
  0.00%  5.8130us         3  1.9370us  1.0430us  3.0170us  cudaEventRecord
  0.00%  5.1110us         4  1.2770us     298ns  2.0550us  cudaConfigureCall
  0.00%  5.0620us         3  1.6870us     220ns  4.2990us  cuDeviceGetCount
  0.00%  3.6470us         3  1.2150us     724ns  1.8380us  cudaEventDestroy
  0.00%  3.4270us         7     489ns     146ns  1.2500us  cudaSetupArgument
  0.00%  1.3540us         3     451ns     257ns     789ns  cuDeviceGet
  0.00%     287ns         1     287ns     287ns     287ns  cudaCreateChannelDesc
