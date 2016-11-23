==12182== NVPROF is profiling process 12182, command: ./erode.o
==12182== Profiling application: ./erode.o
==12182== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 71.43%  7.7688ms         3  2.5896ms  2.1785ms  2.8745ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 27.72%  3.0146ms         1  3.0146ms  3.0146ms  3.0146ms  void thrust::transform_texture_kernel<unsigned char, erodeFunctor>(unsigned __int64, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, erodeFunctor)
  0.46%  49.536us         6  8.2560us     672ns  45.312us  [CUDA memcpy HtoD]
  0.37%  40.192us         1  40.192us  40.192us  40.192us  [CUDA memcpy DtoH]
  0.03%  3.2000us         1  3.2000us  3.2000us  3.2000us  [CUDA memcpy DtoD]

==12182== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.53%  2.97035s         8  371.29ms  8.8080us  2.96951s  cudaMalloc
  0.26%  7.8971ms         3  2.6324ms  2.1804ms  2.8819ms  cudaDeviceSynchronize
  0.11%  3.2598ms         6  543.30us  5.9600us  3.1234ms  cudaMemcpy
  0.03%  937.54us         4  234.39us  19.554us  832.19us  cudaLaunch
  0.02%  606.52us         1  606.52us  606.52us  606.52us  cudaMallocPitch
  0.02%  511.07us         2  255.54us  215.78us  295.29us  cudaGetDeviceProperties
  0.01%  269.86us        91  2.9650us     139ns  96.499us  cuDeviceGetAttribute
  0.01%  202.42us         3  67.472us  11.617us  146.87us  cudaFree
  0.01%  177.50us         1  177.50us  177.50us  177.50us  cuDeviceTotalMem
  0.00%  77.075us         1  77.075us  77.075us  77.075us  cudaMemcpyAsync
  0.00%  47.967us        12  3.9970us  2.7980us  10.043us  cudaFuncGetAttributes
  0.00%  36.604us         1  36.604us  36.604us  36.604us  cudaMemcpy2D
  0.00%  34.620us         1  34.620us  34.620us  34.620us  cuDeviceGetName
  0.00%  14.295us         3  4.7650us  2.5320us  6.2190us  cudaEventCreateWithFlags
  0.00%  12.979us         1  12.979us  12.979us  12.979us  cudaCreateTextureObject
  0.00%  9.9950us         3  3.3310us  1.6710us  4.3520us  cudaEventRecord
  0.00%  9.3000us         9  1.0330us     410ns  2.2700us  cudaGetDevice
  0.00%  7.7150us         3  2.5710us  1.4400us  3.6750us  cudaEventDestroy
  0.00%  6.2030us        11     563ns     349ns  1.5140us  cudaDeviceGetAttribute
  0.00%  5.9820us         4  1.4950us     754ns  2.2920us  cudaConfigureCall
  0.00%  3.6770us         7     525ns     202ns  1.3200us  cudaSetupArgument
  0.00%  3.6580us         3  1.2190us     324ns  2.7220us  cuDeviceGetCount
  0.00%  1.6650us         3     555ns     266ns  1.0190us  cuDeviceGet
  0.00%     245ns         1     245ns     245ns     245ns  cudaCreateChannelDesc
