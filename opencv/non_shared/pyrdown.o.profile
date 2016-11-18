==8733== NVPROF is profiling process 8733, command: ./pyrdown.o
==8733== Profiling application: ./pyrdown.o
==8733== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 64.83%  1.1062ms        19  58.218us     320ns  1.0912ms  [CUDA memcpy DtoH]
 24.35%  415.51us         1  415.51us  415.51us  415.51us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.61%  112.80us        25  4.5110us     608ns  84.383us  [CUDA memcpy HtoD]
  2.75%  46.974us         5  9.3940us  2.8790us  18.144us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.23%  20.960us         1  20.960us  20.960us  20.960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.22%  3.7440us         1  3.7440us  3.7440us  3.7440us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8733== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.43%  285.41ms        12  23.784ms  7.5590us  283.24ms  cudaMalloc
  0.83%  2.3993ms         7  342.76us  6.5970us  2.2854ms  cudaMemcpy
  0.18%  516.56us        37  13.961us  2.1720us  219.45us  cudaMemcpyAsync
  0.17%  479.42us         6  79.903us  8.3570us  242.13us  cudaFree
  0.15%  444.98us        90  4.9440us     133ns  174.28us  cuDeviceGetAttribute
  0.08%  221.80us         1  221.80us  221.80us  221.80us  cuDeviceTotalMem
  0.08%  218.59us         8  27.324us  9.2800us  43.909us  cudaLaunch
  0.04%  109.06us        32  3.4080us  1.8120us  12.305us  cudaFuncGetAttributes
  0.02%  47.919us         1  47.919us  47.919us  47.919us  cuDeviceGetName
  0.01%  23.890us         1  23.890us  23.890us  23.890us  cudaDeviceSynchronize
  0.01%  21.082us        24     878ns     373ns  2.7030us  cudaGetDevice
  0.01%  17.617us         8  2.2020us     991ns  3.2620us  cudaEventCreateWithFlags
  0.00%  12.552us         8  1.5690us     270ns  8.5130us  cudaSetupArgument
  0.00%  12.111us         8  1.5130us     891ns  2.3410us  cudaEventRecord
  0.00%  10.607us         8  1.3250us     784ns  1.9040us  cudaEventDestroy
  0.00%  7.8440us         8     980ns     261ns  1.9320us  cudaConfigureCall
  0.00%  5.6740us        11     515ns     305ns  1.6910us  cudaDeviceGetAttribute
  0.00%  2.0380us         2  1.0190us     471ns  1.5670us  cuDeviceGetCount
  0.00%     585ns         2     292ns     248ns     337ns  cuDeviceGet
