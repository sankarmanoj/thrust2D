==8268== NVPROF is profiling process 8268, command: ./pyrup.o
==8268== Profiling application: ./pyrup.o
==8268== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 72.77%  601.66us         1  601.66us  601.66us  601.66us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 18.60%  153.79us        56  2.7460us     543ns  122.18us  [CUDA memcpy HtoD]
  5.24%  43.341us        51     849ns     319ns  18.711us  [CUDA memcpy DtoH]
  1.25%  10.299us         4  2.5740us  1.3440us  3.7740us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.21%  10.044us         1  10.044us  10.044us  10.044us  [CUDA memcpy DtoD]
  0.62%  5.1180us         1  5.1180us  5.1180us  5.1180us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.31%  2.5270us         1  2.5270us  2.5270us  2.5270us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8268== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.39%  807.88ms        10  80.788ms  5.6570us  806.29ms  cudaMalloc
  2.34%  19.787ms         1  19.787ms  19.787ms  19.787ms  cudaGetDeviceProperties
  1.19%  10.051ms        90  111.68us     135ns  4.7126ms  cuDeviceGetAttribute
  0.53%  4.5017ms         1  4.5017ms  4.5017ms  4.5017ms  cuDeviceGetName
  0.25%  2.1298ms         4  532.46us  12.034us  2.0620ms  cudaFree
  0.10%  843.02us       101  8.3460us  1.9200us  300.70us  cudaMemcpyAsync
  0.08%  640.64us         1  640.64us  640.64us  640.64us  cudaDeviceSynchronize
  0.05%  449.71us         1  449.71us  449.71us  449.71us  cuDeviceTotalMem
  0.03%  247.64us         7  35.377us  7.2450us  115.84us  cudaMemcpy
  0.02%  201.56us         7  28.794us  10.179us  65.667us  cudaLaunch
  0.01%  108.47us        25  4.3380us  1.4630us  22.935us  cudaFuncGetAttributes
  0.00%  19.890us        19  1.0460us     210ns  4.7680us  cudaGetDevice
  0.00%  12.051us         6  2.0080us  1.0270us  2.9430us  cudaEventCreateWithFlags
  0.00%  11.747us         2  5.8730us  4.5260us  7.2210us  cuDeviceGetCount
  0.00%  10.201us         6  1.7000us     824ns  3.2570us  cudaEventRecord
  0.00%  8.9980us        11     818ns     213ns  5.5040us  cudaSetupArgument
  0.00%  8.3310us         6  1.3880us     821ns  2.1030us  cudaEventDestroy
  0.00%  8.0420us        15     536ns     282ns  1.8460us  cudaDeviceGetAttribute
  0.00%  5.0870us         7     726ns     320ns  1.4620us  cudaConfigureCall
  0.00%  2.3010us         2  1.1500us     651ns  1.6500us  cuDeviceGet
  0.00%  2.1920us         1  2.1920us  2.1920us  2.1920us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%     636ns         1     636ns     636ns     636ns  cudaGetLastError
