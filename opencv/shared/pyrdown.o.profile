==5461== NVPROF is profiling process 5461, command: ./pyrdown.o
==5461== Profiling application: ./pyrdown.o
==5461== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 49.37%  2.8714ms         1  2.8714ms  2.8714ms  2.8714ms  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 41.46%  2.4113ms        51  47.279us     320ns  2.3857ms  [CUDA memcpy DtoH]
  5.15%  299.33us         1  299.33us  299.33us  299.33us  void thrust::for_each_kernel<float, pyrdownTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::launcher_config, pyrdownTransformFunctor)
  2.55%  148.05us        57  2.5970us     543ns  115.09us  [CUDA memcpy HtoD]
  0.72%  41.884us         4  10.471us  1.9200us  18.046us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.71%  41.244us         1  41.244us  41.244us  41.244us  [CUDA memcpy DtoD]
  0.05%  3.0390us         1  3.0390us  3.0390us  3.0390us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==5461== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.45%  907.29ms        11  82.481ms  8.4060us  903.64ms  cudaMalloc
  1.56%  14.688ms        90  163.20us     103ns  5.6714ms  cuDeviceGetAttribute
  0.53%  4.9443ms       101  48.953us  1.8550us  662.73us  cudaMemcpyAsync
  0.43%  4.0638ms         8  507.98us  13.310us  3.7170ms  cudaMemcpy
  0.41%  3.8539ms         2  1.9269ms  711.51us  3.1424ms  cudaGetDeviceProperties
  0.37%  3.4595ms         2  1.7298ms  548.66us  2.9108ms  cudaDeviceSynchronize
  0.09%  858.01us         1  858.01us  858.01us  858.01us  cuDeviceGetName
  0.07%  682.58us         1  682.58us  682.58us  682.58us  cuDeviceTotalMem
  0.04%  392.59us         7  56.084us  14.040us  163.01us  cudaLaunch
  0.03%  257.10us         4  64.275us  11.930us  139.08us  cudaFree
  0.01%  93.935us        21  4.4730us  1.4520us  16.962us  cudaFuncGetAttributes
  0.00%  23.872us        16  1.4920us     238ns  9.4120us  cudaGetDevice
  0.00%  13.169us        13  1.0130us     146ns  8.1310us  cudaSetupArgument
  0.00%  12.321us         5  2.4640us  1.4240us  3.2680us  cudaEventCreateWithFlags
  0.00%  11.363us         7  1.6230us     410ns  3.4880us  cudaConfigureCall
  0.00%  10.726us         5  2.1450us  1.1880us  2.7780us  cudaEventRecord
  0.00%  9.8200us        15     654ns     208ns  3.7670us  cudaDeviceGetAttribute
  0.00%  7.2440us         5  1.4480us     934ns  1.7750us  cudaEventDestroy
  0.00%  2.4830us         2  1.2410us     430ns  2.0530us  cuDeviceGetCount
  0.00%  2.3380us         1  2.3380us  2.3380us  2.3380us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  1.0090us         2     504ns     486ns     523ns  cudaGetLastError
  0.00%     577ns         2     288ns     221ns     356ns  cuDeviceGet
