==6037== NVPROF is profiling process 6037, command: ./affine.o
==6037== Profiling application: ./affine.o
==6037== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 40.06%  122.48us         1  122.48us  122.48us  122.48us  [CUDA memcpy DtoH]
 38.53%  117.81us        10  11.780us  1.1840us  106.90us  [CUDA memcpy HtoD]
 18.00%  55.032us         1  55.032us  55.032us  55.032us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<AffineTransformFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
  3.40%  10.398us         3  3.4660us  1.1200us  5.6950us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==6037== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.49%  579.72ms         6  96.620ms  14.056us  578.39ms  cudaMalloc
  1.19%  7.0066ms         3  2.3355ms  13.451us  6.9367ms  cudaFree
  0.10%  597.31us         4  149.33us  18.844us  489.59us  cudaMemcpy
  0.06%  370.68us         7  52.954us  4.1220us  341.64us  cudaMemcpyAsync
  0.05%  319.93us        90  3.5540us     131ns  117.03us  cuDeviceGetAttribute
  0.03%  197.14us         4  49.285us  13.918us  81.798us  cudaLaunch
  0.03%  195.66us         1  195.66us  195.66us  195.66us  cuDeviceTotalMem
  0.01%  56.256us         1  56.256us  56.256us  56.256us  cudaDeviceSynchronize
  0.01%  51.975us        16  3.2480us  1.8330us  10.741us  cudaFuncGetAttributes
  0.01%  36.826us         1  36.826us  36.826us  36.826us  cuDeviceGetName
  0.00%  14.226us         4  3.5560us     339ns  11.679us  cudaSetupArgument
  0.00%  13.406us         4  3.3510us  1.0390us  5.1400us  cudaEventCreateWithFlags
  0.00%  13.152us        12  1.0960us     292ns  4.2390us  cudaGetDevice
  0.00%  10.072us         4  2.5180us  1.0240us  3.3850us  cudaEventRecord
  0.00%  7.8150us         4  1.9530us     376ns  3.3480us  cudaConfigureCall
  0.00%  7.6460us         4  1.9110us     904ns  2.9410us  cudaEventDestroy
  0.00%  6.1520us        11     559ns     246ns  2.4940us  cudaDeviceGetAttribute
  0.00%  2.7880us         2  1.3940us     323ns  2.4650us  cuDeviceGetCount
  0.00%     526ns         2     263ns     232ns     294ns  cuDeviceGet
