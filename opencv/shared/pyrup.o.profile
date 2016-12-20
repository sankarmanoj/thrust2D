==9877== NVPROF is profiling process 9877, command: ./pyrup.o 1631
==9877== Profiling application: ./pyrup.o 1631
==9877== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 48.20%  77.663ms         1  77.663ms  77.663ms  77.663ms  [CUDA memcpy DtoH]
 12.18%  19.622ms         1  19.622ms  19.622ms  19.622ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 12.08%  19.467ms         2  9.7333ms  8.0591ms  11.407ms  [CUDA memcpy DtoA]
 11.76%  18.951ms         1  18.951ms  18.951ms  18.951ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 10.84%  17.459ms         5  3.4919ms     704ns  17.455ms  [CUDA memcpy HtoD]
  2.63%  4.2335ms         3  1.4112ms  578.62us  3.0124ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.31%  3.7155ms         1  3.7155ms  3.7155ms  3.7155ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9877== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 78.89%  629.75ms         7  89.964ms  12.987us  620.80ms  cudaMalloc
 17.71%  141.38ms         4  35.345ms  41.259us  137.70ms  cudaMemcpy
  2.27%  18.143ms         1  18.143ms  18.143ms  18.143ms  cudaMemcpyAsync
  0.55%  4.4172ms         1  4.4172ms  4.4172ms  4.4172ms  cudaDeviceSynchronize
  0.28%  2.2702ms         1  2.2702ms  2.2702ms  2.2702ms  cudaMallocArray
  0.11%  851.33us        90  9.4590us     131ns  363.26us  cuDeviceGetAttribute
  0.07%  527.16us         1  527.16us  527.16us  527.16us  cuDeviceTotalMem
  0.04%  299.41us         3  99.802us  65.245us  159.93us  cudaFree
  0.03%  249.26us         6  41.543us  9.6410us  66.430us  cudaLaunch
  0.01%  112.03us         2  56.016us  14.808us  97.225us  cudaMemcpyToArray
  0.01%  61.984us        16  3.8740us  2.2710us  9.3290us  cudaFuncGetAttributes
  0.01%  59.023us         1  59.023us  59.023us  59.023us  cuDeviceGetName
  0.01%  51.721us         1  51.721us  51.721us  51.721us  cudaMemcpyToSymbol
  0.00%  18.457us         2  9.2280us  3.9540us  14.503us  cudaCreateTextureObject
  0.00%  16.241us        12  1.3530us     337ns  4.1560us  cudaGetDevice
  0.00%  13.345us         4  3.3360us  2.8120us  4.3220us  cudaEventCreateWithFlags
  0.00%  12.224us        12  1.0180us     157ns  4.8890us  cudaSetupArgument
  0.00%  10.688us         4  2.6720us  2.5020us  2.9620us  cudaEventRecord
  0.00%  9.2970us         6  1.5490us     320ns  2.7130us  cudaConfigureCall
  0.00%  7.0880us         4  1.7720us  1.7000us  1.8200us  cudaEventDestroy
  0.00%  6.0820us         2  3.0410us  1.3720us  4.7100us  cuDeviceGetCount
  0.00%  6.0200us        11     547ns     310ns  1.7830us  cudaDeviceGetAttribute
  0.00%  1.0850us         2     542ns     499ns     586ns  cuDeviceGet
  0.00%     329ns         1     329ns     329ns     329ns  cudaCreateChannelDesc
