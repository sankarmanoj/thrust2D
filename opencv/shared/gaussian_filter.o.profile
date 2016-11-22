==25766== NVPROF is profiling process 25766, command: ./gaussian_filter.o
==25766== Profiling application: ./gaussian_filter.o
==25766== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.31%  83.426us         3  27.808us  1.2160us  80.994us  [CUDA memcpy HtoD]
 39.80%  82.370us         1  82.370us  82.370us  82.370us  [CUDA memcpy DtoH]
  8.89%  18.401us         2  9.2000us  9.1530us  9.2480us  [CUDA memcpy DtoA]
  4.45%  9.2160us         1  9.2160us  9.2160us  9.2160us  thrust::convolutionRowsKernel(float*, int, int)
  4.33%  8.9610us         1  8.9610us  8.9610us  8.9610us  thrust::convolutionColumnsKernel(float*, int, int)
  2.23%  4.6080us         1  4.6080us  4.6080us  4.6080us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25766== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.38%  133.84ms         3  44.615ms  355.66us  133.12ms  cudaMalloc
  0.70%  956.60us         1  956.60us  956.60us  956.60us  cuDeviceTotalMem
  0.67%  926.28us        90  10.292us     681ns  341.97us  cuDeviceGetAttribute
  0.57%  777.68us         1  777.68us  777.68us  777.68us  cudaGetDeviceProperties
  0.26%  363.06us         1  363.06us  363.06us  363.06us  cudaMallocArray
  0.15%  207.79us         2  103.90us  10.245us  197.55us  cudaMemcpy
  0.09%  121.95us         1  121.95us  121.95us  121.95us  cudaFree
  0.06%  84.289us         1  84.289us  84.289us  84.289us  cuDeviceGetName
  0.04%  50.577us         1  50.577us  50.577us  50.577us  cudaMemcpyAsync
  0.03%  39.168us         2  19.584us  8.4210us  30.747us  cudaMemcpyToArray
  0.02%  33.945us         3  11.315us  8.0290us  13.177us  cudaLaunch
  0.01%  7.5630us         1  7.5630us  7.5630us  7.5630us  cudaMemcpyToSymbol
  0.01%  6.9910us         4  1.7470us  1.3490us  2.9040us  cudaFuncGetAttributes
  0.00%  6.1280us         2  3.0640us  1.6740us  4.4540us  cuDeviceGetCount
  0.00%  4.1360us         2  2.0680us  1.4050us  2.7310us  cudaBindTextureToArray
  0.00%  3.2010us        11     291ns     195ns  1.0480us  cudaDeviceGetAttribute
  0.00%  2.3210us         2  1.1600us  1.0560us  1.2650us  cuDeviceGet
  0.00%  1.7230us         2     861ns     596ns  1.1270us  cudaUnbindTexture
  0.00%  1.7170us         3     572ns     222ns  1.2560us  cudaGetDevice
  0.00%  1.3070us         3     435ns     198ns     799ns  cudaConfigureCall
  0.00%  1.2270us         1  1.2270us  1.2270us  1.2270us  cudaEventCreateWithFlags
  0.00%  1.1860us         2     593ns     489ns     697ns  cudaGetChannelDesc
  0.00%  1.0750us         7     153ns     111ns     267ns  cudaSetupArgument
  0.00%  1.0500us         1  1.0500us  1.0500us  1.0500us  cudaEventRecord
  0.00%     916ns         1     916ns     916ns     916ns  cudaEventDestroy
  0.00%     202ns         1     202ns     202ns     202ns  cudaCreateChannelDesc
