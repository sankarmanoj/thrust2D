==3779== NVPROF is profiling process 3779, command: ./lbp.o
==3779== Profiling application: ./lbp.o
==3779== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.44%  85.891us         6  14.315us     576ns  80.962us  [CUDA memcpy HtoD]
 34.53%  83.683us         1  83.683us  83.683us  83.683us  [CUDA memcpy DtoH]
 22.57%  54.689us         1  54.689us  54.689us  54.689us  void thrust::transform_texture_kernel<float, lbpFunctor>(unsigned __int64, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, lbpFunctor)
  3.90%  9.4400us         1  9.4400us  9.4400us  9.4400us  [CUDA memcpy DtoD]
  2.44%  5.9200us         2  2.9600us  2.7840us  3.1360us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.12%  2.7200us         1  2.7200us  2.7200us  2.7200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3779== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 93.07%  900.60ms         8  112.58ms  6.1120us  853.60ms  cudaMalloc
  3.65%  35.299ms         2  17.650ms  10.310ms  24.990ms  cudaGetDeviceProperties
  2.57%  24.846ms        90  276.07us     190ns  10.284ms  cuDeviceGetAttribute
  0.31%  3.0071ms         3  1.0024ms  481.10us  1.3378ms  cudaFree
  0.16%  1.5423ms         1  1.5423ms  1.5423ms  1.5423ms  cuDeviceTotalMem
  0.12%  1.1245ms         1  1.1245ms  1.1245ms  1.1245ms  cudaMallocPitch
  0.07%  646.51us         1  646.51us  646.51us  646.51us  cuDeviceGetName
  0.03%  314.77us         6  52.461us  5.7000us  239.74us  cudaMemcpy
  0.01%  89.533us         1  89.533us  89.533us  89.533us  cudaMemcpyAsync
  0.01%  78.747us         4  19.686us  11.892us  26.750us  cudaLaunch
  0.00%  36.430us        12  3.0350us  1.4160us  13.977us  cudaFuncGetAttributes
  0.00%  30.870us         1  30.870us  30.870us  30.870us  cudaMemcpy2D
  0.00%  14.423us         1  14.423us  14.423us  14.423us  cudaCreateTextureObject
  0.00%  5.7670us         9     640ns     216ns  1.8980us  cudaGetDevice
  0.00%  4.4960us         3  1.4980us  1.0860us  1.7730us  cudaEventCreateWithFlags
  0.00%  3.4200us         3  1.1400us     869ns  1.2850us  cudaEventRecord
  0.00%  3.2020us        11     291ns     208ns     857ns  cudaDeviceGetAttribute
  0.00%  3.1890us         3  1.0630us     754ns  1.3980us  cudaEventDestroy
  0.00%  3.1190us         4     779ns     391ns     961ns  cudaConfigureCall
  0.00%  2.4350us         2  1.2170us     299ns  2.1360us  cuDeviceGetCount
  0.00%  2.0670us         7     295ns     190ns     406ns  cudaSetupArgument
  0.00%     801ns         2     400ns     221ns     580ns  cuDeviceGet
  0.00%     185ns         1     185ns     185ns     185ns  cudaCreateChannelDesc
