==6186== NVPROF is profiling process 6186, command: ./pyrup.o
==6186== Profiling application: ./pyrup.o
==6186== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 73.61%  598.69us         1  598.69us  598.69us  598.69us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 16.38%  133.19us        56  2.3780us     543ns  73.525us  [CUDA memcpy HtoD]
  7.19%  58.457us        51  1.1460us     319ns  18.749us  [CUDA memcpy DtoH]
  1.27%  10.335us         4  2.5830us  1.3760us  3.7110us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.62%  5.0240us         1  5.0240us  5.0240us  5.0240us  [CUDA memcpy DtoD]
  0.62%  5.0230us         1  5.0230us  5.0230us  5.0230us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.31%  2.5600us         1  2.5600us  2.5600us  2.5600us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6186== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 96.74%  722.61ms        10  72.261ms  8.1930us  720.28ms  cudaMalloc
  1.10%  8.2016ms         4  2.0504ms  6.1650us  8.1567ms  cudaFree
  1.02%  7.5960ms        90  84.399us     169ns  4.2122ms  cuDeviceGetAttribute
  0.57%  4.2385ms         1  4.2385ms  4.2385ms  4.2385ms  cudaGetDeviceProperties
  0.18%  1.3790ms       101  13.653us  2.0610us  471.11us  cudaMemcpyAsync
  0.11%  835.22us         1  835.22us  835.22us  835.22us  cuDeviceTotalMem
  0.09%  687.49us         7  98.213us  8.3190us  481.19us  cudaMemcpy
  0.08%  603.78us         1  603.78us  603.78us  603.78us  cudaDeviceSynchronize
  0.07%  523.45us         1  523.45us  523.45us  523.45us  cuDeviceGetName
  0.02%  179.63us         7  25.661us  11.414us  35.156us  cudaLaunch
  0.01%  65.566us        25  2.6220us  1.4130us  6.7210us  cudaFuncGetAttributes
  0.00%  15.539us        19     817ns     218ns  2.8090us  cudaGetDevice
  0.00%  10.648us         6  1.7740us  1.4240us  2.1140us  cudaEventCreateWithFlags
  0.00%  9.1740us         6  1.5290us  1.1760us  1.8670us  cudaEventRecord
  0.00%  7.6920us        11     699ns     115ns  4.2780us  cudaSetupArgument
  0.00%  7.6360us         6  1.2720us  1.0140us  1.5450us  cudaEventDestroy
  0.00%  6.0410us         7     863ns     332ns  1.2100us  cudaConfigureCall
  0.00%  4.3830us        15     292ns     203ns     896ns  cudaDeviceGetAttribute
  0.00%  2.1880us         2  1.0940us     807ns  1.3810us  cuDeviceGetCount
  0.00%  1.4030us         1  1.4030us  1.4030us  1.4030us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     517ns         1     517ns     517ns     517ns  cudaGetLastError
  0.00%     422ns         2     211ns     194ns     228ns  cuDeviceGet
