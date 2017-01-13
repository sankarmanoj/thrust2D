==15054== NVPROF is profiling process 15054, command: ./sobel_filter.o 1631
==15054== Profiling application: ./sobel_filter.o 1631
==15054== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 31.07%  28.733ms         2  14.367ms  3.2201ms  25.513ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 23.00%  21.274ms         7  3.0392ms     704ns  21.268ms  [CUDA memcpy HtoD]
 22.82%  21.109ms         1  21.109ms  21.109ms  21.109ms  [CUDA memcpy DtoH]
  7.46%  6.8986ms         4  1.7246ms  1.7218ms  1.7260ms  [CUDA memcpy DtoA]
  5.08%  4.6979ms         2  2.3489ms  2.3457ms  2.3522ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  4.61%  4.2602ms         1  4.2602ms  4.2602ms  4.2602ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.49%  3.2324ms         2  1.6162ms  1.6007ms  1.6317ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  2.47%  2.2818ms         4  570.46us  563.10us  581.15us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==15054== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 88.67%  949.12ms        10  94.912ms  12.693us  942.20ms  cudaMalloc
  5.51%  58.971ms         5  11.794ms  62.728us  57.206ms  cudaMemcpy
  2.17%  23.234ms         1  23.234ms  23.234ms  23.234ms  cudaMemcpyAsync
  2.04%  21.796ms        90  242.18us     105ns  12.795ms  cuDeviceGetAttribute
  0.95%  10.152ms         2  5.0762ms  3.6413ms  6.5110ms  cudaMallocArray
  0.42%  4.4962ms         2  2.2481ms  91.521us  4.4047ms  cudaMemcpyToSymbol
  0.07%  797.87us        11  72.533us  27.533us  156.18us  cudaLaunch
  0.04%  481.60us         4  120.40us  53.370us  224.26us  cudaMemcpyToArray
  0.03%  366.53us         1  366.53us  366.53us  366.53us  cuDeviceTotalMem
  0.03%  331.78us         4  82.944us  58.937us  125.76us  cudaFree
  0.02%  166.31us         1  166.31us  166.31us  166.31us  cuDeviceGetName
  0.01%  137.18us        28  4.8990us  1.9410us  28.781us  cudaFuncGetAttributes
  0.01%  90.653us         4  22.663us  16.300us  28.861us  cudaCreateTextureObject
  0.01%  54.673us         7  7.8100us  1.5300us  28.416us  cudaEventRecord
  0.00%  49.083us        21  2.3370us     282ns  13.138us  cudaGetDevice
  0.00%  39.885us         7  5.6970us  3.4730us  8.2570us  cudaEventCreateWithFlags
  0.00%  38.699us        23  1.6820us     145ns  19.757us  cudaSetupArgument
  0.00%  27.183us        11  2.4710us     657ns  4.9520us  cudaConfigureCall
  0.00%  20.029us         7  2.8610us  1.1900us  3.9010us  cudaEventDestroy
  0.00%  9.1630us        11     833ns     275ns  3.1390us  cudaDeviceGetAttribute
  0.00%  9.1510us         2  4.5750us     810ns  8.3410us  cuDeviceGetCount
  0.00%     942ns         2     471ns     203ns     739ns  cuDeviceGet
  0.00%     574ns         2     287ns     143ns     431ns  cudaCreateChannelDesc
