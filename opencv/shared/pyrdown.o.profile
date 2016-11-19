==6487== NVPROF is profiling process 6487, command: ./pyrdown.o
==6487== Profiling application: ./pyrdown.o
==6487== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 44.30%  109.83us        25  4.3930us     736ns  81.283us  [CUDA memcpy HtoD]
 34.60%  85.795us         1  85.795us  85.795us  85.795us  void thrust::for_each_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::warp_launcher_config, convolutionFunctor)
 14.44%  35.809us        19  1.8840us     320ns  20.961us  [CUDA memcpy DtoH]
  5.00%  12.385us         4  3.0960us  1.4080us  5.3450us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.66%  4.1280us         1  4.1280us  4.1280us  4.1280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6487== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.04%  187.82ms        11  17.075ms  4.1800us  186.93ms  cudaMalloc
  0.24%  447.10us         2  223.55us  216.96us  230.14us  cudaGetDeviceProperties
  0.18%  349.63us        37  9.4490us  2.0370us  88.449us  cudaMemcpyAsync
  0.13%  240.86us        90  2.6760us     103ns  93.608us  cuDeviceGetAttribute
  0.12%  225.00us         5  45.000us  3.7600us  130.40us  cudaFree
  0.11%  216.73us         7  30.961us  4.4400us  143.57us  cudaMemcpy
  0.10%  197.09us         1  197.09us  197.09us  197.09us  cuDeviceTotalMem
  0.04%  68.166us         6  11.361us  5.8020us  25.752us  cudaLaunch
  0.02%  33.175us        20  1.6580us  1.3370us  3.6160us  cudaFuncGetAttributes
  0.01%  23.387us         1  23.387us  23.387us  23.387us  cuDeviceGetName
  0.00%  6.9900us        15     466ns     210ns  1.7440us  cudaGetDevice
  0.00%  5.0030us         5  1.0000us     597ns  1.5720us  cudaEventCreateWithFlags
  0.00%  4.4030us         5     880ns     618ns  1.2460us  cudaEventRecord
  0.00%  3.4330us         5     686ns     497ns     906ns  cudaEventDestroy
  0.00%  2.8510us        11     259ns     194ns     696ns  cudaDeviceGetAttribute
  0.00%  2.3990us         6     399ns     162ns     794ns  cudaConfigureCall
  0.00%  1.7250us         8     215ns     113ns     397ns  cudaSetupArgument
  0.00%  1.3150us         2     657ns     131ns  1.1840us  cuDeviceGetCount
  0.00%     299ns         2     149ns     115ns     184ns  cuDeviceGet
