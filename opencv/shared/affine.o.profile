==13199== NVPROF is profiling process 13199, command: ./affine.o
==13199== Profiling application: ./affine.o
==13199== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 84.91%  11.697ms         1  11.697ms  11.697ms  11.697ms  void thrust::for_each_kernel<float, AffineTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, AffineTransformFunctor)
 12.86%  1.7718ms         3  590.59us  181.40us  797.89us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.30%  179.67us         1  179.67us  179.67us  179.67us  [CUDA memcpy DtoH]
  0.92%  127.13us        11  11.557us     544ns  121.15us  [CUDA memcpy HtoD]

==13199== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.69%  5.51885s         7  788.41ms  15.000us  5.51813s  cudaMalloc
  0.25%  13.981ms         4  3.4953ms  220.10us  12.082ms  cudaDeviceSynchronize
  0.02%  900.73us         1  900.73us  900.73us  900.73us  cudaGetDeviceProperties
  0.01%  640.34us         4  160.08us  25.162us  555.60us  cudaLaunch
  0.01%  628.04us         5  125.61us  12.919us  555.07us  cudaMemcpy
  0.01%  289.84us         7  41.405us  3.1190us  266.70us  cudaMemcpyAsync
  0.00%  225.69us        91  2.4800us     131ns  93.187us  cuDeviceGetAttribute
  0.00%  225.45us         3  75.150us  43.128us  129.87us  cudaFree
  0.00%  190.96us         1  190.96us  190.96us  190.96us  cuDeviceTotalMem
  0.00%  39.342us        12  3.2780us  2.2240us  7.0850us  cudaFuncGetAttributes
  0.00%  36.694us         1  36.694us  36.694us  36.694us  cuDeviceGetName
  0.00%  12.501us         9  1.3890us     391ns  6.1990us  cudaGetDevice
  0.00%  8.6220us         3  2.8740us  2.4580us  3.4240us  cudaEventCreateWithFlags
  0.00%  6.8310us         6  1.1380us     165ns  5.0500us  cudaSetupArgument
  0.00%  6.5090us        11     591ns     315ns  1.8310us  cudaDeviceGetAttribute
  0.00%  6.3300us         3  2.1100us  1.7650us  2.5300us  cudaEventRecord
  0.00%  4.7250us         3  1.5750us  1.3530us  1.7020us  cudaEventDestroy
  0.00%  4.7190us         3  1.5730us     197ns  3.8670us  cuDeviceGetCount
  0.00%  4.0100us         4  1.0020us     845ns  1.2900us  cudaConfigureCall
  0.00%  1.3890us         3     463ns     298ns     551ns  cuDeviceGet
