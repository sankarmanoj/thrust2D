==8437== NVPROF is profiling process 8437, command: ./pyrup.o
==8437== Profiling application: ./pyrup.o
==8437== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 33.00%  73.920us         1  73.920us  73.920us  73.920us  [CUDA memcpy DtoH]
 15.54%  34.816us         1  34.816us  34.816us  34.816us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 13.28%  29.760us         2  14.880us  14.656us  15.104us  [CUDA memcpy DtoA]
 11.43%  25.600us         1  25.600us  25.600us  25.600us  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 10.94%  24.512us         1  24.512us  24.512us  24.512us  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 10.73%  24.032us         5  4.8060us  1.2160us  19.168us  [CUDA memcpy HtoD]
  5.08%  11.392us         3  3.7970us  2.1760us  5.1840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8437== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.63%  181.36ms         7  25.908ms  4.7440us  180.64ms  cudaMalloc
  0.38%  707.06us         1  707.06us  707.06us  707.06us  cuDeviceTotalMem
  0.33%  604.09us        90  6.7120us     424ns  226.64us  cuDeviceGetAttribute
  0.24%  438.95us         4  109.74us  4.9640us  417.45us  cudaMemcpy
  0.19%  344.63us         1  344.63us  344.63us  344.63us  cudaMallocArray
  0.08%  143.60us         3  47.865us  6.3040us  115.45us  cudaFree
  0.03%  54.806us         6  9.1340us  5.1380us  18.496us  cudaLaunch
  0.03%  54.503us         1  54.503us  54.503us  54.503us  cuDeviceGetName
  0.03%  46.320us         1  46.320us  46.320us  46.320us  cudaDeviceSynchronize
  0.02%  41.322us         2  20.661us  8.4160us  32.906us  cudaMemcpyToArray
  0.01%  26.252us        16  1.6400us  1.3970us  3.3640us  cudaFuncGetAttributes
  0.01%  14.885us         1  14.885us  14.885us  14.885us  cudaMemcpyAsync
  0.00%  7.4740us         2  3.7370us  2.3710us  5.1030us  cudaCreateTextureObject
  0.00%  7.0100us         1  7.0100us  7.0100us  7.0100us  cudaMemcpyToSymbol
  0.00%  5.4510us        12     454ns     115ns  3.2750us  cudaSetupArgument
  0.00%  4.6380us        12     386ns     211ns  1.3100us  cudaGetDevice
  0.00%  4.3820us         4  1.0950us     683ns  1.8890us  cudaEventCreateWithFlags
  0.00%  4.0240us         4  1.0060us     672ns  1.7230us  cudaEventRecord
  0.00%  3.5790us         2  1.7890us     690ns  2.8890us  cuDeviceGetCount
  0.00%  3.2910us        11     299ns     221ns     907ns  cudaDeviceGetAttribute
  0.00%  2.8080us         4     702ns     521ns  1.0210us  cudaEventDestroy
  0.00%  2.1250us         6     354ns     213ns     770ns  cudaConfigureCall
  0.00%  1.1850us         2     592ns     483ns     702ns  cuDeviceGet
  0.00%     103ns         1     103ns     103ns     103ns  cudaCreateChannelDesc
