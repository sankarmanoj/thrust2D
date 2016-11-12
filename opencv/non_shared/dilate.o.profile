==30084== NVPROF is profiling process 30084, command: ./dilate.o
==30084== Profiling application: ./dilate.o
==30084== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 36.81%  105.47us         5  21.094us  1.1840us  100.64us  [CUDA memcpy HtoD]
 29.19%  83.650us         1  83.650us  83.650us  83.650us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<dilateFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 28.10%  80.513us         1  80.513us  80.513us  80.513us  [CUDA memcpy DtoH]
  4.52%  12.960us         3  4.3200us  3.7120us  5.2480us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  1.38%  3.9680us         1  3.9680us  3.9680us  3.9680us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==30084== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.19%  591.43ms         8  73.929ms  6.1250us  590.15ms  cudaMalloc
  0.46%  2.7274ms        90  30.304us     104ns  1.3647ms  cuDeviceGetAttribute
  0.09%  540.72us         1  540.72us  540.72us  540.72us  cuDeviceGetName
  0.06%  385.41us         5  77.081us  5.5590us  320.91us  cudaMemcpy
  0.06%  361.62us         4  90.406us  17.337us  190.80us  cudaFree
  0.06%  327.98us         1  327.98us  327.98us  327.98us  cuDeviceTotalMem
  0.05%  273.90us         1  273.90us  273.90us  273.90us  cudaMemcpyAsync
  0.02%  137.66us         5  27.531us  7.7110us  46.538us  cudaLaunch
  0.01%  48.859us        20  2.4420us  1.3970us  10.468us  cudaFuncGetAttributes
  0.00%  9.6880us         5  1.9370us     744ns  3.6060us  cudaEventCreateWithFlags
  0.00%  9.5650us        15     637ns     212ns  2.4280us  cudaGetDevice
  0.00%  8.6870us         5  1.7370us     215ns  5.9390us  cudaSetupArgument
  0.00%  6.9250us         5  1.3850us     680ns  2.3070us  cudaEventRecord
  0.00%  5.8700us         5  1.1740us     507ns  2.3850us  cudaEventDestroy
  0.00%  4.3330us         5     866ns     332ns  1.3680us  cudaConfigureCall
  0.00%  3.3310us        11     302ns     202ns     946ns  cudaDeviceGetAttribute
  0.00%  3.1860us         2  1.5930us  1.2170us  1.9690us  cuDeviceGetCount
  0.00%     913ns         2     456ns     312ns     601ns  cuDeviceGet
