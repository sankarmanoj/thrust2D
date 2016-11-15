==8035== NVPROF is profiling process 8035, command: ./dilate.o
==8035== Profiling application: ./dilate.o
==8035== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.67%  94.304us         6  15.717us     544ns  91.360us  [CUDA memcpy HtoD]
 39.72%  92.097us         1  92.097us  92.097us  92.097us  [CUDA memcpy DtoH]
 14.67%  34.016us         1  34.016us  34.016us  34.016us  void thrust::transform_kernel<float, dilateFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, dilateFunctor)
  3.52%  8.1600us         2  4.0800us  3.9040us  4.2560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.42%  3.2960us         1  3.2960us  3.2960us  3.2960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8035== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.07%  177.77ms         8  22.221ms  4.4260us  177.40ms  cudaMalloc
  0.26%  469.95us         6  78.325us  3.1830us  437.69us  cudaMemcpy
  0.23%  417.85us         3  139.28us  37.819us  274.63us  cudaFree
  0.12%  210.92us         1  210.92us  210.92us  210.92us  cuDeviceTotalMem
  0.12%  208.67us        90  2.3180us      94ns  96.985us  cuDeviceGetAttribute
  0.10%  171.99us         1  171.99us  171.99us  171.99us  cudaGetDeviceProperties
  0.05%  87.279us         1  87.279us  87.279us  87.279us  cudaMemcpyAsync
  0.02%  41.887us         4  10.471us  8.3020us  13.539us  cudaLaunch
  0.01%  24.173us        12  2.0140us  1.3560us  7.7040us  cudaFuncGetAttributes
  0.01%  19.183us         1  19.183us  19.183us  19.183us  cuDeviceGetName
  0.00%  4.2650us         9     473ns     199ns  1.7140us  cudaGetDevice
  0.00%  3.5880us         3  1.1960us     906ns  1.6690us  cudaEventCreateWithFlags
  0.00%  3.4200us         7     488ns     104ns  2.3460us  cudaSetupArgument
  0.00%  3.0940us        11     281ns     194ns     820ns  cudaDeviceGetAttribute
  0.00%  2.8680us         3     956ns     771ns  1.3140us  cudaEventRecord
  0.00%  2.4310us         3     810ns     647ns  1.0830us  cudaEventDestroy
  0.00%  2.0150us         2  1.0070us     467ns  1.5480us  cuDeviceGetCount
  0.00%  1.5960us         4     399ns     252ns     744ns  cudaConfigureCall
  0.00%     435ns         2     217ns     191ns     244ns  cuDeviceGet
