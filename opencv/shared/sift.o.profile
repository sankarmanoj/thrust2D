==16820== NVPROF is profiling process 16820, command: ./sift.o
==16820== Profiling application: ./sift.o
==16820== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 63.24%  1.2385ms        12  103.21us     512ns  1.0291ms  [CUDA memcpy HtoD]
 27.54%  539.42us         1  539.42us  539.42us  539.42us  void thrust::transform_kernel<float, siftTransformFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::warp_launcher_config, siftTransformFunctor)
  7.23%  141.62us         1  141.62us  141.62us  141.62us  [CUDA memcpy DtoH]
  1.50%  29.375us         4  7.3430us  1.2480us  19.903us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.49%  9.5990us         3  3.1990us  1.4720us  5.0870us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==16820== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.52%  716.94ms        16  44.808ms  5.3800us  708.42ms  cudaMalloc
  1.55%  11.419ms        91  125.49us     101ns  5.6825ms  cuDeviceGetAttribute
  0.24%  1.7286ms         1  1.7286ms  1.7286ms  1.7286ms  cudaGetDeviceProperties
  0.20%  1.4566ms         3  485.52us  92.120us  1.1500ms  cudaMemcpyAsync
  0.12%  878.09us         7  125.44us  12.547us  290.05us  cudaFree
  0.11%  829.43us         1  829.43us  829.43us  829.43us  cuDeviceGetName
  0.07%  550.49us        10  55.049us  5.0880us  416.61us  cudaMemcpy
  0.07%  536.16us         1  536.16us  536.16us  536.16us  cudaDeviceSynchronize
  0.06%  465.36us         1  465.36us  465.36us  465.36us  cuDeviceTotalMem
  0.03%  220.14us         8  27.518us  6.4240us  50.232us  cudaLaunch
  0.01%  75.302us        28  2.6890us  1.4150us  14.225us  cudaFuncGetAttributes
  0.00%  21.862us         7  3.1230us     672ns  14.007us  cudaEventRecord
  0.00%  14.704us        21     700ns     239ns  2.8680us  cudaGetDevice
  0.00%  11.140us         7  1.5910us     836ns  2.1670us  cudaEventCreateWithFlags
  0.00%  7.5560us         7  1.0790us     610ns  1.6740us  cudaEventDestroy
  0.00%  6.8250us        11     620ns     151ns  2.6920us  cudaSetupArgument
  0.00%  5.9940us         8     749ns     246ns  2.1190us  cudaConfigureCall
  0.00%  3.8110us        11     346ns     242ns     974ns  cudaDeviceGetAttribute
  0.00%  3.2820us         3  1.0940us     224ns  2.0020us  cuDeviceGetCount
  0.00%  1.7120us         3     570ns     294ns     914ns  cuDeviceGet
