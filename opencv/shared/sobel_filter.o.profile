==10003== NVPROF is profiling process 10003, command: ./sobel_filter.o 1631
==10003== Profiling application: ./sobel_filter.o 1631
==10003== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 19.57%  8.1168ms         1  8.1168ms  8.1168ms  8.1168ms  [CUDA memcpy DtoH]
 18.94%  7.8538ms         7  1.1220ms     672ns  7.8498ms  [CUDA memcpy HtoD]
 16.59%  6.8802ms         4  1.7201ms  1.7147ms  1.7240ms  [CUDA memcpy DtoA]
 13.37%  5.5467ms         2  2.7734ms  2.7695ms  2.7772ms  void thrust::convolutionColumnsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
 11.29%  4.6832ms         2  2.3416ms  2.3355ms  2.3477ms  void thrust::convolutionRowsKernel<unsigned char>(unsigned char*, int, int, unsigned __int64)
  7.64%  3.1679ms         2  1.5840ms  1.5738ms  1.5941ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::detail::normal_iterator<thrust::device_ptr<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.94%  2.8781ms         1  2.8781ms  2.8781ms  2.8781ms  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  5.65%  2.3443ms         4  586.07us  579.52us  605.44us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==10003== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 83.80%  217.08ms        10  21.708ms  6.9410us  215.27ms  cudaMalloc
  8.35%  21.627ms         5  4.3255ms  286.40us  19.614ms  cudaMemcpy
  4.04%  10.467ms         2  5.2337ms  2.5371ms  7.9303ms  cudaMemcpyToSymbol
  3.12%  8.0795ms         1  8.0795ms  8.0795ms  8.0795ms  cudaMemcpyAsync
  0.26%  675.78us         2  337.89us  286.86us  388.92us  cudaMallocArray
  0.14%  361.84us         4  90.459us  67.167us  139.90us  cudaFree
  0.08%  199.95us        90  2.2210us     100ns  77.314us  cuDeviceGetAttribute
  0.06%  152.43us        11  13.856us  5.7690us  37.164us  cudaLaunch
  0.05%  136.68us         1  136.68us  136.68us  136.68us  cuDeviceTotalMem
  0.03%  87.680us         4  21.920us  14.386us  38.435us  cudaMemcpyToArray
  0.02%  55.863us        28  1.9950us  1.3970us  6.6770us  cudaFuncGetAttributes
  0.01%  27.065us         1  27.065us  27.065us  27.065us  cuDeviceGetName
  0.01%  24.945us         4  6.2360us  4.9420us  8.0090us  cudaCreateTextureObject
  0.00%  12.744us        21     606ns     207ns  3.6290us  cudaGetDevice
  0.00%  10.252us         7  1.4640us     628ns  2.9330us  cudaEventCreateWithFlags
  0.00%  9.5370us        23     414ns     110ns  3.6790us  cudaSetupArgument
  0.00%  8.5660us         7  1.2230us     516ns  2.1090us  cudaEventRecord
  0.00%  7.8270us        11     711ns     208ns  3.2240us  cudaConfigureCall
  0.00%  6.5680us         7     938ns     449ns  1.5310us  cudaEventDestroy
  0.00%  3.5100us        11     319ns     207ns     919ns  cudaDeviceGetAttribute
  0.00%  1.9410us         2     970ns     733ns  1.2080us  cuDeviceGetCount
  0.00%     595ns         2     297ns     279ns     316ns  cuDeviceGet
  0.00%     296ns         2     148ns     116ns     180ns  cudaCreateChannelDesc
