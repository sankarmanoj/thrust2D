==6318== NVPROF is profiling process 6318, command: ./dilate.o
==6318== Profiling application: ./dilate.o
==6318== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 31.09%  25.884us         6  4.3140us     576ns  21.406us  [CUDA memcpy HtoD]
 28.82%  23.998us         1  23.998us  23.998us  23.998us  void thrust::transform_texture_kernel<unsigned char, dilateFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, dilateFunctor)
 25.25%  21.022us         1  21.022us  21.022us  21.022us  [CUDA memcpy DtoH]
  8.80%  7.3280us         3  2.4420us  2.2720us  2.6560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.03%  5.0240us         1  5.0240us  5.0240us  5.0240us  [CUDA memcpy DtoD]

==6318== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.53%  517.44ms         8  64.680ms  7.2420us  514.04ms  cudaMalloc
  1.85%  9.8221ms         2  4.9111ms  257.08us  9.5651ms  cudaGetDeviceProperties
  0.31%  1.6382ms         1  1.6382ms  1.6382ms  1.6382ms  cudaMallocPitch
  0.12%  632.01us         3  210.67us  17.281us  586.22us  cudaFree
  0.06%  308.45us        90  3.4270us     122ns  113.48us  cuDeviceGetAttribute
  0.05%  256.01us         6  42.669us  6.3340us  106.33us  cudaMemcpy
  0.04%  198.39us         1  198.39us  198.39us  198.39us  cuDeviceTotalMem
  0.02%  82.399us         4  20.599us  10.357us  31.810us  cudaLaunch
  0.01%  36.286us         1  36.286us  36.286us  36.286us  cudaMemcpy2D
  0.01%  35.103us         1  35.103us  35.103us  35.103us  cuDeviceGetName
  0.01%  33.288us        12  2.7740us  1.9060us  5.3260us  cudaFuncGetAttributes
  0.00%  23.296us         1  23.296us  23.296us  23.296us  cudaMemcpyAsync
  0.00%  15.228us         1  15.228us  15.228us  15.228us  cudaCreateTextureObject
  0.00%  6.2510us         3  2.0830us  1.3340us  2.7090us  cudaEventCreateWithFlags
  0.00%  5.7590us         9     639ns     304ns  1.7630us  cudaGetDevice
  0.00%  5.1750us        11     470ns     368ns  1.0580us  cudaDeviceGetAttribute
  0.00%  4.6940us         3  1.5640us  1.0770us  1.8960us  cudaEventRecord
  0.00%  3.6230us         3  1.2070us     834ns  1.4930us  cudaEventDestroy
  0.00%  3.4420us         4     860ns     349ns  1.3010us  cudaConfigureCall
  0.00%  2.8860us         2  1.4430us     419ns  2.4670us  cuDeviceGetCount
  0.00%  2.8210us         7     403ns     196ns     905ns  cudaSetupArgument
  0.00%     575ns         2     287ns     148ns     427ns  cuDeviceGet
  0.00%     282ns         1     282ns     282ns     282ns  cudaCreateChannelDesc
