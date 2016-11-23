==3375== NVPROF is profiling process 3375, command: ./pyrdown.o
==3375== Profiling application: ./pyrdown.o
==3375== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 68.55%  1.9834ms        19  104.39us     320ns  1.9728ms  [CUDA memcpy DtoH]
 15.68%  453.73us         1  453.73us  453.73us  453.73us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.90%  199.74us         5  39.947us  2.3690us  84.825us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  6.55%  189.56us        25  7.5820us     704ns  170.61us  [CUDA memcpy HtoD]
  2.19%  63.315us         1  63.315us  63.315us  63.315us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.12%  3.4250us         1  3.4250us  3.4250us  3.4250us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3375== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 97.95%  1.08615s        12  90.512ms  9.2140us  1.08356s  cudaMalloc
  1.47%  16.316ms        90  181.29us     140ns  9.6217ms  cuDeviceGetAttribute
  0.32%  3.5130ms         7  501.86us  11.194us  3.2601ms  cudaMemcpy
  0.06%  705.93us        37  19.079us  3.6500us  424.46us  cudaMemcpyAsync
  0.05%  531.65us         1  531.65us  531.65us  531.65us  cuDeviceTotalMem
  0.05%  518.29us         6  86.382us  16.481us  274.34us  cudaFree
  0.04%  498.14us         1  498.14us  498.14us  498.14us  cuDeviceGetName
  0.03%  325.75us         8  40.718us  13.905us  92.363us  cudaLaunch
  0.02%  200.17us        32  6.2550us  2.3550us  88.554us  cudaFuncGetAttributes
  0.00%  41.950us         1  41.950us  41.950us  41.950us  cudaDeviceSynchronize
  0.00%  25.175us         8  3.1460us  1.4500us  5.7440us  cudaEventCreateWithFlags
  0.00%  24.205us        24  1.0080us     333ns  4.2700us  cudaGetDevice
  0.00%  18.619us         8  2.3270us     992ns  4.3890us  cudaEventRecord
  0.00%  16.085us         8  2.0100us     319ns  7.3750us  cudaSetupArgument
  0.00%  14.956us         8  1.8690us     808ns  3.9890us  cudaEventDestroy
  0.00%  10.941us         8  1.3670us     499ns  2.3400us  cudaConfigureCall
  0.00%  6.8300us        11     620ns     380ns  2.2070us  cudaDeviceGetAttribute
  0.00%  2.5670us         2  1.2830us     471ns  2.0960us  cuDeviceGetCount
  0.00%     965ns         2     482ns     234ns     731ns  cuDeviceGet
