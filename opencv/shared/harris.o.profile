==29199== NVPROF is profiling process 29199, command: ./harris.o
==29199== Profiling application: ./harris.o
==29199== Profiling result:
Time(%)      Time     Calls       Avg       Min       Max  Name
 57.27%  262.75us         1  262.75us  262.75us  262.75us  void thrust::transform_kernel<float, HarrisIntensityFunctor>(thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>*, thrust::window_iterator<float, thrust::device_malloc_allocator<thrust::window_iterator>>, thrust::launcher_config, HarrisIntensityFunctor)
 21.64%  99.296us        24  4.1370us     576ns  72.992us  [CUDA memcpy HtoD]
 18.97%  87.009us        19  4.5790us     320ns  74.048us  [CUDA memcpy DtoH]
  2.12%  9.7280us         3  3.2420us  1.4720us  4.3840us  void thrust::system::cuda::detail::bulk_::detail::launch_by_value<unsigned int=0, thrust::system::cuda::detail::bulk_::detail::cuda_task<thrust::system::cuda::detail::bulk_::parallel_group<thrust::system::cuda::detail::bulk_::concurrent_group<thrust::system::cuda::detail::bulk_::agent<unsigned long=1>, unsigned long=0>, unsigned long=0>, thrust::system::cuda::detail::bulk_::detail::closure<thrust::system::cuda::detail::for_each_n_detail::for_each_kernel, thrust::tuple<thrust::system::cuda::detail::bulk_::detail::cursor<unsigned int=0>, thrust::device_ptr<float>, thrust::detail::wrapped_function<thrust::detail::device_generate_functor<thrust::detail::fill_functor<float>>, void>, unsigned int, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type, thrust::null_type>>>>(unsigned long=1)

==29199== API calls:
Time(%)      Time     Calls       Avg       Min       Max  Name
 98.55%  782.83ms         8  97.854ms  6.4890us  778.48ms  cudaMalloc
  0.78%  6.1940ms         1  6.1940ms  6.1940ms  6.1940ms  cudaGetDeviceProperties
  0.21%  1.6304ms        37  44.064us  3.2090us  583.80us  cudaMemcpyAsync
  0.18%  1.4625ms         3  487.50us  7.2350us  1.4293ms  cudaFree
  0.13%  1.0274ms        90  11.415us     124ns  487.07us  cuDeviceGetAttribute
  0.07%  548.11us         6  91.351us  4.9550us  466.14us  cudaMemcpy
  0.03%  273.74us         1  273.74us  273.74us  273.74us  cuDeviceTotalMem
  0.02%  149.41us         1  149.41us  149.41us  149.41us  cuDeviceGetName
  0.02%  119.25us         4  29.812us  27.954us  32.550us  cudaLaunch
  0.00%  39.556us        12  3.2960us  1.4360us  9.7900us  cudaFuncGetAttributes
  0.00%  6.5920us         3  2.1970us  1.5940us  2.5140us  cudaEventCreateWithFlags
  0.00%  6.4810us         9     720ns     211ns  2.1380us  cudaGetDevice
  0.00%  6.1580us         7     879ns     160ns  3.6900us  cudaSetupArgument
  0.00%  5.0030us         3  1.6670us  1.3710us  1.8720us  cudaEventRecord
  0.00%  4.8120us         4  1.2030us     868ns  1.6580us  cudaConfigureCall
  0.00%  4.0540us         3  1.3510us  1.1040us  1.5680us  cudaEventDestroy
  0.00%  3.6000us        11     327ns     208ns  1.2180us  cudaDeviceGetAttribute
  0.00%  2.4570us         2  1.2280us     422ns  2.0350us  cuDeviceGetCount
  0.00%     686ns         2     343ns     263ns     423ns  cuDeviceGet
  0.00%     379ns         1     379ns     379ns     379ns  cudaGetLastError
