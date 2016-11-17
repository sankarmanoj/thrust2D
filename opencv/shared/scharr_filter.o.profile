==25696== NVPROF is profiling process 25696, command: ./scharr_filter.o
==25696== Profiling application: ./scharr_filter.o
==25696== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 35.22%  163.85us         2  81.923us  81.539us  82.308us  void thrust::transform_kernel<float, convolutionFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, convolutionFunctor)
 21.89%  101.85us        30  3.3940us     544ns  85.735us  [CUDA memcpy HtoD]
 19.97%  92.908us         1  92.908us  92.908us  92.908us  [CUDA memcpy DtoH]
  9.00%  41.891us         1  41.891us  41.891us  41.891us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<transFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  8.39%  39.041us         2  19.520us  19.312us  19.729us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::normal_iterator<thrust::device_ptr<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::unary_transform_functor<thrust::identity<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.85%  22.579us         6  3.7630us     992ns  6.3090us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.67%  3.1070us         1  3.1070us  3.1070us  3.1070us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==25696== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.24%  216.27ms        18  12.015ms  4.2210us  215.52ms  cudaMalloc
  0.22%  478.69us        12  39.891us  3.0860us  406.44us  cudaMemcpy
  0.17%  363.27us         2  181.63us  148.15us  215.12us  cudaGetDeviceProperties
  0.08%  180.93us         7  25.847us  3.7680us  64.166us  cudaFree
  0.07%  152.82us         1  152.82us  152.82us  152.82us  cuDeviceTotalMem
  0.07%  150.78us        90  1.6750us     109ns  57.011us  cuDeviceGetAttribute
  0.05%  104.75us        19  5.5130us  1.7880us  68.872us  cudaMemcpyAsync
  0.05%  99.266us        12  8.2720us  5.4260us  13.746us  cudaLaunch
  0.03%  61.805us        40  1.5450us  1.3320us  3.5970us  cudaFuncGetAttributes
  0.01%  14.402us         1  14.402us  14.402us  14.402us  cuDeviceGetName
  0.01%  11.120us        30     370ns     203ns  1.6840us  cudaGetDevice
  0.00%  9.6010us        10     960ns     644ns  1.6900us  cudaEventCreateWithFlags
  0.00%  7.6140us        10     761ns     516ns  1.5900us  cudaEventRecord
  0.00%  6.7250us        10     672ns     475ns  1.0490us  cudaEventDestroy
  0.00%  5.8950us        18     327ns     113ns  2.4280us  cudaSetupArgument
  0.00%  3.5660us        11     324ns     217ns     849ns  cudaDeviceGetAttribute
  0.00%  3.5320us        12     294ns     192ns     714ns  cudaConfigureCall
  0.00%  1.5290us         2     764ns     157ns  1.3720us  cuDeviceGetCount
  0.00%     499ns         1     499ns     499ns     499ns  cudaGetLastError
  0.00%     275ns         2     137ns     102ns     173ns  cuDeviceGet
