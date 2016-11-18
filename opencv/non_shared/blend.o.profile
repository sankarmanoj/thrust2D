==3848== NVPROF is profiling process 3848, command: ./blend.o
==3848== Profiling application: ./blend.o
==3848== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 56.20%  172.49us         5  34.497us  1.2160us  87.876us  [CUDA memcpy HtoD]
 26.02%  79.876us         1  79.876us  79.876us  79.876us  [CUDA memcpy DtoH]
 13.53%  41.538us         1  41.538us  41.538us  41.538us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<blendFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  4.24%  13.025us         3  4.3410us  3.7760us  5.4090us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==3848== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.11%  886.55ms         6  147.76ms  7.9990us  885.11ms  cudaMalloc
  1.34%  12.085ms        90  134.28us     105ns  5.6772ms  cuDeviceGetAttribute
  0.26%  2.3683ms         1  2.3683ms  2.3683ms  2.3683ms  cuDeviceGetName
  0.16%  1.4349ms         1  1.4349ms  1.4349ms  1.4349ms  cuDeviceTotalMem
  0.04%  374.98us         4  93.745us  7.8540us  316.80us  cudaMemcpy
  0.04%  343.22us         2  171.61us  170.33us  172.88us  cudaMemcpyAsync
  0.03%  268.84us         3  89.613us  15.663us  163.38us  cudaFree
  0.01%  125.59us         4  31.397us  17.199us  43.068us  cudaLaunch
  0.01%  53.936us        16  3.3710us  1.9950us  11.243us  cudaFuncGetAttributes
  0.00%  10.460us        12     871ns     305ns  2.5720us  cudaGetDevice
  0.00%  9.3090us         4  2.3270us  1.5110us  2.6340us  cudaEventCreateWithFlags
  0.00%  8.6230us         4  2.1550us     437ns  6.1970us  cudaSetupArgument
  0.00%  7.5770us         4  1.8940us  1.3550us  2.4100us  cudaEventRecord
  0.00%  5.5690us        11     506ns     352ns  1.3360us  cudaDeviceGetAttribute
  0.00%  5.2600us         4  1.3150us     984ns  1.6240us  cudaEventDestroy
  0.00%  3.6890us         4     922ns     638ns  1.3440us  cudaConfigureCall
  0.00%  2.1510us         2  1.0750us     601ns  1.5500us  cuDeviceGetCount
  0.00%     593ns         2     296ns     231ns     362ns  cuDeviceGet
