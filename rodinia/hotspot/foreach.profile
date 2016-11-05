==9401== NVPROF is profiling process 9401, command: ./hotspot_foreach.out 1024 2 2 temp_1024 power_1024 result_foreach.out
==9401== Profiling application: ./hotspot_foreach.out 1024 2 2 temp_1024 power_1024 result_foreach.out
==9401== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 47.16%  859.39us         4  214.85us  1.2160us  431.41us  [CUDA memcpy HtoD]
 27.43%  499.86us         1  499.86us  499.86us  499.86us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::window_iterator<float, thrust::device_malloc_allocator<float>>, thrust::detail::wrapped_function<HotspotFunctor, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)
 23.29%  424.37us         1  424.37us  424.37us  424.37us  [CUDA memcpy DtoH]
  2.12%  38.564us         2  19.282us  18.626us  19.938us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==9401== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.84%  238.07ms         4  59.518ms  5.2830us  237.41ms  cudaMalloc
  0.47%  1.1219ms         3  373.96us  9.7830us  1.0928ms  cudaMemcpy
  0.37%  880.34us         2  440.17us  432.75us  447.59us  cudaMemcpyAsync
  0.10%  247.24us        90  2.7470us     106ns  96.582us  cuDeviceGetAttribute
  0.09%  227.43us         2  113.71us  78.373us  149.05us  cudaFree
  0.08%  188.69us         1  188.69us  188.69us  188.69us  cuDeviceTotalMem
  0.01%  31.244us         3  10.414us  9.1760us  12.823us  cudaLaunch
  0.01%  28.227us         1  28.227us  28.227us  28.227us  cuDeviceGetName
  0.01%  20.292us        12  1.6910us  1.3830us  3.4350us  cudaFuncGetAttributes
  0.01%  17.061us         2  8.5300us     653ns  16.408us  cudaEventCreate
  0.00%  5.4540us         4  1.3630us     714ns  2.7960us  cudaEventRecord
  0.00%  4.5660us         9     507ns     215ns  1.6700us  cudaGetDevice
  0.00%  3.2000us         3  1.0660us     892ns  1.4010us  cudaEventCreateWithFlags
  0.00%  3.1360us        11     285ns     207ns     825ns  cudaDeviceGetAttribute
  0.00%  2.0450us         3     681ns     542ns     884ns  cudaEventDestroy
  0.00%  1.8990us         2     949ns     638ns  1.2610us  cuDeviceGetCount
  0.00%  1.2560us         3     418ns     289ns     628ns  cudaConfigureCall
  0.00%  1.0990us         3     366ns     255ns     556ns  cudaSetupArgument
  0.00%     416ns         2     208ns     187ns     229ns  cuDeviceGet
