==23475== NVPROF is profiling process 23475, command: ./erode.o
==23475== Profiling application: ./erode.o
==23475== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 61.49%  83.049us         1  83.049us  83.049us  83.049us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::window_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::block_iterator<unsigned char, thrust::device_malloc_allocator<unsigned char>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<erodeFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 17.08%  23.065us         5  4.6130us     607ns  19.322us  [CUDA memcpy HtoD]
 13.93%  18.811us         1  18.811us  18.811us  18.811us  [CUDA memcpy DtoH]
  7.51%  10.142us         4  2.5350us  2.1120us  3.7430us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<unsigned char>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<unsigned char>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==23475== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 99.55%  327.16ms         8  40.895ms  4.7020us  326.58ms  cudaMalloc
  0.17%  560.84us         4  140.21us  4.6790us  515.47us  cudaFree
  0.10%  318.01us        90  3.5330us     119ns  124.82us  cuDeviceGetAttribute
  0.06%  201.81us         1  201.81us  201.81us  201.81us  cuDeviceTotalMem
  0.06%  189.96us         5  37.991us  4.7010us  152.75us  cudaMemcpy
  0.02%  71.390us         5  14.278us  6.2950us  27.573us  cudaLaunch
  0.01%  37.803us         1  37.803us  37.803us  37.803us  cudaMemcpyAsync
  0.01%  35.707us        20  1.7850us  1.3980us  5.1270us  cudaFuncGetAttributes
  0.01%  34.840us         1  34.840us  34.840us  34.840us  cuDeviceGetName
  0.00%  6.7930us         5  1.3580us     730ns  2.0050us  cudaEventCreateWithFlags
  0.00%  6.4770us         5  1.2950us     213ns  4.8610us  cudaSetupArgument
  0.00%  6.1870us        15     412ns     217ns  1.7070us  cudaGetDevice
  0.00%  5.3940us         5  1.0780us     592ns  1.7000us  cudaEventRecord
  0.00%  3.6340us         5     726ns     515ns  1.1150us  cudaEventDestroy
  0.00%  3.4150us        11     310ns     204ns     822ns  cudaDeviceGetAttribute
  0.00%  2.5360us         5     507ns     211ns     860ns  cudaConfigureCall
  0.00%  2.4200us         2  1.2100us     314ns  2.1060us  cuDeviceGetCount
  0.00%     602ns         2     301ns     224ns     378ns  cuDeviceGet
