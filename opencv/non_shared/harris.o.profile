==8569== NVPROF is profiling process 8569, command: ./harris.o
==8569== Profiling application: ./harris.o
==8569== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 37.99%  128.96us         1  128.96us  128.96us  128.96us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::zip_iterator<thrust::tuple<thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::block_iterator<float, thrust::device_malloc_allocator<float>>, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>, thrust::detail::wrapped_function<thrust::detail::binary_transform_functor<HarrisIntensityThrustFunctor>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 30.65%  104.03us        23  4.5230us  1.1840us  77.598us  [CUDA memcpy HtoD]
 27.80%  94.367us        19  4.9660us     320ns  79.103us  [CUDA memcpy DtoH]
  3.56%  12.096us         4  3.0240us  1.2160us  4.0960us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==8569== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.89%  724.93ms         8  90.617ms  9.4220us  723.89ms  cudaMalloc
  0.87%  6.3946ms         4  1.5987ms  29.784us  6.2153ms  cudaFree
  0.07%  514.69us        37  13.910us  3.1590us  193.17us  cudaMemcpyAsync
  0.06%  432.15us         5  86.430us  9.0870us  371.99us  cudaMemcpy
  0.04%  304.76us        90  3.3860us     123ns  115.67us  cuDeviceGetAttribute
  0.03%  197.25us         1  197.25us  197.25us  197.25us  cuDeviceTotalMem
  0.02%  122.44us         5  24.487us  16.260us  33.513us  cudaLaunch
  0.01%  60.208us        20  3.0100us  2.0260us  5.3250us  cudaFuncGetAttributes
  0.00%  30.037us         1  30.037us  30.037us  30.037us  cuDeviceGetName
  0.00%  11.350us         5  2.2700us  1.5900us  2.9210us  cudaEventCreateWithFlags
  0.00%  10.303us        15     686ns     307ns  1.6950us  cudaGetDevice
  0.00%  7.9930us         5  1.5980us  1.0900us  2.1300us  cudaEventRecord
  0.00%  7.9000us         5  1.5800us     450ns  5.3630us  cudaSetupArgument
  0.00%  6.8690us         5  1.3730us  1.2150us  1.6010us  cudaEventDestroy
  0.00%  5.0800us         5  1.0160us     653ns  1.5230us  cudaConfigureCall
  0.00%  4.8870us        11     444ns     327ns     845ns  cudaDeviceGetAttribute
  0.00%  1.9950us         2     997ns     317ns  1.6780us  cuDeviceGetCount
  0.00%     400ns         2     200ns     136ns     264ns  cuDeviceGet
