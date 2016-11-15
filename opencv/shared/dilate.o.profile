==13664== NVPROF is profiling process 13664, command: ./dilate.o
==13664== Profiling application: ./dilate.o
==13664== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.68%  92.482us         1  92.482us  92.482us  92.482us  [CUDA memcpy DtoH]
 39.51%  89.826us         6  14.971us     544ns  86.914us  [CUDA memcpy HtoD]
 14.67%  33.344us         1  33.344us  33.344us  33.344us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  3.60%  8.1920us         2  4.0960us  3.7440us  4.4480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.55%  3.5200us         1  3.5200us  3.5200us  3.5200us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==13664== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.34%  166.45ms         8  20.806ms  4.2030us  166.08ms  cudaMalloc
  0.22%  365.39us         6  60.897us  3.0210us  332.92us  cudaMemcpy
  0.09%  156.21us         1  156.21us  156.21us  156.21us  cuDeviceTotalMem
  0.09%  151.98us        90  1.6880us      98ns  57.519us  cuDeviceGetAttribute
  0.09%  148.25us         1  148.25us  148.25us  148.25us  cudaGetDeviceProperties
  0.06%  106.25us         3  35.417us  6.1550us  63.781us  cudaFree
  0.04%  69.887us         1  69.887us  69.887us  69.887us  cudaMemcpyAsync
  0.03%  42.483us         4  10.620us  8.6640us  14.066us  cudaLaunch
  0.01%  20.937us        12  1.7440us  1.3950us  3.7880us  cudaFuncGetAttributes
  0.01%  15.204us         1  15.204us  15.204us  15.204us  cuDeviceGetName
  0.00%  4.1870us         9     465ns     202ns  1.5140us  cudaGetDevice
  0.00%  3.8820us         3  1.2940us     960ns  1.8600us  cudaEventCreateWithFlags
  0.00%  3.3780us        11     307ns     198ns  1.0780us  cudaDeviceGetAttribute
  0.00%  3.1370us         3  1.0450us     801ns  1.5060us  cudaEventRecord
  0.00%  2.8840us         7     412ns     108ns  1.8640us  cudaSetupArgument
  0.00%  2.3990us         3     799ns     653ns  1.0330us  cudaEventDestroy
  0.00%  1.7460us         4     436ns     291ns     779ns  cudaConfigureCall
  0.00%  1.6040us         2     802ns     194ns  1.4100us  cuDeviceGetCount
  0.00%     320ns         2     160ns     129ns     191ns  cuDeviceGet
