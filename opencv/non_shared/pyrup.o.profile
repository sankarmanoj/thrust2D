==30171== NVPROF is profiling process 30171, command: ./pyrup.o
==30171== Profiling application: ./pyrup.o
==30171== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.27%  105.60us         1  105.60us  105.60us  105.60us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 37.33%  97.889us        25  3.9150us     576ns  73.185us  [CUDA memcpy HtoD]
 13.30%  34.880us        19  1.8350us     320ns  18.848us  [CUDA memcpy DtoH]
  5.89%  15.456us         5  3.0910us  1.4720us  5.0880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.93%  5.0560us         1  5.0560us  5.0560us  5.0560us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrupTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.27%  3.3280us         1  3.3280us  3.3280us  3.3280us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30171== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.75%  268.19ms        12  22.349ms  4.7330us  266.71ms  cudaMalloc
  0.55%  1.5060ms        90  16.732us     122ns  696.67us  cuDeviceGetAttribute
  0.31%  832.68us         6  138.78us  5.8710us  457.29us  cudaFree
  0.12%  321.15us        37  8.6790us  2.1110us  58.150us  cudaMemcpyAsync
  0.10%  279.16us         7  39.879us  4.8900us  234.61us  cudaMemcpy
  0.08%  228.17us         1  228.17us  228.17us  228.17us  cuDeviceTotalMem
  0.03%  85.738us         8  10.717us  5.7210us  27.793us  cudaLaunch
  0.02%  57.655us        32  1.8010us  1.4020us  9.2770us  cudaFuncGetAttributes
  0.02%  42.301us         1  42.301us  42.301us  42.301us  cuDeviceGetName
  0.00%  9.5060us        24     396ns     215ns  2.0090us  cudaGetDevice
  0.00%  7.6440us         8     955ns     644ns  1.9180us  cudaEventCreateWithFlags
  0.00%  6.6110us         8     826ns     549ns  1.3290us  cudaEventRecord
  0.00%  6.1440us         8     768ns     184ns  4.2920us  cudaSetupArgument
  0.00%  5.1390us         8     642ns     469ns  1.0680us  cudaEventDestroy
  0.00%  3.0690us        11     279ns     204ns     750ns  cudaDeviceGetAttribute
  0.00%  2.6350us         2  1.3170us     487ns  2.1480us  cuDeviceGetCount
  0.00%  2.6330us         8     329ns     198ns     809ns  cudaConfigureCall
  0.00%     482ns         2     241ns     196ns     286ns  cuDeviceGet
