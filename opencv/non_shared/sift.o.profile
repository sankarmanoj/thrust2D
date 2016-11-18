==4005== NVPROF is profiling process 4005, command: ./sift.o
==4005== Profiling application: ./sift.o
==4005== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 52.63%  678.72us         1  678.72us  678.72us  678.72us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<siftTransformFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 38.27%  493.49us        11  44.863us     576ns  386.42us  [CUDA memcpy HtoD]
  5.74%  73.988us         1  73.988us  73.988us  73.988us  [CUDA memcpy DtoH]
  2.55%  32.899us         5  6.5790us  1.4080us  18.049us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.81%  10.464us         3  3.4880us  1.3440us  5.0880us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==4005== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.78%  302.79ms        16  18.925ms  4.9590us  297.25ms  cudaMalloc
  0.92%  2.8413ms         8  355.16us  7.7490us  1.9994ms  cudaFree
  0.52%  1.6024ms         9  178.05us  4.7900us  1.5285ms  cudaMemcpy
  0.35%  1.0986ms         3  366.19us  40.159us  580.17us  cudaMemcpyAsync
  0.27%  829.62us        90  9.2170us     115ns  291.77us  cuDeviceGetAttribute
  0.06%  196.27us         1  196.27us  196.27us  196.27us  cuDeviceTotalMem
  0.05%  144.62us         9  16.069us  5.9570us  25.853us  cudaLaunch
  0.02%  67.070us        36  1.8630us  1.3950us  5.5200us  cudaFuncGetAttributes
  0.01%  24.085us         1  24.085us  24.085us  24.085us  cuDeviceGetName
  0.00%  14.817us        27     548ns     216ns  2.4600us  cudaGetDevice
  0.00%  11.056us         9  1.2280us     688ns  1.7570us  cudaEventCreateWithFlags
  0.00%  8.7470us         9     971ns     582ns  1.3570us  cudaEventRecord
  0.00%  8.0020us         9     889ns     506ns  1.4060us  cudaEventDestroy
  0.00%  6.3700us         9     707ns     209ns  3.5970us  cudaSetupArgument
  0.00%  4.7220us         9     524ns     201ns     983ns  cudaConfigureCall
  0.00%  3.2160us        11     292ns     208ns     629ns  cudaDeviceGetAttribute
  0.00%  2.3770us         2  1.1880us     393ns  1.9840us  cuDeviceGetCount
  0.00%     560ns         2     280ns     160ns     400ns  cuDeviceGet
