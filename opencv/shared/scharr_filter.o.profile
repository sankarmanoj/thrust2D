==4556== NVPROF is profiling process 4556, command: ./scharr_filter.o
==4556== Profiling application: ./scharr_filter.o
==4556== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 59.97%  435.44us         2  217.72us  216.60us  218.84us  void thrust::convolve_kernel<float>(thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>&, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, thrust::block_2d<float, thrust::device_malloc_allocator<thrust::block_2d>>, int, int)
 14.09%  102.33us        28  3.6540us     576ns  72.787us  [CUDA memcpy HtoD]
 10.18%  73.939us         1  73.939us  73.939us  73.939us  [CUDA memcpy DtoH]
  5.19%  37.674us         1  37.674us  37.674us  37.674us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.70%  34.153us         2  17.076us  16.772us  17.381us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.87%  28.103us         8  3.5120us     993ns  4.8010us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.47%  10.659us         2  5.3290us  5.1210us  5.5380us  [CUDA memcpy DtoD]
  0.53%  3.8400us         1  3.8400us  3.8400us  3.8400us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4556== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.82%  244.00ms        18  13.555ms  4.4250us  242.52ms  cudaMalloc
  0.22%  533.88us         2  266.94us  261.40us  272.48us  cudaGetDeviceProperties
  0.20%  503.34us        90  5.5920us     253ns  196.15us  cuDeviceGetAttribute
  0.18%  448.01us         2  224.01us  222.84us  225.17us  cudaDeviceSynchronize
  0.18%  446.95us         1  446.95us  446.95us  446.95us  cuDeviceTotalMem
  0.12%  293.99us         7  41.997us  4.1970us  115.17us  cudaFree
  0.11%  281.14us        12  23.428us  4.9640us  209.24us  cudaMemcpy
  0.05%  113.73us        14  8.1230us  5.4910us  15.805us  cudaLaunch
  0.04%  96.050us        19  5.0550us  2.0320us  50.394us  cudaMemcpyAsync
  0.03%  79.469us        50  1.5890us  1.4110us  3.2370us  cudaFuncGetAttributes
  0.02%  45.714us         1  45.714us  45.714us  45.714us  cuDeviceGetName
  0.01%  12.550us        38     330ns     213ns  1.1990us  cudaGetDevice
  0.00%  10.063us        12     838ns     605ns  1.3170us  cudaEventCreateWithFlags
  0.00%  8.8490us        12     737ns     512ns  1.2780us  cudaEventRecord
  0.00%  7.9600us        12     663ns     509ns     974ns  cudaEventDestroy
  0.00%  7.7220us        22     351ns     114ns  3.7280us  cudaSetupArgument
  0.00%  5.2060us         2  2.6030us     626ns  4.5800us  cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags
  0.00%  4.7630us        19     250ns     205ns     725ns  cudaDeviceGetAttribute
  0.00%  3.8660us        14     276ns     144ns     862ns  cudaConfigureCall
  0.00%  2.6810us         2  1.3400us     434ns  2.2470us  cuDeviceGetCount
  0.00%     729ns         2     364ns     266ns     463ns  cuDeviceGet
  0.00%     581ns         2     290ns     239ns     342ns  cudaGetLastError
