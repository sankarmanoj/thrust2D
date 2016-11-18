==3918== NVPROF is profiling process 3918, command: ./pyrdown.o
==3918== Profiling application: ./pyrdown.o
==3918== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 72.21%  1.5207ms        19  80.038us     320ns  1.5058ms  [CUDA memcpy DtoH]
 19.60%  412.69us         1  412.69us  412.69us  412.69us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<convolutionFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.90%  103.24us        25  4.1290us     576ns  76.323us  [CUDA memcpy HtoD]
  2.14%  44.992us         5  8.9980us  1.6000us  18.016us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.04%  21.889us         1  21.889us  21.889us  21.889us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<pyrdownTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  0.11%  2.4000us         1  2.4000us  2.4000us  2.4000us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3918== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 95.55%  928.45ms        12  77.370ms  8.6400us  922.29ms  cudaMalloc
  3.25%  31.582ms         6  5.2637ms  10.325us  31.246ms  cudaFree
  0.60%  5.8615ms        90  65.127us     113ns  2.2274ms  cuDeviceGetAttribute
  0.32%  3.1050ms         7  443.58us  9.4790us  3.0001ms  cudaMemcpy
  0.07%  724.06us         1  724.06us  724.06us  724.06us  cuDeviceGetName
  0.06%  582.12us         1  582.12us  582.12us  582.12us  cuDeviceTotalMem
  0.06%  579.10us        32  18.096us  1.9810us  481.23us  cudaFuncGetAttributes
  0.05%  466.57us        37  12.609us  3.6810us  138.63us  cudaMemcpyAsync
  0.02%  229.94us         8  28.742us  16.645us  39.599us  cudaLaunch
  0.00%  23.272us        24     969ns     342ns  3.9920us  cudaGetDevice
  0.00%  21.153us         8  2.6440us  1.1770us  9.2360us  cudaEventRecord
  0.00%  17.837us         1  17.837us  17.837us  17.837us  cudaDeviceSynchronize
  0.00%  17.760us         8  2.2200us  1.7620us  2.7120us  cudaEventCreateWithFlags
  0.00%  12.463us         8  1.5570us  1.0990us  3.1530us  cudaEventDestroy
  0.00%  10.811us         8  1.3510us     358ns  5.4160us  cudaSetupArgument
  0.00%  8.4640us         8  1.0580us     459ns  1.6270us  cudaConfigureCall
  0.00%  4.9810us        11     452ns     316ns  1.0620us  cudaDeviceGetAttribute
  0.00%  2.1810us         2  1.0900us     260ns  1.9210us  cuDeviceGetCount
  0.00%     406ns         2     203ns     130ns     276ns  cuDeviceGet
